----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:50 08/05/2021 
-- Design Name: 
-- Module Name:    hex2mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- https://hackaday.io/project/181664-intel-hex-file-inputoutput-for-fpgas/log/197807-hex2mem-component-accept-hex-character-stream-and-write-to-memory
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

use work.hex2mem_code.all;
use work.hex2mem_map.all;

entity hex2mem is
    Port ( clk : in  STD_LOGIC;
           reset_in : in  STD_LOGIC;
			  reset_out: buffer STD_LOGIC;
			  reset_page: in STD_LOGIC_VECTOR(7 downto 0);
			  --
   		  debug: out STD_LOGIC_VECTOR(15 downto 0);
			  --
           nWR : out  STD_LOGIC;
           nBUSREQ : out  STD_LOGIC;
           nBUSACK : in  STD_LOGIC;
           nWAIT : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : out  STD_LOGIC_VECTOR (7 downto 0);
			  BUSY: out STD_LOGIC;
			  --
			  HEXIN_READY: in STD_LOGIC;
			  HEXIN_CHAR: in STD_LOGIC_VECTOR (7 downto 0);
			  HEXIN_ZERO: buffer STD_LOGIC;
			  --
			  TRACE_ERROR: in STD_LOGIC;
			  TRACE_WRITE: in STD_LOGIC;
			  TRACE_CHAR: in STD_LOGIC;
           ERROR : buffer  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           TXDCHAR : buffer  STD_LOGIC_VECTOR (7 downto 0));
end hex2mem;

architecture Behavioral of hex2mem is

component adder16 is
    Port ( cin : in  STD_LOGIC;
           a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           na : in  STD_LOGIC;
           nb : in  STD_LOGIC;
           bcd : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (15 downto 0);
           cout : out  STD_LOGIC);
end component;

component hex2mem_control_unit is
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

-- TODO: move to a package
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

-- internal RAM is 64*8, enough to hold a 32 byte record. Locations are:
--	0x3B - colon (position only, not actually stored)
constant ptr_colon: std_logic_vector(5 downto 0) 	:= "111011";
-- 0x3C - length (usually 0x10)
constant ptr_len: std_logic_vector(5 downto 0) := "111100";
--	0x3D - address, high byte
constant ptr_addr_hi: std_logic_vector(5 downto 0) := "111101";
--	0x3E - address, low byte
constant ptr_addr_lo: std_logic_vector(5 downto 0) := "111110";
--	0x3F - type (usually 0x00)
constant ptr_type: std_logic_vector(5 downto 0) 	:= "111111";
--	0x00 - <length - 1> - data bytes from the HEX file record
--  <length> - checksum value (lower byte)
type ram64x8 is array(0 to 63) of std_logic_vector(7 downto 0);
signal data: ram64x8;
signal ram: std_logic_vector(7 downto 0);
signal ram_addr: std_logic_vector(5 downto 0);
signal ram_ext: std_logic_vector(15 downto 0);

-- control unit
signal ui_address: std_logic_vector(CODE_ADDRESS_WIDTH - 1 downto 0);
signal ui_nextinstr: std_logic_vector(CODE_ADDRESS_WIDTH -1  downto 0);

-- internal regs
signal checksum: std_logic_vector(15 downto 0); 
signal input: std_logic_vector(7 downto 0); -- current 
signal prev_is_crorlf, prev_is_spaceortab: std_logic; -- remember previous inputs
signal poscnt: std_logic_vector(15 downto 0);
signal lincnt: std_logic_vector(15 downto 0);
signal hexcnt: std_logic_vector(6 downto 0);	-- hexcnt(0) selects upper or lower hex nibble in the data byte
alias  bytecnt: std_logic_vector(5 downto 0) is hexcnt(6 downto 1); -- 64 bytes RAM
signal address: std_logic_vector(15 downto 0);
alias block8k: std_logic_vector(2 downto 0) is address(15 downto 13);
signal errcode: std_logic_vector(2 downto 0);

