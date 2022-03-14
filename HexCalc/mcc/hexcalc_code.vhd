--------------------------------------------------------
-- mcc V1.2.0208 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'code_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package hexcalc_code is

-- memory block size
constant CODE_DATA_WIDTH: 	positive := 52;
constant CODE_ADDRESS_WIDTH: 	positive := 8;
constant CODE_ADDRESS_LAST: 	positive := 255;
constant CODE_IF_WIDTH: 	positive := 4;


type hxc_code_memory is array(0 to 255) of std_logic_vector(51 downto 0);

signal hxc_uinstruction: std_logic_vector(51 downto 0);

--hxc_uinstruction <= hxc_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0014.MT_CTRL: .valfield 2 values nop, on, off, clear default nop;
--
alias hxc_MT_CTRL: 	std_logic_vector(1 downto 0) is hxc_uinstruction(51 downto 50);
constant MT_CTRL_nop: 	std_logic_vector(1 downto 0) := "00";
constant MT_CTRL_on: 	std_logic_vector(1 downto 0) := "01";
constant MT_CTRL_off: 	std_logic_vector(1 downto 0) := "10";
constant MT_CTRL_clear: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- with hxc_MT_CTRL select MT_CTRL <=
--      nop when MT_CTRL_nop, -- default value
--      on when MT_CTRL_on,
--      off when MT_CTRL_off,
--      (others => '0') when MT_CTRL_clear;
---- End boilerplate code

--
-- L0020.MT_ROW: .valfield 4 values * default 0;
--
alias hxc_MT_ROW: 	std_logic_vector(3 downto 0) is hxc_uinstruction(49 downto 46);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_ROW <= hxc_MT_ROW;
---- End boilerplate code

--
-- L0021.MT_COL: .valfield 4 values * default 0;
--
alias hxc_MT_COL: 	std_logic_vector(3 downto 0) is hxc_uinstruction(45 downto 42);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_COL <= hxc_MT_COL;
---- End boilerplate code

--
-- L0023.bitcnt: .regfield 2 values same, load, max, dec default same;
--
alias hxc_bitcnt: 	std_logic_vector(1 downto 0) is hxc_uinstruction(41 downto 40);
constant bitcnt_same: 	std_logic_vector(1 downto 0) := "00";
constant bitcnt_load: 	std_logic_vector(1 downto 0) := "01";
constant bitcnt_max: 	std_logic_vector(1 downto 0) := "10";
constant bitcnt_dec: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_bitcnt: process(clk, hxc_bitcnt)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_bitcnt is
----			when bitcnt_same =>
----				bitcnt <= bitcnt;
--			when bitcnt_load =>
--				bitcnt <= load;
--			when bitcnt_max =>
--				bitcnt <= max;
--			when bitcnt_dec =>
--				bitcnt <= std_logic_vector(unsigned(bitcnt) - 1);
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0031.STATUS: .valfield 2 values ready, done, busy, busy_using_mt default busy;
--
alias hxc_STATUS: 	std_logic_vector(1 downto 0) is hxc_uinstruction(39 downto 38);
constant STATUS_ready: 	std_logic_vector(1 downto 0) := "00";
constant STATUS_done: 	std_logic_vector(1 downto 0) := "01";
constant STATUS_busy: 	std_logic_vector(1 downto 0) := "10";
constant STATUS_busy_using_mt: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- with hxc_STATUS select STATUS <=
--      ready when STATUS_ready,
--      done when STATUS_done,
--      busy when STATUS_busy, -- default value
--      busy_using_mt when STATUS_busy_using_mt;
---- End boilerplate code

