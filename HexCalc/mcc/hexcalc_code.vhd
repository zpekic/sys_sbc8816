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
constant CODE_DATA_WIDTH: 	positive := 50;
constant CODE_ADDRESS_WIDTH: 	positive := 7;
constant CODE_ADDRESS_LAST: 	positive := 127;
constant CODE_IF_WIDTH: 	positive := 4;


type hxc_code_memory is array(0 to 127) of std_logic_vector(49 downto 0);

signal hxc_uinstruction: std_logic_vector(49 downto 0);

--hxc_uinstruction <= hxc_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0011.MT_CTRL: .valfield 2 values nop, on, off, clear default nop;
--
alias hxc_MT_CTRL: 	std_logic_vector(1 downto 0) is hxc_uinstruction(49 downto 48);
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
-- L0017.MT_ROW: .valfield 4 values * default 0;
--
alias hxc_MT_ROW: 	std_logic_vector(3 downto 0) is hxc_uinstruction(47 downto 44);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_ROW <= hxc_MT_ROW;
---- End boilerplate code

--
-- L0018.MT_COL: .valfield 4 values * default 0;
--
alias hxc_MT_COL: 	std_logic_vector(3 downto 0) is hxc_uinstruction(43 downto 40);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_COL <= hxc_MT_COL;
---- End boilerplate code

--
-- L0023.bitcnt: .regfield 2 values same, load, max, dec default same;
--
alias hxc_bitcnt: 	std_logic_vector(1 downto 0) is hxc_uinstruction(39 downto 38);
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
alias hxc_STATUS: 	std_logic_vector(1 downto 0) is hxc_uinstruction(37 downto 36);
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
-- L0043.seq_cond: .if 4 values true, input_is_zero, TRACE_ERROR, TRACE_CHAR, TXDREADY, TXDSEND, bitcnt_is_zero, loopcnt_is_zero, d_flag_is_set, c_flag_is_set, z_flagand_is_set, button, z_flagtos_is_set, z_flagnos_is_set, cond_14, false default true;
--
alias hxc_seq_cond: 	std_logic_vector(3 downto 0) is hxc_uinstruction(35 downto 32);
constant seq_cond_true: 	integer := 0;
constant seq_cond_input_is_zero: 	integer := 1;
constant seq_cond_TRACE_ERROR: 	integer := 2;
constant seq_cond_TRACE_CHAR: 	integer := 3;
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
--  cond(seq_cond_TRACE_ERROR) => TRACE_ERROR,
--  cond(seq_cond_TRACE_CHAR) => TRACE_CHAR,
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
-- L0061.seq_then: .then 7 values next, repeat, return, fork, @ default next;
--
alias hxc_seq_then: 	std_logic_vector(6 downto 0) is hxc_uinstruction(31 downto 25);
constant seq_then_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_then_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_then_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_then_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to hxc_seq_then

--
-- L0062.seq_else: .else 7 values next, repeat, return, fork, 0b0000000..0b1111111, @ default next;
--
alias hxc_seq_else: 	std_logic_vector(6 downto 0) is hxc_uinstruction(24 downto 18);
constant seq_else_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_else_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_else_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_else_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Values from "0000000" to "1111111" allowed
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'else' to hxc_seq_else

--
-- L0065.TXDCHAR: .regfield 4 values same, char_space, char_cr, char_lf, char_E, char_R, char_EQU, char_I, char_zero, inp0, inp1, -, -, -, -, errcode default same;
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
-- Value X"B" not allowed (name '-' is not assignable)
-- Value X"C" not allowed (name '-' is not assignable)
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
-- L0121.loopcnt: .regfield 2 values same, -, max, dec default same;
--
alias hxc_loopcnt: 	std_logic_vector(1 downto 0) is hxc_uinstruction(2 downto 1);
constant loopcnt_same: 	std_logic_vector(1 downto 0) := "00";
-- Value "01" not allowed (name '-' is not assignable)
constant loopcnt_max: 	std_logic_vector(1 downto 0) := "10";
constant loopcnt_dec: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_loopcnt: process(clk, hxc_loopcnt)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_loopcnt is
----			when loopcnt_same =>
----				loopcnt <= loopcnt;
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
-- L0129.dummy: .valfield 1 values * default 0;
--
alias hxc_dummy: 	std_logic is hxc_uinstruction(0);
-- Values from '0' to '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  dummy <= hxc_dummy;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0208@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0210@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0212@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0214@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0218@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 0000001 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & "0000001" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0219@0005.  trace();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1101111 else 1101111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1101111" & "1101111" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0220@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000011" & "0000011" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0223@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001001 else 0010001, TXDCHAR <= 0000, opr = 000, errcode <= 01, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
7 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001001" & "0010001" & X"0" & O"0" & "01" & "00" & "00" & "00" & "00" & '0',