-- internal signals
signal input_is_zero, bytecnt_at_colon, compa_equals_compb: std_logic;
signal hexout, flags: std_logic_vector(3 downto 0);
signal compa, compb: std_logic_vector(7 downto 0);
signal ascii: std_logic_vector(7 downto 0);
signal poscnt_a, poscnt_sum: std_logic_vector(15 downto 0);
signal lincnt_a, lincnt_sum: std_logic_vector(15 downto 0);
alias hexin: std_logic_vector(3 downto 0) is h2m_instructionstart(3 downto 0);
signal lin_chk: std_logic_vector(15 downto 0);
signal pos_ram: std_logic_vector(7 downto 0);
signal resetout_done: std_logic;
signal txdready_sync: std_logic;

begin

debug <= input & "0" & ui_address;
--debug <= input & TXDCHAR;

h2m_instructionstart <= h2m_mapper(to_integer(unsigned(input))); -- hex char input is the "instruction"
h2m_uinstruction <= h2m_microcode(to_integer(unsigned(ui_address))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

cu_h2m: hex2mem_control_unit
     Generic map (
            CODE_DEPTH => CODE_ADDRESS_WIDTH,
            IF_WIDTH => CODE_IF_WIDTH
          )
     Port map ( 
          -- standard inputs
          reset => reset_in,
          clk => clk,
          -- design specific inputs
          seq_cond => h2m_seq_cond,
          seq_then => h2m_seq_then,
          seq_else => h2m_seq_else,
          seq_fork => h2m_instructionstart,
			 -- condition bits
			  cond(seq_cond_true) => '1',
			  cond(seq_cond_nWAIT) => nWAIT,
			  cond(seq_cond_nBUSACK) => nBUSACK,
			  cond(seq_cond_input_is_zero) => HEXIN_ZERO,
			  cond(seq_cond_TXDREADY) => txdready_sync,
			  cond(seq_cond_TXDSEND) => '1', -- HACKHACK (this will generate pulse for sending the char)
			  cond(seq_cond_TRACE_ERROR) => TRACE_ERROR,
			  cond(seq_cond_TRACE_WRITE) => TRACE_WRITE,
			  cond(seq_cond_TRACE_CHAR) => TRACE_CHAR,
			  cond(seq_cond_bytecnt_at_colon) => bytecnt_at_colon,
			  cond(seq_cond_hexcnt_is_odd) => hexcnt(0),
			  cond(seq_cond_prev_is_crorlf) => prev_is_crorlf,
			  cond(seq_cond_prev_is_spaceortab) => prev_is_spaceortab,
			  cond(seq_cond_compa_equals_compb) => compa_equals_compb,
			  cond(seq_cond_resetout_done) => '1',	-- HACKHACK (this will generate pulse to clear reset_out)
			  cond(seq_cond_false) => '0',
          -- outputs
          ui_nextinstr => ui_nextinstr,
          ui_address => ui_address
		);

-- sync external signals to catch them at the end of cycle for condition check
sync: process(clk)
begin
	if (rising_edge(clk)) then
		txdready_sync <= TXDREADY;
	end if;
end process;

-- conditions
HEXIN_ZERO <= '1' when (input = X"00") else '0';
bytecnt_at_colon <= '1' when (bytecnt = ptr_colon) else '0';
compa_equals_compb <= '1' when (compa = compb) else '0';

-- hack that saves 1 microcode bit width
TXDSEND <= '1' when (unsigned(h2m_seq_cond) = seq_cond_TXDSEND) else '0';

---- Start boilerplate code (use with utmost caution!)
nBUSREQ <= h2m_nBUSREQ;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
nWR <= h2m_nWR when (nBUSACK = '0') else 'Z';
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
BUSY <= h2m_BUSY;
---- End boilerplate code

ABUS <= address when (nBUSACK = '0') else "ZZZZZZZZZZZZZZZZ";

DBUS <= ram when (nBUSACK = '0') else "ZZZZZZZZ";

---- Start boilerplate code (use with utmost caution!)
 update_TXDCHAR: process(clk, h2m_TXDCHAR)
 begin
	if (rising_edge(clk)) then
		case h2m_TXDCHAR is
			when TXDCHAR_same =>
				TXDCHAR <= TXDCHAR;
			when TXDCHAR_char_F =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('F')), 8));
			when TXDCHAR_char_space =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos(' ')), 8));
			when TXDCHAR_char_cr =>
				TXDCHAR <= X"0D";
			when TXDCHAR_char_lf =>
				TXDCHAR <= X"0A";
			when TXDCHAR_char_E =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('E')), 8));
			when TXDCHAR_char_R =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('R')), 8));
			when TXDCHAR_char_I =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('I')), 8));
			when TXDCHAR_char_B =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('B')), 8));
			when TXDCHAR_char_A =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('A')), 8));
			when TXDCHAR_char_C =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('C')), 8));
			when TXDCHAR_char_EQU =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('=')), 8));
			when TXDCHAR_char_open =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('[')), 8));
			when TXDCHAR_char_close =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos(']')), 8));
			when TXDCHAR_zero =>
				TXDCHAR <= (others => '0');
			when others =>
				TXDCHAR <= ascii;	-- go through lookup table
		end case;
 end if;