--
-- L0043.seq_cond: .if 4 values true, input_is_zero, TRACE_INPUT, TRACE_RESULT, TXDREADY, TXDSEND, bitcnt_is_zero, loopcnt_is_zero, d_flag_is_set, c_flag_is_set, z_flagand_is_set, button, z_flagtos_is_set, z_flagnos_is_set, cond_14, false default true;
--
alias hxc_seq_cond: 	std_logic_vector(3 downto 0) is hxc_uinstruction(37 downto 34);
constant seq_cond_true: 	integer := 0;
constant seq_cond_input_is_zero: 	integer := 1;
constant seq_cond_TRACE_INPUT: 	integer := 2;
constant seq_cond_TRACE_RESULT: 	integer := 3;
constant seq_cond_TXDREADY: 	integer := 4;
constant seq_cond_TXDSEND: 	integer := 5;
constant seq_cond_bitcnt_is_zero: 	integer := 6;
constant seq_cond_loopcnt_is_zero: 	integer := 7;
constant seq_cond_d_flag_is_set: 	integer := 8;
constant seq_cond_c_flag_is_set: 	integer := 9;
constant seq_cond_z_flagand_is_set: 	integer := 10;
constant seq_cond_button: 	integer := 11;
constant seq_cond_z_flagtos_is_set: 	integer := 12;
constant seq_cond_z_flagnos_is_set: 	integer := 13;
constant seq_cond_cond_14: 	integer := 14;
constant seq_cond_false: 	integer := 15;
---- Start boilerplate code (use with utmost caution!)
---- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and feed 'conditions' with:
--  cond(seq_cond_true) => '1',
--  cond(seq_cond_input_is_zero) => input_is_zero,
--  cond(seq_cond_TRACE_INPUT) => TRACE_INPUT,
--  cond(seq_cond_TRACE_RESULT) => TRACE_RESULT,
--  cond(seq_cond_TXDREADY) => TXDREADY,
--  cond(seq_cond_TXDSEND) => TXDSEND,
--  cond(seq_cond_bitcnt_is_zero) => bitcnt_is_zero,
--  cond(seq_cond_loopcnt_is_zero) => loopcnt_is_zero,
--  cond(seq_cond_d_flag_is_set) => d_flag_is_set,
--  cond(seq_cond_c_flag_is_set) => c_flag_is_set,
--  cond(seq_cond_z_flagand_is_set) => z_flagand_is_set,
--  cond(seq_cond_button) => button,
--  cond(seq_cond_z_flagtos_is_set) => z_flagtos_is_set,
--  cond(seq_cond_z_flagnos_is_set) => z_flagnos_is_set,
--  cond(seq_cond_cond_14) => cond_14,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0061.seq_then: .then 8 values next, repeat, return, fork, @ default next;
--
alias hxc_seq_then: 	std_logic_vector(7 downto 0) is hxc_uinstruction(33 downto 26);
constant seq_then_next: 	std_logic_vector(7 downto 0) := X"00";
constant seq_then_repeat: 	std_logic_vector(7 downto 0) := X"01";
constant seq_then_return: 	std_logic_vector(7 downto 0) := X"02";
constant seq_then_fork: 	std_logic_vector(7 downto 0) := X"03";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to hxc_seq_then

--
-- L0062.seq_else: .else 8 values next, repeat, return, fork, 0b0000000..0b1111111, @ default next;
--
alias hxc_seq_else: 	std_logic_vector(7 downto 0) is hxc_uinstruction(25 downto 18);
constant seq_else_next: 	std_logic_vector(7 downto 0) := X"00";
constant seq_else_repeat: 	std_logic_vector(7 downto 0) := X"01";
constant seq_else_return: 	std_logic_vector(7 downto 0) := X"02";
constant seq_else_fork: 	std_logic_vector(7 downto 0) := X"03";
-- Values from X"00" to X"7F" allowed
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'else' to hxc_seq_else

