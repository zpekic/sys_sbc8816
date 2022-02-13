----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:50 02/06/2022 
-- Design Name: 
-- Module Name:    hexcalc - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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
use work.sbc8816_package.all;

use work.hexcalc_code.all;
use work.hexcalc_map.all;

entity hexcalc is
    Port ( -- GENERIC
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  status : out STD_LOGIC_VECTOR(1 downto 0);
			  -- DEBUG
   		  dbg: out STD_LOGIC_VECTOR(15 downto 0);
   		  dbg_row: in STD_LOGIC_VECTOR(3 downto 0);
   		  dbg_col: in STD_LOGIC_VECTOR(3 downto 0);
   		  dbg_reg: out STD_LOGIC_VECTOR(3 downto 0);
			  -- MATRIX CONTROL
			  mt_ctrl: out STD_LOGIC_VECTOR(9 downto 0);
			  -- MATRIX DATA
			  mt_x: out STD_LOGIC_VECTOR(15 downto 0);
			  mt_y: in STD_LOGIC_VECTOR(15 downto 0);
			  -- INSTRUCTION
			  input: in STD_LOGIC_VECTOR(7 downto 0);
			  clear: out STD_LOGIC;
			  -- TRACING
			  TRACE_ERROR: in STD_LOGIC;
			  TRACE_CHAR: in STD_LOGIC;
           ERROR : buffer  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           TXDCHAR : buffer  STD_LOGIC_VECTOR (7 downto 0));
end hexcalc;

architecture Behavioral of hexcalc is