end process;
---- End boilerplate code

lin_chk <= lincnt when (ERROR = '1') else checksum; -- saves input on the MUX below
pos_ram <= poscnt(7 downto 0) when (ERROR = '1') else ram; -- saves input on the MUX below
flags <= prev_is_spaceortab & prev_is_crorlf & bytecnt_at_colon & hexcnt(0); 

with h2m_TXDCHAR select hexout <= 
			pos_ram(3 downto 0) when TXDCHAR_pos_ram0,
			pos_ram(7 downto 4) when TXDCHAR_pos_ram1,
			input(3 downto 0) when TXDCHAR_inp0,
			input(7 downto 4) when TXDCHAR_inp1,
			lin_chk(3 downto 0) when TXDCHAR_lin_chk0,
			lin_chk(7 downto 4) when TXDCHAR_lin_chk1,
			lin_chk(11 downto 8) when TXDCHAR_lin_chk2,
			lin_chk(15 downto 12) when TXDCHAR_lin_chk3,
			bytecnt(3 downto 0) when TXDCHAR_bytecnt0,
			"00" & bytecnt(5 downto 4) when TXDCHAR_bytecnt1,
			address(3 downto 0) when TXDCHAR_addr0,
			address(7 downto 4) when TXDCHAR_addr1,
			address(11 downto 8) when TXDCHAR_addr2,
			address(15 downto 12) when TXDCHAR_addr3,
			flags when TXDCHAR_flags,
			'0' & errcode when TXDCHAR_errcode,
			X"F" when others;
			
ascii <= hex2ascii(to_integer(unsigned(hexout)));

---- Start boilerplate code (use with utmost caution!)
 update_hexcnt: process(clk, h2m_hexcnt)
 begin
	if (rising_edge(clk)) then
		case h2m_hexcnt is
--			when hexcnt_same =>
--				hexcnt <= hexcnt;
			when hexcnt_inc =>
				hexcnt <= std_logic_vector(unsigned(hexcnt) + 1);
			when hexcnt_ptr_colon =>
				hexcnt <= ptr_colon & '0';
			when hexcnt_ptr_len =>
				hexcnt <= ptr_len & '0';
			when hexcnt_ptr_type =>
				hexcnt <= ptr_type & '0';
			when hexcnt_zero =>
				hexcnt <= (others => '0');
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code

-- Line BCD counter
lincnt_a <= (others => '0') when (h2m_lincnt_a = lincnt_a_zero) else lincnt;

lincnt_add: adder16 Port map ( 
				cin => h2m_lincnt_cin,
				a => lincnt_a,
				b => X"0000",
				na => '0',
				nb => '0',
				bcd => '1',
				y => lincnt_sum,
				cout => open
			);

update_lincnt: process(clk, lincnt_sum)
begin
	if (rising_edge(clk)) then
		lincnt <= lincnt_sum;
	end if;
end process;
			
-- Position BCD counter
poscnt_a <= (others => '0') when (h2m_poscnt_a = poscnt_a_zero) else poscnt;

poscnt_add: adder16 Port map ( 
				cin => h2m_poscnt_cin,
				a => poscnt_a,
				b => X"0000",
				na => '0',
				nb => '0',
				bcd => '1',
				y => poscnt_sum,
				cout => open
			);

update_poscnt: process(clk, poscnt_sum)
begin
	if (rising_edge(clk)) then
		poscnt <= poscnt_sum;
	end if;
end process;