--
-- L0065.TXDCHAR: .regfield 4 values same, char_space, char_cr, char_lf, char_E, char_R, char_EQU, char_I, char_zero, inp0, inp1, input, reg, -, -, errcode default same;
--
alias hxc_TXDCHAR: 	std_logic_vector(3 downto 0) is hxc_uinstruction(17 downto 14);
constant TXDCHAR_same: 	std_logic_vector(3 downto 0) := X"0";
constant TXDCHAR_char_space: 	std_logic_vector(3 downto 0) := X"1";
constant TXDCHAR_char_cr: 	std_logic_vector(3 downto 0) := X"2";
constant TXDCHAR_char_lf: 	std_logic_vector(3 downto 0) := X"3";
constant TXDCHAR_char_E: 	std_logic_vector(3 downto 0) := X"4";
constant TXDCHAR_char_R: 	std_logic_vector(3 downto 0) := X"5";
constant TXDCHAR_char_EQU: 	std_logic_vector(3 downto 0) := X"6";
constant TXDCHAR_char_I: 	std_logic_vector(3 downto 0) := X"7";
constant TXDCHAR_char_zero: 	std_logic_vector(3 downto 0) := X"8";
constant TXDCHAR_inp0: 	std_logic_vector(3 downto 0) := X"9";
constant TXDCHAR_inp1: 	std_logic_vector(3 downto 0) := X"A";
constant TXDCHAR_input: 	std_logic_vector(3 downto 0) := X"B";
constant TXDCHAR_reg: 	std_logic_vector(3 downto 0) := X"C";
-- Value X"D" not allowed (name '-' is not assignable)
-- Value X"E" not allowed (name '-' is not assignable)
constant TXDCHAR_errcode: 	std_logic_vector(3 downto 0) := X"F";
---- Start boilerplate code (use with utmost caution!)
-- update_TXDCHAR: process(clk, hxc_TXDCHAR)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_TXDCHAR is
----			when TXDCHAR_same =>
----				TXDCHAR <= TXDCHAR;
--			when TXDCHAR_char_space =>
--				TXDCHAR <= char_space;
--			when TXDCHAR_char_cr =>
--				TXDCHAR <= char_cr;
--			when TXDCHAR_char_lf =>
--				TXDCHAR <= char_lf;
--			when TXDCHAR_char_E =>
--				TXDCHAR <= char_E;
--			when TXDCHAR_char_R =>
--				TXDCHAR <= char_R;
--			when TXDCHAR_char_EQU =>
--				TXDCHAR <= char_EQU;
--			when TXDCHAR_char_I =>
--				TXDCHAR <= char_I;
--			when TXDCHAR_char_zero =>
--				TXDCHAR <= char_zero;
--			when TXDCHAR_inp0 =>
--				TXDCHAR <= inp0;
--			when TXDCHAR_inp1 =>
--				TXDCHAR <= inp1;
--			when TXDCHAR_input =>
--				TXDCHAR <= input;
--			when TXDCHAR_reg =>
--				TXDCHAR <= reg;
--			when TXDCHAR_errcode =>
--				TXDCHAR <= errcode;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0085.opr: .valfield 3 values np_np_np, np_np_ld, m2_d2_d2, np_m2_m2, d2_d2_d2, d2_d2_np, np_d2_d2, m2_m2_np default np_np_np;
--
alias hxc_opr: 	std_logic_vector(2 downto 0) is hxc_uinstruction(13 downto 11);
constant opr_np_np_np: 	std_logic_vector(2 downto 0) := "000";
constant opr_np_np_ld: 	std_logic_vector(2 downto 0) := "001";
constant opr_m2_d2_d2: 	std_logic_vector(2 downto 0) := "010";
constant opr_np_m2_m2: 	std_logic_vector(2 downto 0) := "011";
constant opr_d2_d2_d2: 	std_logic_vector(2 downto 0) := "100";
constant opr_d2_d2_np: 	std_logic_vector(2 downto 0) := "101";
constant opr_np_d2_d2: 	std_logic_vector(2 downto 0) := "110";
constant opr_m2_m2_np: 	std_logic_vector(2 downto 0) := "111";
---- Start boilerplate code (use with utmost caution!)
-- with hxc_opr select opr <=
--      np_np_np when opr_np_np_np, -- default value
--      np_np_ld when opr_np_np_ld,
--      m2_d2_d2 when opr_m2_d2_d2,
--      np_m2_m2 when opr_np_m2_m2,
--      d2_d2_d2 when opr_d2_d2_d2,
--      d2_d2_np when opr_d2_d2_np,
--      np_d2_d2 when opr_np_d2_d2,
--      m2_m2_np when opr_m2_m2_np;
---- End boilerplate code