-- L0224@0008.divzero:  errcode <= err_divzero, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001001 else 0010001, TXDCHAR <= 0000, opr = 000, errcode <= 10, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
8 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001001" & "0010001" & X"0" & O"0" & "10" & "00" & "00" & "00" & "00" & '0',

-- L0225@0009.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 0100, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"4" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0226@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0227@000B.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0228@000C.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 1111, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"F" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0229@000D.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 0001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"1" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0230@000E.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 1010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"A" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0231@000F.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 1001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"9" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0232@0010.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110010 else 1110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
16 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110010" & "1110010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0237@0011.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
17 => "00" & X"0" & X"0" & "00" & "01" & X"F" & "0000000" & "0000100" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0242@0012.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011001 else 1011001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
18 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011001" & "1011001" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0243@0013.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
19 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0248@0014.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
20 => "11" & X"0" & X"0" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0253@0015.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011011 else 1011011, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
21 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011011" & "1011011" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0254@0016.exec:  z_flags <= set, div2(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 1010111 else 1010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, dummy = 0;
22 => "00" & X"0" & X"0" & "10" & "10" & X"0" & "1010111" & "1010111" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0255@0017.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
23 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010001" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0259@0018.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1101001 else 1101001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, dummy = 0;
24 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1101001" & "1101001" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0260@0019.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
25 => "01" & X"1" & X"D" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0261@001A.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
26 => "01" & X"B" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0262@001B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
27 => "01" & X"0" & X"C" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0266@001C.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1101001 else 1101001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, dummy = 0;
28 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1101001" & "1101001" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0267@001D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
29 => "01" & X"1" & X"9" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0268@001E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0011010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
30 => "01" & X"9" & X"D" & "00" & "11" & X"F" & "0000000" & "0011010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0272@001F.div:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1010010 else 1010010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, dummy = 0;
31 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1010010" & "1010010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0273@0020.  if z_flagtos_is_set then divzero;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1100) then 0001000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
32 => "00" & X"0" & X"0" & "00" & "10" & X"C" & "0001000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0275@0021.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
33 => "10" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0276@0022.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
34 => "01" & X"8" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "10" & "00" & "00" & "00" & '0',

-- L0277@0023.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
35 => "01" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0278@0024.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
36 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0279@0025.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
37 => "10" & X"8" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0280@0026.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
38 => "10" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0281@0027.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
39 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0285@0028.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
40 => "01" & X"7" & X"9" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0286@0029.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 1001111 else 1001111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, dummy = 0;
41 => "01" & X"9" & X"D" & "00" & "11" & X"0" & "1001111" & "1001111" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0288@002A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
--  MT_CTRL = 10, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1001) then 0000000 else 0110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
42 => "10" & X"9" & X"D" & "00" & "11" & X"9" & "0000000" & "0110101" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0291@002B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
43 => "01" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0292@002C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
44 => "10" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0293@002D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
45 => "01" & X"1" & X"8" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0294@002E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
46 => "01" & X"8" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0295@002F.  STATUS = busy_using_mt, opr = d2_d2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
47 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0296@0030.  d_flag <= one;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
48 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "11" & "00" & "00" & "00" & '0',

-- L0297@0031.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
49 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0298@0032.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011100 else 1011100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
50 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011100" & "1011100" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0300@0033.div_next:  if loopcnt_is_zero then swap;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 0010010 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
51 => "00" & X"0" & X"0" & "00" & "10" & X"7" & "0010010" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0301@0034.  loopcnt <= dec, if false then next else div_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11, dummy = 0;
52 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0100001" & X"0" & O"0" & "11" & "00" & "00" & "00" & "11" & '0',