---- Start boilerplate code (use with utmost caution!)
 with h2m_ram_addr select ram_addr <=
      --bytecnt when ram_addr_bytecnt, -- default value
      ptr_len when ram_addr_ptr_len,
      ptr_addr_hi when ram_addr_ptr_addr_hi,
      ptr_addr_lo when ram_addr_ptr_addr_lo,
      ptr_type when ram_addr_ptr_type,
      bytecnt when others;
---- End boilerplate code

ram <= data(to_integer(unsigned(ram_addr)));

update_data: process(clk, h2m_ram_write, ram, hexin)
begin
	if (rising_edge(clk)) then
		if (h2m_ram_write = '1') then
			data(to_integer(unsigned(ram_addr))) <= ram(3 downto 0) & hexin;
		end if;
	end if;
end process;

ram_ext <= X"00" & ram;
---- Start boilerplate code (use with utmost caution!)
 update_checksum: process(clk, h2m_checksum, ram_ext)
 begin
	if (rising_edge(clk)) then
		case h2m_checksum is
--			when checksum_same =>
--				checksum <= checksum;
			when checksum_zero =>
				checksum <= (others => '0');
			when checksum_add_ram =>
				checksum <= std_logic_vector(unsigned(checksum) + unsigned(ram_ext));
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
 update_address: process(clk, h2m_address)
 begin
	if (rising_edge(clk)) then
		case h2m_address is
--			when address_same =>
--				address <= address;
			when address_inc =>
				address <= std_logic_vector(unsigned(address) + 1);
			when address_shift8ram =>
				address <= address(7 downto 0) & ram;
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code

ERROR <= '0' when (errcode = errcode_ok) else '1';
-- Start boilerplate code (use with utmost caution!)
 update_errcode: process(clk, h2m_errcode)
 begin
	if (rising_edge(clk)) then
		case h2m_errcode is
			when errcode_ok =>
				errcode <= errcode_ok;
			when errcode_err_badchar =>
				errcode <= errcode_err_badchar;
			when errcode_err_unexpected =>
				errcode <= errcode_err_unexpected;
			when errcode_err_badchecksum =>
				errcode <= errcode_err_badchecksum;
			when errcode_err_badrecordtype =>
				errcode <= errcode_err_badrecordtype;
			when errcode_err_badrecordlength =>
				errcode <= errcode_err_badrecordlength;
--			when errcode_same =>
--				errcode <= errcode;
			when others =>
				null;
		end case;
 end if;
 end process;
-- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
compa <= checksum(7 downto 0) when (h2m_compa = compa_checksum_lsb) else ram;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
 with h2m_compb select compb <=
--      (others => '0') when compb_zero, -- default value
      X"01" when compb_one,
      "00" & bytecnt when compb_bytecnt,
      "00" & std_logic_vector(unsigned(bytecnt) - 1) when compb_bytecnt_dec,
		(others => '0') when others; 
---- End boilerplate code

-- input register is clocked by ser 2 par UART, and cleared by reset or internal signal
on_hexin_ready: process(reset_in, h2m_input_reset, HEXIN_READY, HEXIN_CHAR, input)
begin
	--if ((reset_in or h2m_input_reset) = '1') then
	if ((reset_in or h2m_input_reset) = '1') then
		input <= X"00"; --'0' & ui_address; --X"00";
		prev_is_spaceortab <= reset_in;
		prev_is_crorlf <= reset_in;
	else
		if (rising_edge(HEXIN_READY)) then
			input <= HEXIN_CHAR;
			-- set some flags based on previously received character
			case (input) is
				when X"0A"|X"0D" =>
					prev_is_spaceortab <= '0';
					prev_is_crorlf <= '1';
				when X"20"|X"09" =>
					prev_is_spaceortab <= '1';
					prev_is_crorlf <= '0';
				when others =>
					prev_is_spaceortab <= '0';
					prev_is_crorlf <= '0';
			end case;
		end if;
	end if;
end process;

-- reset out logic
-- hack that saves 1 microcode bit width
resetout_done <= '1' when (unsigned(h2m_seq_cond) = seq_cond_resetout_done) else '0';
on_h2m_nWR: process(reset_in, resetout_done, h2m_nWR)
begin
	if ((reset_in or resetout_done) = '1') then
		reset_out <= '0';
	else
		if (falling_edge(h2m_nWR)) then
			reset_out <= reset_page(to_integer(unsigned(block8k)));
		end if;
	end if;
end process;
			
end Behavioral;
