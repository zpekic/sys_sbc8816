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
			  mode32 : in STD_LOGIC;
			  -- DEBUG
   		  dbg: out STD_LOGIC_VECTOR(23 downto 0);
   		  dbg_row: in STD_LOGIC_VECTOR(3 downto 0);
   		  dbg_col: in STD_LOGIC_VECTOR(3 downto 0);
   		  dbg_reg: buffer STD_LOGIC_VECTOR(3 downto 0);
			  button: in STD_LOGIC;
			  -- MATRIX CONTROL
			  mt_ctrl: out STD_LOGIC_VECTOR(9 downto 0);
			  -- MATRIX DATA
			  mt_x: buffer STD_LOGIC_VECTOR(15 downto 0);
			  mt_y: in STD_LOGIC_VECTOR(15 downto 0);
			  -- INSTRUCTION
			  input: in STD_LOGIC_VECTOR(7 downto 0);
			  -- FLAGS
			  c_flag: buffer STD_LOGIC;
			  d_flag: buffer STD_LOGIC;
			  daa_flag: buffer STD_LOGIC;
			  z_flags: buffer STD_LOGIC_VECTOR(15 downto 0);
			  -- TRACING
			  TRACE_INPUT: in STD_LOGIC;
			  TRACE_RESULT: in STD_LOGIC;
           ERROR : buffer  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           TXDCHAR : buffer  STD_LOGIC_VECTOR (7 downto 0));
end hexcalc;

architecture Behavioral of hexcalc is

