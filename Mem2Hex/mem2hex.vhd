----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:50 06/05/2021 
-- Design Name: 
-- Module Name:    mem2hex - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- https://hackaday.io/project/181664-intel-hex-file-inputoutput-for-fpgas/log/197808-mem2hex-component-read-from-memory-and-generate-hex-character-stream
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.mem2hex_code.all;
use work.mem2hex_map.all;

entity mem2hex is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  --
   		  debug: out STD_LOGIC_VECTOR(15 downto 0);
			  --
           nRD : out  STD_LOGIC;
           nBUSREQ : out  STD_LOGIC;
           nBUSACK : in  STD_LOGIC;
           nWAIT : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : in  STD_LOGIC_VECTOR (7 downto 0);
           START : in  STD_LOGIC;
			  BUSY: out STD_LOGIC;
           PAGE : in  STD_LOGIC_VECTOR (7 downto 0);
           COUNTSEL : in  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           CHAR : buffer  STD_LOGIC_VECTOR (7 downto 0));
end mem2hex;

architecture Behavioral of mem2hex is

component mem2hex_control_unit is
     Generic (
            CODE_DEPTH : positive;
            IF_WIDTH : positive
          );
     Port ( 
          -- standard inputs
          reset : in  STD_LOGIC;
          clk : in  STD_LOGIC;
          -- design specific inputs
          seq_cond : in  STD_LOGIC_VECTOR (IF_WIDTH - 1 downto 0);
          seq_then : in  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
          seq_else : in  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
			 seq_fork : in  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
          cond : in  STD_LOGIC_VECTOR (2 ** IF_WIDTH - 1 downto 0);
          -- outputs
          ui_nextinstr : buffer  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0);
          ui_address : out  STD_LOGIC_VECTOR (CODE_DEPTH - 1 downto 0));
end component;