--
-- L0096.errcode: .regfield 2 values ok, err_badchar, err_divzero, same default same;
--
alias hxc_errcode: 	std_logic_vector(1 downto 0) is hxc_uinstruction(10 downto 9);
constant errcode_ok: 	std_logic_vector(1 downto 0) := "00";
constant errcode_err_badchar: 	std_logic_vector(1 downto 0) := "01";
constant errcode_err_divzero: 	std_logic_vector(1 downto 0) := "10";
constant errcode_same: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_errcode: process(clk, hxc_errcode)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_errcode is
--			when errcode_ok =>
--				errcode <= ok;
--			when errcode_err_badchar =>
--				errcode <= err_badchar;
--			when errcode_err_divzero =>
--				errcode <= err_divzero;
----			when errcode_same =>
----				errcode <= errcode;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0103.d_flag: .regfield 2 values same, column, zero, one default same;
--
alias hxc_d_flag: 	std_logic_vector(1 downto 0) is hxc_uinstruction(8 downto 7);
constant d_flag_same: 	std_logic_vector(1 downto 0) := "00";
constant d_flag_column: 	std_logic_vector(1 downto 0) := "01";
constant d_flag_zero: 	std_logic_vector(1 downto 0) := "10";
constant d_flag_one: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_d_flag: process(clk, hxc_d_flag)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_d_flag is
----			when d_flag_same =>
----				d_flag <= d_flag;
--			when d_flag_column =>
--				d_flag <= column;
--			when d_flag_zero =>
--				d_flag <= (others => '0');
--			when d_flag_one =>
--				d_flag <= one;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0109.c_flag: .regfield 2 values same, adder, zero, one default same;
--
alias hxc_c_flag: 	std_logic_vector(1 downto 0) is hxc_uinstruction(6 downto 5);
constant c_flag_same: 	std_logic_vector(1 downto 0) := "00";
constant c_flag_adder: 	std_logic_vector(1 downto 0) := "01";
constant c_flag_zero: 	std_logic_vector(1 downto 0) := "10";
constant c_flag_one: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_c_flag: process(clk, hxc_c_flag)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_c_flag is
----			when c_flag_same =>
----				c_flag <= c_flag;
--			when c_flag_adder =>
--				c_flag <= adder;
--			when c_flag_zero =>
--				c_flag <= (others => '0');
--			when c_flag_one =>
--				c_flag <= one;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0115.z_flags: .regfield 2 values same, update, -, set default same;
--
alias hxc_z_flags: 	std_logic_vector(1 downto 0) is hxc_uinstruction(4 downto 3);
constant z_flags_same: 	std_logic_vector(1 downto 0) := "00";
constant z_flags_update: 	std_logic_vector(1 downto 0) := "01";
-- Value "10" not allowed (name '-' is not assignable)
constant z_flags_set: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_z_flags: process(clk, hxc_z_flags)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_z_flags is
----			when z_flags_same =>
----				z_flags <= z_flags;
--			when z_flags_update =>
--				z_flags <= update;
--			when z_flags_set =>
--				z_flags <= set;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0121.loopcnt: .regfield 2 values same, inc, max, dec default same;
--
alias hxc_loopcnt: 	std_logic_vector(1 downto 0) is hxc_uinstruction(2 downto 1);
constant loopcnt_same: 	std_logic_vector(1 downto 0) := "00";
constant loopcnt_inc: 	std_logic_vector(1 downto 0) := "01";
constant loopcnt_max: 	std_logic_vector(1 downto 0) := "10";
constant loopcnt_dec: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_loopcnt: process(clk, hxc_loopcnt)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_loopcnt is
----			when loopcnt_same =>
----				loopcnt <= loopcnt;
--			when loopcnt_inc =>
--				loopcnt <= std_logic_vector(unsigned(loopcnt) + 1);
--			when loopcnt_max =>
--				loopcnt <= max;
--			when loopcnt_dec =>
--				loopcnt <= std_logic_vector(unsigned(loopcnt) - 1);
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0128.selreg: .valfield 1 values external, internal default external;
--
alias hxc_selreg: 	std_logic is hxc_uinstruction(0);
constant selreg_external: 	std_logic := '0';
constant selreg_internal: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	selreg <= internal when (hxc_selreg = selreg_internal) else external;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0209@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0211@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0213@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0215@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0219@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 00000001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & X"01" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0220@0005.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000011 else 00000011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"03" & X"03" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0223@0006.badchar:  errcode <= err_badchar, if false then next else printerror;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00001000, TXDCHAR <= 0000, opr = 000, errcode <= 01, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
6 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"08" & X"0" & O"0" & "01" & "00" & "00" & "00" & "00" & '0',