component shiftreg is
    Port ( clk : in  STD_LOGIC;
           opr : in  STD_LOGIC_VECTOR (2 downto 0);
           so : out  STD_LOGIC;
           si : in  STD_LOGIC;
           hexsel : in  STD_LOGIC_VECTOR (2 downto 0);
           hexout : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

component shiftregp is
    Port ( clk : in  STD_LOGIC;
           opr : in  STD_LOGIC_VECTOR (2 downto 0);
           so : out  STD_LOGIC;
           si : in  STD_LOGIC;
			  pi : in  STD_LOGIC_VECTOR(31 downto 0);
           hexsel : in  STD_LOGIC_VECTOR (2 downto 0);
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
signal hexchar: std_logic_vector(3 downto 0);
signal errcode: std_logic_vector(1 downto 0);
signal bitcnt: std_logic_vector(4 downto 0);
signal loopcnt: std_logic_vector(4 downto 0);
signal opr: std_logic_vector(5 downto 0);	-- register operation control
alias opr_tos: std_logic_vector(1 downto 0) is opr(5 downto 4); 
alias opr_nos: std_logic_vector(1 downto 0) is opr(3 downto 2);
alias opr_reg: std_logic_vector(1 downto 0) is opr(1 downto 0);
-- select nibble from register array
signal reg_row: std_logic_vector(3 downto 0);
signal reg_col: std_logic_vector(2 downto 0);
-- for BCD add
signal bcd_sum: std_logic_vector(3 downto 0);

-- ALU input / outputs
alias row_delay: std_logic is mt_x(8);
alias row_not: std_logic is mt_x(9);
alias row_and: std_logic is mt_x(10);
alias row_sum: std_logic is mt_x(11);
alias row_const: std_logic is mt_x(12);
alias row_direct: std_logic is mt_x(13);
alias col_delay: std_logic is mt_y(8);
alias col_not: std_logic is mt_y(9);
alias col_adc1: std_logic is mt_y(12);
alias col_adc2: std_logic is mt_y(13);
alias col_and1: std_logic is mt_y(14);
alias col_and2: std_logic is mt_y(15);

-- conditions
signal input_is_zero, bitcnt_is_zero, loopcnt_is_zero, loopcnt_is_max: std_logic;

-- just for visualisation
type table_16x4 is array (0 to 15) of std_logic_vector(3 downto 0);
signal reg: table_16x4;

begin

-- outputs
status <= hxc_status;
--dbg <= loopcnt(3 downto 0) & bitcnt(3 downto 0) & input & '0' & ui_address;
dbg <= "000" & loopcnt & "000" & bitcnt & ui_address;
--dbg <= '0' & ui_nextinstr & loopcnt(3 downto 0) & bitcnt(3 downto 0) & '0' & ui_address;
--dbg <= input & loopcnt(3 downto 0) & bitcnt(3 downto 0) & ui_address;
mt_ctrl <= hxc_MT_CTRL & hxc_MT_COL & hxc_MT_ROW;

reg_row <= X"0" when (hxc_selreg = selreg_internal) else dbg_row; -- select TOS if internal
reg_col <= loopcnt(4 downto 2) when (hxc_selreg = selreg_internal) else dbg_col(2 downto 0);
dbg_reg <= reg(to_integer(unsigned(reg_row)));

-- shift only registers
	tos: shiftreg port map (
				clk => clk, 
				opr => (mode32 & opr_tos),	-- TOS register can shift independently 
				so => mt_x(0), 
				si => mt_y(0), 
				hexsel => reg_col, 
				hexout => reg(0)
			);

	nos: shiftreg port map (
				clk => clk, 
				opr => (mode32 & opr_nos),	-- NOS register can shift independently 
				so => mt_x(1), 
				si => mt_y(1), 
				hexsel => reg_col, 
				hexout => reg(1)
			);

sr_generate: for i in 2 to 7 generate
	sr: shiftreg port map (
				clk => clk, 
				opr => (mode32 & opr_reg),	-- all other registers operate in unison
				so => mt_x(i), 
				si => mt_y(i), 
				hexsel => reg_col, 
				hexout => reg(i)
			);
end generate;

-- shift registers with load
	sr_c: shiftregp port map (
				clk => clk, 
				opr => (mode32 & opr_reg),	-- all other registers operate in unison 
				so => row_const, 
				si => '0',
				pi(31 downto 4) => (others => '0'),	-- zero all the way
				pi(3) => input(0),	-- instruction low nibble reversed
				pi(2) => input(1),		
				pi(1) => input(2),		
				pi(0) => input(3),		
				--pi(31 downto 16) => X"0000",
				--pi(15 downto 0) => decode4to16(to_integer(unsigned(hxc_MT_ROW))),	-- one hot bit
				hexsel => reg_col, 
				hexout => reg(12)
			);

	sr_d: shiftregp port map (
				clk => clk, 
				opr => (mode32 & opr_reg), 
				so => row_direct, 
				si => '0',
				pi(31 downto 4) => (others => hxc_MT_COL(3)),	-- sign extend
				pi(3 downto 0) => hxc_MT_COL,							-- constant data
				hexsel => reg_col, 
				hexout => reg(13)
			);

-- ALU!
row_delay <= d_flag; 
row_not <= not col_not; 
row_and <= col_and1 and col_and2;
row_sum <= c_flag xor (col_adc1 xor col_adc2); -- 1 bit full adder sum
-- 12 is constant register
-- 13 is data register
mt_x(14) <= '0';
mt_x(15) <= '0';
 
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
				cond(seq_cond_TRACE_INPUT) => TRACE_INPUT,
				cond(seq_cond_TRACE_RESULT) => TRACE_RESULT,
				cond(seq_cond_TXDREADY) => TXDREADY,
				cond(seq_cond_TXDSEND) => TXDREADY, --'1', -- HACKHACK (this will generate pulse for sending the char)
				cond(seq_cond_bitcnt_is_zero) => bitcnt_is_zero,
				cond(seq_cond_loopcnt_is_zero) => loopcnt_is_zero,
				cond(seq_cond_d_flag_is_set) => d_flag,
				cond(seq_cond_c_flag_is_set) => c_flag,
				cond(seq_cond_z_flagand_is_set) => z_flags(10),
				cond(seq_cond_loopcnt_is_max) => loopcnt_is_max, 
				cond(seq_cond_z_flagtos_is_set) => z_flags(0),
				cond(seq_cond_z_flagnos_is_set) => z_flags(1),
				cond(seq_cond_daa_flag_is_set) => daa_flag, 
				cond(seq_cond_false) => '0',
          -- outputs
          ui_nextinstr => ui_nextinstr,
          ui_address => ui_address
		);

-- conditions
input_is_zero <= '1' when (input = char_zero) else '0';
bitcnt_is_zero <= (not bitcnt(4)) when (bitcnt(3 downto 0) = X"0") else '0';
--bitcnt_is_digit <= '1' when (bitcnt(1 downto 0) = "00") else '0';
loopcnt_is_zero <= (not loopcnt(4)) when (loopcnt(3 downto 0) = X"0") else '0';
loopcnt_is_max <= (loopcnt(4) and loopcnt(3) and loopcnt(2) and loopcnt(1) and loopcnt(0)) when (mode32 = '1') else ((not loopcnt(4)) and loopcnt(3) and loopcnt(2) and loopcnt(1) and loopcnt(0));
daa_flag <= '1' when (to_integer(unsigned(bcd_sum)) > 9) else c_flag;

-- hack that saves 1 microcode bit width
TXDSEND <= '1' when (unsigned(hxc_seq_cond) = seq_cond_TXDSEND) else '0';

---- Start boilerplate code (use with utmost caution!)
 update_bitcnt: process(clk, hxc_bitcnt)
 begin
	if (rising_edge(clk)) then
		case hxc_bitcnt is
--			when bitcnt_same =>
--				bitcnt <= bitcnt;
			when bitcnt_load => 
				bitcnt <= hxc_MT_COL(3) & hxc_MT_COL;	-- 4 bits "sign extended" to 5
			when bitcnt_max =>
				bitcnt <= mode32 & X"F";	-- 31 or 15
			when bitcnt_dec =>
				bitcnt <= std_logic_vector(unsigned(bitcnt) - 1);
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code

--ascii <= hex2ascii(to_integer(unsigned(hexchar)));
---- Start boilerplate code (use with utmost caution!)
 update_TXDCHAR: process(clk, hxc_TXDCHAR)
 begin
	if (rising_edge(clk)) then
		case hxc_TXDCHAR is
			when TXDCHAR_same =>
				TXDCHAR <= TXDCHAR;
			when TXDCHAR_char_space =>
				TXDCHAR <= char_space;
			when TXDCHAR_char_cr =>
				TXDCHAR <= char_cr;
			when TXDCHAR_char_lf =>
				TXDCHAR <= char_lf;
			when TXDCHAR_char_E =>
				TXDCHAR <= char_E;
			when TXDCHAR_char_R =>
				TXDCHAR <= char_R;
			when TXDCHAR_char_EQU =>
				TXDCHAR <= char_EQU;
			when TXDCHAR_char_I =>
				TXDCHAR <= char_I;
			when TXDCHAR_char_zero =>
				TXDCHAR <= char_zero;
			when TXDCHAR_input =>
				TXDCHAR <= input;
			when others =>
				TXDCHAR <= hex2ascii(to_integer(unsigned(hexchar)));
		end case;
 end if;
 end process;
---- End boilerplate code

with hxc_TXDCHAR select hexchar <= 
	input(3 downto 0) when TXDCHAR_inp0,
	input(7 downto 4) when TXDCHAR_inp1,
	dbg_reg when TXDCHAR_reg,
	"00" & errcode when TXDCHAR_errcode,
	X"F" when others;

---- Start boilerplate code (use with utmost caution!)
 with hxc_opr select opr <=
      --np_np_np when opr_np_np_np, -- default value
      "000011" when opr_np_np_ld,
      "100101" when opr_m2_d2_d2,
      "001010" when opr_np_m2_m2,
      "010101" when opr_d2_d2_d2,
      "010100" when opr_d2_d2_np,
		"000101" when opr_np_d2_d2,
      "101000" when opr_m2_m2_np,
		"000000" when others;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
 update_errcode: process(clk, hxc_errcode)
 begin
	if (rising_edge(clk)) then
		case hxc_errcode is
			when errcode_ok =>
				errcode <= errcode_ok;
			when errcode_err_badchar =>
				errcode <= errcode_err_badchar;
			when errcode_err_divzero =>
				errcode <= errcode_err_divzero;
--			when errcode_same =>
--				errcode <= errcode;
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
 update_d_flag: process(clk, hxc_d_flag)
 begin
	if (rising_edge(clk)) then
		case hxc_d_flag is
--			when delay_same =>
--				delay <= delay;
			when d_flag_column =>
				d_flag <= col_delay;
			when d_flag_zero =>
				d_flag <= '0';
			when d_flag_one =>
				d_flag <= '1';
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
 update_c_flag: process(clk, hxc_c_flag)
 begin
	if (rising_edge(clk)) then
		case hxc_c_flag is
--			when carry_same =>
--				carry <= carry;
			when c_flag_adder =>
				c_flag <= (col_adc1 and col_adc2) or (c_flag and (col_adc1 xor col_adc2));	-- carry out for 1 bit full adder
				bcd_sum <= row_sum & bcd_sum(3 downto 1);
			when c_flag_zero =>
				c_flag <= '0';
				bcd_sum <= X"0";
			when c_flag_one =>
				c_flag <= '1';
				bcd_sum <= X"0"; -- TODO??
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code
			
---- Start boilerplate code (use with utmost caution!)
 update_z_flags: process(clk, hxc_z_flags)
 begin
	if (rising_edge(clk)) then
		case hxc_z_flags is
--			when z_flags_same =>
--				z_flags <= z_flags;
			when z_flags_update =>
				z_flags <= z_flags and (mt_x xor X"FFFF");
			when z_flags_set =>
				z_flags <= X"FFFF";
			when others =>
				null;
		end case;
 end if;
end process;
---- End boilerplate code

---- Start boilerplate code (use with utmost caution!)
 update_loopcnt: process(clk, hxc_loopcnt)
 begin
	if (rising_edge(clk)) then
		case hxc_loopcnt is
--			when loopcnt_same =>
--				loopcnt <= loopcnt;
			when loopcnt_max =>
				loopcnt <= mode32 & X"F";	-- 31 or 15
			when loopcnt_inc =>
				loopcnt <= std_logic_vector(unsigned(loopcnt) + 1);
			when loopcnt_dec =>
				loopcnt <= std_logic_vector(unsigned(loopcnt) - 1);
			when others =>
				null;
		end case;
 end if;
 end process;
---- End boilerplate code
			
end Behavioral;