component shiftreg is
    Port ( clk : in  STD_LOGIC;
           opr : in  STD_LOGIC_VECTOR (1 downto 0);
           so : out  STD_LOGIC;
           si : in  STD_LOGIC;
           hexsel : in  STD_LOGIC_VECTOR (1 downto 0);
           hexout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component shiftregp is
    Port ( clk : in  STD_LOGIC;
           opr : in  STD_LOGIC_VECTOR (1 downto 0);
           so : out  STD_LOGIC;
           si : in  STD_LOGIC;
			  pi : in  STD_LOGIC_VECTOR(15 downto 0);
           hexsel : in  STD_LOGIC_VECTOR (1 downto 0);
           hexout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component hexcalc_control_unit is
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


-- control unit
signal ui_address: std_logic_vector(CODE_ADDRESS_WIDTH - 1 downto 0);
signal ui_nextinstr: std_logic_vector(CODE_ADDRESS_WIDTH -1  downto 0);


-- internal signals
signal ascii: std_logic_vector(7 downto 0);
signal hexout: std_logic_vector(3 downto 0);
signal errcode: std_logic_vector(2 downto 0);

-- conditions
signal input_is_zero, bitcnt_is_zero: std_logic;

-- just for visualisation
type table_16x4 is array (0 to 15) of std_logic_vector(3 downto 0);
signal reg: table_16x4;

begin

-- outputs
status <= hxc_status;
dbg <= input & '0' & ui_address;
dbg_reg <= reg(to_integer(unsigned(dbg_row)));
mt_ctrl <= hxc_MT_CTRL & hxc_MT_COL & hxc_MT_ROW;

-- shift only registers
sr_generate: for i in 0 to 7 generate
	sr: shiftreg port map (
				clk => clk, 
				opr => hxc_regs, 
				so => mt_x(i), 
				si => mt_y(i), 
				hexsel => dbg_col(1 downto 0), 
				hexout => reg(i)
			);
end generate;

-- shift registers with load
	sr_c: shiftregp port map (
				clk => clk, 
				opr => hxc_regs, 
				so => mt_x(12), 
				si => '0',
				pi(15 downto 12) => (others => hxc_MT_ROW(3)),
				pi(11 downto 8) => (others => hxc_MT_ROW(2)),
				pi(7 downto 4) => (others => hxc_MT_ROW(1)),
				pi(3 downto 0) => (others => hxc_MT_ROW(0)),
				hexsel => dbg_col(1 downto 0), 
				hexout => reg(12)
			);

	sr_d: shiftregp port map (
				clk => clk, 
				opr => hxc_regs, 
				so => mt_x(13), 
				si => '0',
				pi => X"000" & hxc_MT_COL, -- constant data for now
				hexsel => dbg_col(1 downto 0), 
				hexout => reg(13)
			);

-- ALU!
mt_x(10) <= mt_y(14) and mt_y(15);
 
ERROR <= '0' when (errcode = errcode_ok) else '1';
 
-- microcontrol unit
hxc_instructionstart <= hxc_mapper(to_integer(unsigned(input))); -- hex char input is the "instruction"
hxc_uinstruction <= hxc_microcode(to_integer(unsigned(ui_address))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

cu_hxc: hexcalc_control_unit
     Generic map (
            CODE_DEPTH => CODE_ADDRESS_WIDTH,
            IF_WIDTH => CODE_IF_WIDTH
          )
     Port map ( 
          -- standard inputs
          reset => reset,
          clk => clk,
          -- design specific inputs
          seq_cond => hxc_seq_cond,
          seq_then => hxc_seq_then,
          seq_else => hxc_seq_else,
          seq_fork => hxc_instructionstart,
			 -- condition bits
				cond(seq_cond_true) => '1',
				cond(seq_cond_input_is_zero) => input_is_zero,
				cond(seq_cond_TRACE_ERROR) => TRACE_ERROR,
				cond(seq_cond_TRACE_CHAR) => TRACE_CHAR,
				cond(seq_cond_TXDREADY) => TXDREADY,
				cond(seq_cond_TXDSEND) => '1', -- HACKHACK (this will generate pulse for sending the char)
				cond(seq_cond_bitcnt_is_zero) => bitcnt_is_zero,
				cond(seq_cond_cond_07) => '1', -- TODO
				cond(seq_cond_cond_08) => '1', -- TODO
				cond(seq_cond_cond_09) => '1', -- TODO
				cond(seq_cond_cond_10) => '1', -- TODO
				cond(seq_cond_cond_11) => '1', -- TODO
				cond(seq_cond_cond_12) => '1', -- TODO
				cond(seq_cond_cond_13) => '1', -- TODO
				cond(seq_cond_cond_14) => '1', -- TODO
				cond(seq_cond_false) => '0',
          -- outputs
          ui_nextinstr => ui_nextinstr,
          ui_address => ui_address
		);

-- conditions

-- hack that saves 1 microcode bit width
TXDSEND <= '1' when (unsigned(hxc_seq_cond) = seq_cond_TXDSEND) else '0';

---- Start boilerplate code (use with utmost caution!)
 update_TXDCHAR: process(clk, hxc_TXDCHAR)
 begin
	if (rising_edge(clk)) then
		case hxc_TXDCHAR is
			when TXDCHAR_same =>
				TXDCHAR <= TXDCHAR;
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
			when TXDCHAR_char_EQU =>
				TXDCHAR <= std_logic_vector(to_unsigned(natural(character'pos('=')), 8));
			when TXDCHAR_char_zero =>
				TXDCHAR <= (others => '0');
			when others =>
				TXDCHAR <= ascii;	-- go through lookup table
		end case;
 end if;
end process;
---- End boilerplate code

ascii <= hex2ascii(to_integer(unsigned(hexout)));

---- Start boilerplate code (use with utmost caution!)
---- End boilerplate code

-- Start boilerplate code (use with utmost caution!)
 update_errcode: process(clk, hxc_errcode)
 begin
	if (rising_edge(clk)) then
		case hxc_errcode is
			when errcode_ok =>
				errcode <= errcode_ok;
			when errcode_err_badchar =>
				errcode <= errcode_err_badchar;
--			when errcode_same =>
--				errcode <= errcode;
			when others =>
				null;
		end case;
 end if;
 end process;
-- End boilerplate code

			
end Behavioral;