-- L0304@0035.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 1001111 else 1001111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, dummy = 0;
53 => "01" & X"7" & X"D" & "00" & "11" & X"0" & "1001111" & "1001111" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0305@0036.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0110011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
54 => "10" & X"7" & X"D" & "00" & "11" & X"F" & "0000000" & "0110011" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0337@0037.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1100010 else 1100010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
55 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1100010" & "1100010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0338@0038.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
56 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0342@0039.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
57 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0345@003A.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
58 => "00" & X"0" & X"8" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0348@003B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
59 => "00" & X"0" & X"4" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0351@003C.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
60 => "00" & X"0" & X"C" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0354@003D.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
61 => "00" & X"0" & X"2" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0357@003E.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
62 => "00" & X"0" & X"A" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0360@003F.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
63 => "00" & X"0" & X"6" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0363@0040.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
64 => "00" & X"0" & X"E" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0366@0041.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
65 => "00" & X"0" & X"1" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0369@0042.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
66 => "00" & X"0" & X"9" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0373@0043.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
67 => "00" & X"0" & X"5" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0377@0044.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
68 => "00" & X"0" & X"D" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0381@0045.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
69 => "00" & X"0" & X"3" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0385@0046.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
70 => "00" & X"0" & X"B" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0389@0047.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001001, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
71 => "00" & X"0" & X"7" & "00" & "10" & X"F" & "0000000" & "1001001" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0393@0048.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
72 => "00" & X"0" & X"F" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0394@0049.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011011 else 1011011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
73 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011011" & "1011011" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0395@004A.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
74 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0396@004B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
75 => "01" & X"D" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0397@004C.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 010, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
76 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0000000" & "0000001" & X"0" & O"2" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0398@004D.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
77 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0399@004E.  STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0010001 else 0000001, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
78 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0010001" & "0000001" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0402@004F.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
79 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0403@0050.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, div2(max);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 1010111 else 1010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, dummy = 0;
80 => "01" & X"B" & X"0" & "10" & "11" & X"0" & "1010111" & "1010111" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0404@0051.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
81 => "10" & X"B" & X"0" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0408@0052.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011011 else 1011011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
82 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011011" & "1011011" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0410@0053.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
83 => "10" & X"7" & X"7" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0411@0054.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, z_flags <= set, div2(max);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 1010111 else 1010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, dummy = 0;
84 => "01" & X"0" & X"7" & "10" & "11" & X"0" & "1010111" & "1010111" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0412@0055.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
85 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0413@0056.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
86 => "10" & X"0" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0416@0057.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 0000010 else 0000000, TXDCHAR <= 0000, opr = 100, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, dummy = 0;
87 => "00" & X"0" & X"0" & "00" & "11" & X"6" & "0000010" & "0000000" & X"0" & O"4" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0417@0058.  bitcnt <= dec, if false then next else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 0000000 else 1010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
88 => "00" & X"0" & X"0" & "11" & "10" & X"F" & "0000000" & "1010111" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0420@0059.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
89 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0421@005A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 1011100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
90 => "01" & X"1" & X"0" & "00" & "11" & X"F" & "0000000" & "1011100" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0424@005B.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
91 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0425@005C.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
92 => "01" & X"2" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0426@005D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
93 => "01" & X"3" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0427@005E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
94 => "01" & X"4" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0428@005F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
95 => "01" & X"5" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0429@0060.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
96 => "01" & X"6" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0430@0061.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
97 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0433@0062.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
98 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0434@0063.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
99 => "01" & X"1" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0435@0064.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
100 => "01" & X"2" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0436@0065.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
101 => "01" & X"3" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0437@0066.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
102 => "01" & X"4" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0438@0067.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
103 => "01" & X"5" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0439@0068.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
104 => "01" & X"6" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0442@0069.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
105 => "01" & X"2" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0443@006A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
106 => "01" & X"3" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0444@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
107 => "01" & X"4" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0445@006C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
108 => "01" & X"5" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0446@006D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
109 => "01" & X"6" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0447@006E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
110 => "01" & X"7" & X"6" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0449@006F.trace:  if TRACE_CHAR then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 0000000 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
111 => "00" & X"0" & X"0" & "00" & "10" & X"3" & "0000000" & "0000010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0452@0070.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 1010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
112 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"A" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0453@0071.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 1001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
113 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"9" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0455@0072.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 0010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
114 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"2" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0456@0073.  TXDCHAR <= char_lf;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
115 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"3" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0458@0074.emit:  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
116 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0460@0075.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
117 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0461@0076.  if TXDSEND then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, dummy = 0;
118 => "00" & X"0" & X"0" & "00" & "10" & X"5" & "0000010" & "0000010" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- 9 location(s) in following ranges will be filled with default value
-- 0077 .. 007F

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0'
);

end hexcalc_code;