type lookup is array(0 to 15) of std_logic_vector(7 downto 0);
constant hex2ascii: lookup := (
	std_logic_vector(to_unsigned(natural(character'pos('0')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('1')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('2')), 8)), 	
	std_logic_vector(to_unsigned(natural(character'pos('3')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('4')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('5')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('6')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('7')), 8)),
	std_logic_vector(to_unsigned(natural(character'pos('8')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('9')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('A')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('B')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('C')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('D')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('E')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('F')), 8))
);

-- control unit
signal ui_address: std_logic_vector(CODE_ADDRESS_WIDTH - 1 downto 0);
signal ui_nextinstr: std_logic_vector(CODE_ADDRESS_WIDTH - 1 downto 0);

-- internal regs
signal mem_page: std_logic_vector(2 downto 0); -- 8 pages, 8k each
signal mem_addr: std_logic_vector(12 downto 0); 
signal checksum: std_logic_vector(15 downto 0); 
signal d: std_logic_vector(7 downto 0);
signal count: std_logic_vector(7 downto 0);
signal start_pulse: std_logic;

-- internal signals
signal mem_addr_is_zero, count_is_zero, page_match, page_is_zero: std_logic;
signal hex: std_logic_vector(3 downto 0);
signal ascii: std_logic_vector(7 downto 0);
signal checksum_y, checksum_r, checksum_s: std_logic_vector(15 downto 0);

begin

debug <= CHAR & "00" & ui_address;

m2h_instructionstart <= m2h_mapper(to_integer(unsigned(PAGE))); -- reuse 8-bits that select 8k blocks as simple (and inefficient) way to detect "noop"
m2h_uinstruction <= m2h_microcode(to_integer(unsigned(ui_address))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

cu_m2h: mem2hex_control_unit
     Generic map (
            CODE_DEPTH => CODE_ADDRESS_WIDTH,
            IF_WIDTH => CODE_IF_WIDTH
          )
     Port map ( 
          -- standard inputs
          reset => reset,
          clk => clk,
          -- design specific inputs
          seq_cond => m2h_seq_cond,
          seq_then => m2h_seq_then,
          seq_else => m2h_seq_else,
          seq_fork => m2h_instructionstart,
			 -- condition bits
			  cond(seq_cond_true) => '1',
			  cond(seq_cond_nWAIT) => nWAIT,
			  cond(seq_cond_nBUSACK) => nBUSACK,
			  cond(seq_cond_START) => start_pulse,
			  cond(seq_cond_page_match) => page_match,
			  cond(seq_cond_mem_addr_is_zero) => mem_addr_is_zero,
			  cond(seq_cond_count_is_zero) => count_is_zero,
			  cond(seq_cond_TXDREADY) => TXDREADY,
			  cond(seq_cond_TXDSEND) => '1',		-- HACKHACK (this will generate pulse for sending the char)
			  cond(seq_cond_page_is_zero) => page_is_zero,
			  cond(10) => '1',
			  cond(11) => '1',
			  cond(12) => '1',
			  cond(13) => '1',
			  cond(14) => '1',
			  cond(seq_cond_false) => '0',
          -- outputs
          ui_nextinstr => ui_nextinstr,
          ui_address => ui_address
		);

-- conditions
mem_addr_is_zero <= '1' when (mem_addr = "0000000000000") else '0';	-- 8k per page
count_is_zero <= '1' when (count = X"00") else '0';
page_match <= PAGE(to_integer(unsigned(mem_page))); 						-- each bit selects 1 8k page
page_is_zero <= '1' when (mem_page = "000") else '0';						-- 8 pages

-- start signal is rising-edge triggered
on_START: process(reset, START, m2h_BUSY)
begin 
	if ((reset or m2h_BUSY) = '1') then
		start_pulse <= '0';
	else
		if (rising_edge(START)) then
			start_pulse <= '1';
		end if;
	end if;
end process;

-- hack that saves 1 microcode bit width
TXDSEND <= '1' when (unsigned(m2h_seq_cond) = seq_cond_TXDSEND) else '0';

---- Start boilerplate code (use with utmost caution!)
nBUSREQ <= m2h_nBUSREQ;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
nRD <= m2h_nRD when (nBUSACK = '0') else 'Z';
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
BUSY <= m2h_BUSY;
---- End boilerplate code

ABUS <= mem_page & mem_addr when (nBUSACK = '0') else "ZZZZZZZZZZZZZZZZ";

-- Start boilerplate code (use with utmost caution!)
	update_mem_page: process(clk, m2h_mem_page, reset)
	begin
		if (reset = '1') then
			mem_page <= (others => '0');
		else
			if (rising_edge(clk)) then
				case m2h_mem_page is
		--			when mem_page_same =>
		--				mem_page <= mem_page;
					when mem_page_zero =>
						mem_page <= (others => '0');
					when mem_page_inc =>
						mem_page <= std_logic_vector(unsigned(mem_page) + 1);
					when others =>
						null;
				end case;
			end if;
		end if;
	end process;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
	update_mem_addr: process(clk, m2h_mem_addr, reset)
	begin
		if (reset = '1') then
			mem_addr <= (others => '0');
		else
			if (rising_edge(clk)) then
				case m2h_mem_addr is
				--			when mem_addr_same =>
				--				mem_addr <= mem_addr;
					when mem_addr_zero =>
						mem_addr <= (others => '0');
					when mem_addr_inc =>
						mem_addr <= std_logic_vector(unsigned(mem_addr) + 1);
					when others =>
						null;
				end case;
			end if;
		end if;
	end process;
---- End boilerplate code	

---- Start boilerplate code (use with utmost caution!)
	update_count: process(clk, m2h_count)
	begin
		if (rising_edge(clk)) then
			case m2h_count is
		--			when count_same =>
		--				count <= count;
				when count_load =>
					count <= "00" & COUNTSEL & (not COUNTSEL) & "0000"; -- 32 or 16
				when count_dec =>
					count <= std_logic_vector(unsigned(count) - 1);
				when count_zero =>
					count <= (others => '0');
				when others =>
					null;
			end case;
		end if;
	end process;
---- End boilerplate code

-- checksum done using 16-bit adder
		update_checksum: process(clk, checksum_y)
		begin
			if (rising_edge(clk)) then
				checksum <= checksum_y;
			end if;
		end process;

with m2h_checksum select checksum_r <= 
					not(checksum) when checksum_complement,
					X"0000" when checksum_count,
					X"0000" when checksum_zero,
					checksum when others;

with m2h_checksum select checksum_s <= 
					X"00" & count when checksum_count,
					X"00" & mem_page & mem_addr(12 downto 8) when checksum_add_addr_msb,
					X"00" & mem_addr(7 downto 0) when checksum_add_addr_lsb,
					X"00" & d when checksum_add_d,
					X"0001" when checksum_complement,
					X"0000" when others;

checksum_y <= std_logic_vector(unsigned(checksum_r) + unsigned(checksum_s));

---- Start boilerplate code (use with utmost caution!)
		update_d: process(clk, m2h_d)
		begin
			if (rising_edge(clk)) then
				case m2h_d is
			--			when d_same =>
			--				d <= d;
					when d_dbus =>
						d <= DBUS;
					when d_zero =>
						d <= (others => '0');
					when d_one =>
						d <= X"01";
					when others =>
						null;
				end case;
			end if;
		end process;
---- End boilerplate code

-- Start boilerplate code (use with utmost caution!)
		update_CHAR: process(clk, m2h_CHAR, reset)
		begin
			if (reset = '1') then
				CHAR <= (others => '0');
			else
				if (rising_edge(clk)) then
					case m2h_CHAR is
						when CHAR_same =>
							CHAR <= CHAR;
						when CHAR_char_colon =>
							CHAR <= std_logic_vector(to_unsigned(natural(character'pos(':')), 8));
						when CHAR_char_space =>
							CHAR <= std_logic_vector(to_unsigned(natural(character'pos(' ')), 8));
						when CHAR_char_cr =>
							CHAR <= X"0D";
						when CHAR_char_lf =>
							CHAR <= X"0A";
						when CHAR_zero =>
							CHAR <= (others => '0');
						when others =>
							CHAR <= ascii; -- go through lookup table
					end case;
				end if;
			end if;
		end process;
-- End boilerplate code

ascii <= hex2ascii(to_integer(unsigned(hex)));

with m2h_CHAR select hex <= 
		d(7 downto 4) when CHAR_d_hi,
		d(3 downto 0) when CHAR_d_lo,
		"00" & count(5 downto 4) when CHAR_count_hi,
		count(3 downto 0) when CHAR_count_lo,
		mem_page & mem_addr(12) when CHAR_addr_msb_hi,
		mem_addr(11 downto 8) when CHAR_addr_msb_lo,
		mem_addr(7 downto 4) when CHAR_addr_lsb_hi,
		mem_addr(3 downto 0) when CHAR_addr_lsb_lo,
		checksum(7 downto 4) when CHAR_checksum_hi,
		checksum(3 downto 0) when CHAR_checksum_lo,
		X"0" when others;

end Behavioral;