-- L0224@0007.divzero:  errcode <= err_divzero, if false then next else printerror;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00001000, TXDCHAR <= 0000, opr = 000, errcode <= 10, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
7 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"08" & X"0" & O"0" & "10" & "00" & "00" & "00" & "00" & '0',

-- L0225@0008.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 0100, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
8 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"4" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0226@0009.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0227@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0228@000B.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 1111, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"F" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0229@000C.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 0001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"1" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0230@000D.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 1010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"A" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0231@000E.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 1001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"9" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0232@000F.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010011 else 10010011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"93" & X"93" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0239@0010.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
16 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0240@0011.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 00000000 else 00000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
17 => "00" & X"0" & X"0" & "00" & "01" & X"F" & X"00" & X"04" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0245@0012.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
18 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0246@0013.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 01111101 else 01111101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
19 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"7D" & X"7D" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0247@0014.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00100010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
20 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"22" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0253@0015.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
21 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0254@0016.dup:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 01111101 else 01111101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
22 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"7D" & X"7D" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0255@0017.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00100010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
23 => "01" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"22" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0261@0018.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
24 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0262@0019.rotate:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 01111101 else 01111101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
25 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"7D" & X"7D" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0263@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00100010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
26 => "01" & X"7" & X"0" & "00" & "11" & X"F" & X"00" & X"22" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0269@001B.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
27 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0270@001C.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 01110100 else 01110100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
28 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"74" & X"74" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0271@001D.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00100010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
29 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"22" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0277@001E.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
30 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0278@001F.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00100010, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
31 => "11" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"22" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0284@0020.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
32 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0285@0021.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 01110110 else 01110110, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
33 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"76" & X"76" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0286@0022.exec:  z_flags <= set, div2(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 01110010 else 01110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
34 => "00" & X"0" & X"0" & "10" & "10" & X"0" & X"72" & X"72" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0287@0023.done:  print_st();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10001010 else 10001010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
35 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"8A" & X"8A" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0288@0024.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00010001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
36 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"11" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0293@0025.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
37 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0294@0026.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10000100 else 10000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
38 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"84" & X"84" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0295@0027.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
39 => "01" & X"1" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0296@0028.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
40 => "01" & X"B" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0297@0029.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00100010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
41 => "01" & X"0" & X"C" & "00" & "11" & X"F" & X"00" & X"22" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0302@002A.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
42 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0303@002B.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10000100 else 10000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
43 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"84" & X"84" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0304@002C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
44 => "01" & X"1" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0305@002D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
45 => "01" & X"9" & X"D" & "00" & "11" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0310@002E.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
46 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0311@002F.div:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 01101101 else 01101101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
47 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"6D" & X"6D" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0312@0030.  if z_flagtos_is_set then divzero;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1100) then 00000111 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
48 => "00" & X"0" & X"0" & "00" & "10" & X"C" & X"07" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0314@0031.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
49 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0315@0032.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
50 => "01" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "10" & "00" & "00" & "00" & '0',

-- L0316@0033.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
51 => "01" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0317@0034.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
52 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0318@0035.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
53 => "10" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0319@0036.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
54 => "10" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0320@0037.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
55 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0323@0038.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
56 => "01" & X"7" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0324@0039.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 01101010 else 01101010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
57 => "01" & X"9" & X"D" & "00" & "11" & X"0" & X"6A" & X"6A" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0326@003A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
--  MT_CTRL = 10, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1001) then 00000000 else 01000101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
58 => "10" & X"9" & X"D" & "00" & "11" & X"9" & X"00" & X"45" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0329@003B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
59 => "01" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0330@003C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
60 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0331@003D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
61 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0332@003E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
62 => "01" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0333@003F.  STATUS = busy_using_mt, opr = d2_d2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
63 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0334@0040.  d_flag <= one;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
64 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "11" & "00" & "00" & "00" & '0',

-- L0335@0041.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
65 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0336@0042.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 01110111 else 01110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
66 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"77" & X"77" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0338@0043.div_next:  if loopcnt_is_zero then swap;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 00011100 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
67 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"1C" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0339@0044.  loopcnt <= dec, if false then next else div_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00110001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
68 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"31" & X"0" & O"0" & "11" & "00" & "00" & "00" & "11" & '0',

-- L0342@0045.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 01101010 else 01101010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
69 => "01" & X"7" & X"D" & "00" & "11" & X"0" & X"6A" & X"6A" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0343@0046.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 01000011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
70 => "10" & X"7" & X"D" & "00" & "11" & X"F" & X"00" & X"43" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0348@0047.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
71 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0349@0048.mul:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 01101101 else 01101101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
72 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"6D" & X"6D" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0350@0049.  if z_flagnos_is_set then nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1101) then 00010001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
73 => "00" & X"0" & X"0" & "00" & "10" & X"D" & X"11" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0352@004A.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
74 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0353@004B.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
75 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "00" & '0',

-- L0354@004C.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
76 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0355@004D.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (1000) then 01001110 else 01010010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
77 => "10" & X"1" & X"8" & "00" & "11" & X"8" & X"4E" & X"52" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0358@004E.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
78 => "01" & X"7" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0359@004F.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
79 => "01" & X"0" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0360@0050.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 01110010 else 01110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
80 => "01" & X"B" & X"0" & "10" & "11" & X"0" & X"72" & X"72" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0361@0051.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1001) then 01010011 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
81 => "10" & X"B" & X"0" & "00" & "11" & X"9" & X"53" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0364@0052.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 01010100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
82 => "01" & X"0" & X"1" & "00" & "11" & X"F" & X"00" & X"54" & X"0" & O"0" & "11" & "10" & "00" & "00" & "00" & '0',

-- L0365@0053.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
83 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "11" & "00" & "00" & "00" & '0',

-- L0366@0054.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
84 => "01" & X"8" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0367@0055.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
85 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0370@0056.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
86 => "10" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0371@0057.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
87 => "10" & X"8" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0372@0058.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0111) then 00100011 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
88 => "01" & X"1" & X"1" & "00" & "11" & X"7" & X"23" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0373@0059.  loopcnt <= dec, if false then next else m_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 01001010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
89 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"4A" & X"0" & O"0" & "11" & "00" & "00" & "00" & "11" & '0',

-- L0386@005A.  opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 01011110, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
90 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"5E" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0392@005B.  opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 01011110, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
91 => "00" & X"0" & X"D" & "00" & "10" & X"F" & X"00" & X"5E" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0396@005C.  opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 01011110, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
92 => "00" & X"0" & X"F" & "00" & "10" & X"F" & X"00" & X"5E" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0405@005D.  opr = np_np_ld, MT_COL = 0b1001;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
93 => "00" & X"0" & X"9" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0406@005E.hexchar:  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010010 else 10010010, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
94 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"92" & X"92" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0407@005F.  bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 11, if (0000) then 01110110 else 01110110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
95 => "11" & X"0" & X"3" & "01" & "11" & X"0" & X"76" & X"76" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0408@0060.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 1100, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
96 => "01" & X"C" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0409@0061.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
97 => "01" & X"D" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0410@0062.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
98 => "01" & X"B" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0411@0063.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 010, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
99 => "00" & X"0" & X"0" & "11" & "11" & X"6" & X"00" & X"01" & X"0" & O"2" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0412@0064.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
100 => "10" & X"B" & X"0" & "10" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0413@0065.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
101 => "01" & X"0" & X"0" & "11" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0414@0066.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
102 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0415@0067.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
103 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0416@0068.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
104 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0417@0069.  STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 00010001 else 00000001, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
105 => "00" & X"0" & X"0" & "11" & "11" & X"6" & X"11" & X"01" & X"0" & O"6" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0420@006A.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
106 => "01" & X"0" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0421@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, div2(max);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 01110010 else 01110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
107 => "01" & X"B" & X"0" & "10" & "11" & X"0" & X"72" & X"72" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0422@006C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
108 => "10" & X"B" & X"0" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0426@006D.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 01110110 else 01110110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
109 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"76" & X"76" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0428@006E.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
110 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0429@006F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, z_flags <= set, div2(max);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 01110010 else 01110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
111 => "01" & X"0" & X"7" & "10" & "11" & X"0" & X"72" & X"72" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0430@0070.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
112 => "01" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0431@0071.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
113 => "10" & X"0" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0434@0072.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 00000010 else 00000000, TXDCHAR <= 0000, opr = 100, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
114 => "00" & X"0" & X"0" & "00" & "11" & X"6" & X"02" & X"00" & X"0" & O"4" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0435@0073.  bitcnt <= dec, if false then next else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 01110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
115 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"72" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0438@0074.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
116 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0439@0075.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 01110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
117 => "01" & X"1" & X"0" & "00" & "11" & X"F" & X"00" & X"77" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0442@0076.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
118 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0443@0077.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
119 => "01" & X"2" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0444@0078.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
120 => "01" & X"3" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0445@0079.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
121 => "01" & X"4" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0446@007A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
122 => "01" & X"5" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0447@007B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
123 => "01" & X"6" & X"6" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0448@007C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
124 => "01" & X"7" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0451@007D.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
125 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0452@007E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
126 => "01" & X"1" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0453@007F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
127 => "01" & X"2" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0454@0080.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
128 => "01" & X"3" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0455@0081.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
129 => "01" & X"4" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0456@0082.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
130 => "01" & X"5" & X"6" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0457@0083.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
131 => "01" & X"6" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0460@0084.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
132 => "01" & X"2" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0461@0085.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
133 => "01" & X"3" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0462@0086.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
134 => "01" & X"4" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0463@0087.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
135 => "01" & X"5" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0464@0088.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
136 => "01" & X"6" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0465@0089.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
137 => "01" & X"7" & X"6" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0468@008A.print_st:  loopcnt <= max, if TRACE_RESULT then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 00000000 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
138 => "00" & X"0" & X"0" & "00" & "10" & X"3" & X"00" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0469@008B.  loopcnt <= inc, print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010011 else 10010011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
139 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"93" & X"93" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0470@008C.st_loop:  selreg = internal, emit(reg);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 1100, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 1;
140 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"C" & O"0" & "11" & "00" & "00" & "00" & "00" & '1',

-- L0471@008D.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
141 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0472@008E.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
142 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0473@008F.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
143 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0474@0090.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
144 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0475@0091.  if loopcnt_is_zero then print_crlf else st_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 10010011 else 10001100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
145 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"93" & X"8C" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0477@0092.echo:  if TRACE_INPUT then emit else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 10010101 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
146 => "00" & X"0" & X"0" & "00" & "10" & X"2" & X"95" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0479@0093.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10010101 else 10010101, TXDCHAR <= 0010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
147 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"95" & X"95" & X"2" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0480@0094.  TXDCHAR <= char_lf;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
148 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"3" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0487@0095.emit:  if TXDSEND then next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
149 => "00" & X"0" & X"0" & "00" & "10" & X"5" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0488@0096.  if TXDREADY then return else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 00000010 else 00000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
150 => "00" & X"0" & X"0" & "00" & "10" & X"4" & X"02" & X"01" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- 105 location(s) in following ranges will be filled with default value
-- 0097 .. 00FF

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0'
);

end hexcalc_code;

