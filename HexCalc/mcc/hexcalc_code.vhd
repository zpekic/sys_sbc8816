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
-- L0043.seq_cond: .if 4 values true, input_is_zero, TRACE_ERROR, TRACE_CHAR, TXDREADY, TXDSEND, bitcnt_is_zero, loopcnt_is_zero, d_flag_is_set, c_flag_is_set, z_flagand_is_set, button, cond_12, cond_13, cond_14, false default true;
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
constant seq_cond_cond_12: 	integer := 12;
constant seq_cond_cond_13: 	integer := 13;
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
--  cond(seq_cond_cond_12) => cond_12,
--  cond(seq_cond_cond_13) => cond_13,
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
-- L0096.errcode: .regfield 3 values ok, err_badchar, err_2, err_3, err_4, err_5, same default same;
--
alias hxc_errcode: 	std_logic_vector(2 downto 0) is hxc_uinstruction(10 downto 8);
constant errcode_ok: 	std_logic_vector(2 downto 0) := "000";
constant errcode_err_badchar: 	std_logic_vector(2 downto 0) := "001";
constant errcode_err_2: 	std_logic_vector(2 downto 0) := "010";
constant errcode_err_3: 	std_logic_vector(2 downto 0) := "011";
constant errcode_err_4: 	std_logic_vector(2 downto 0) := "100";
constant errcode_err_5: 	std_logic_vector(2 downto 0) := "101";
constant errcode_same: 	std_logic_vector(2 downto 0) := "110";
---- Start boilerplate code (use with utmost caution!)
-- update_errcode: process(clk, hxc_errcode)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_errcode is
--			when errcode_ok =>
--				errcode <= ok;
--			when errcode_err_badchar =>
--				errcode <= err_badchar;
--			when errcode_err_2 =>
--				errcode <= err_2;
--			when errcode_err_3 =>
--				errcode <= err_3;
--			when errcode_err_4 =>
--				errcode <= err_4;
--			when errcode_err_5 =>
--				errcode <= err_5;
----			when errcode_same =>
----				errcode <= errcode;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0106.d_flag: .regfield 2 values same, column, zero, one default same;
--
alias hxc_d_flag: 	std_logic_vector(1 downto 0) is hxc_uinstruction(7 downto 6);
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
-- L0112.c_flag: .regfield 2 values same, adder, zero, one default same;
--
alias hxc_c_flag: 	std_logic_vector(1 downto 0) is hxc_uinstruction(5 downto 4);
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
-- L0118.z_flags: .regfield 2 values same, update, -, set default same;
--
alias hxc_z_flags: 	std_logic_vector(1 downto 0) is hxc_uinstruction(3 downto 2);
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
-- L0124.loopcnt: .regfield 2 values same, -, max, dec default same;
--
alias hxc_loopcnt: 	std_logic_vector(1 downto 0) is hxc_uinstruction(1 downto 0);
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



constant hxc_microcode: hxc_code_memory := (

-- L0205@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0207@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0209@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0211@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0215@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 0000001 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & "0000001" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0216@0005.  trace();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110010 else 1110010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110010" & "1110010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0217@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000011" & "0000011" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0220@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001000 else 0010000, TXDCHAR <= 0000, opr = 000, errcode <= 001, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
7 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001000" & "0010000" & X"0" & O"0" & O"1" & "00" & "00" & "00" & "00",

-- L0221@0008.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 0100, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
8 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"4" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0222@0009.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 0101, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"5" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0223@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 0101, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"5" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0224@000B.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 1111, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"F" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0225@000C.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 0001, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"1" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0226@000D.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 1010, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"A" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0227@000E.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 1001, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"9" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0228@000F.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110101 else 1110101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110101" & "1110101" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0233@0010.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
16 => "00" & X"0" & X"0" & "00" & "01" & X"F" & "0000000" & "0000100" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0238@0011.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011100 else 1011100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
17 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011100" & "1011100" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0239@0012.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
18 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010101" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0244@0013.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010101, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
19 => "11" & X"0" & X"0" & "00" & "11" & X"F" & "0000000" & "0010101" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0249@0014.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011110 else 1011110, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
20 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011110" & "1011110" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0250@0015.exec:  z_flags <= set, bitcnt <= max, div2();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 1011010 else 1011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00;
21 => "00" & X"0" & X"0" & "10" & "10" & X"0" & "1011010" & "1011010" & X"0" & O"0" & O"6" & "00" & "00" & "11" & "00",

-- L0251@0016.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
22 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0268@0017.div:  loopcnt <= max, prep_regs();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1010101 else 1010101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10;
23 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1010101" & "1010101" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "10",

-- L0270@0018.div_loop:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
24 => "10" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "10" & "00" & "00" & "00",

-- L0271@0019.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
25 => "01" & X"8" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0272@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
26 => "01" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0273@001B.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 111, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
27 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"7" & O"6" & "00" & "00" & "00" & "00",

-- L0276@001C.  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011110 else 1011110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00;
28 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011110" & "1011110" & X"0" & O"0" & O"6" & "00" & "11" & "00" & "00",

-- L0277@001D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
29 => "01" & X"7" & X"9" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0278@001E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
30 => "01" & X"9" & X"D" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0279@001F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
31 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0280@0020.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, bitcnt <= max, div2();
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 1011010 else 1011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00;
32 => "01" & X"B" & X"0" & "10" & "11" & X"0" & "1011010" & "1011010" & X"0" & O"0" & O"6" & "00" & "00" & "11" & "00",

-- L0282@0021.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if c_flag_is_set then restore_a;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1001) then 0100110 else 0000000, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
33 => "00" & X"0" & X"1" & "00" & "10" & X"9" & "0100110" & "0000000" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0285@0022.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
34 => "01" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0286@0023.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
35 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0287@0024.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 1, div2();
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 1011010 else 1011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
36 => "01" & X"D" & X"1" & "00" & "11" & X"0" & "1011010" & "1011010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0288@0025.  if false then next else div_next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
37 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0291@0026.restore_a:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011110 else 1011110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
38 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011110" & "1011110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0292@0027.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
39 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0293@0028.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
40 => "01" & X"7" & X"D" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0294@0029.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, bitcnt <= max, div2();
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 1011010 else 1011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 10, z_flags <= 11, loopcnt <= 00;
41 => "01" & X"B" & X"0" & "10" & "11" & X"0" & "1011010" & "1011010" & X"0" & O"0" & O"6" & "00" & "10" & "11" & "00",

-- L0296@002A.div_next:  loopcnt <= dec, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011110 else 1011110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11;
42 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011110" & "1011110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "11",

-- L0297@002B.  if loopcnt_is_zero then nextchar else div_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 0010000 else 0011000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
43 => "00" & X"0" & X"0" & "00" & "10" & X"7" & "0010000" & "0011000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0301@002C.mul:  loopcnt <= max, prep_regs();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1010101 else 1010101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10;
44 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1010101" & "1010101" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "10",

-- L0303@002D.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
45 => "01" & X"1" & X"8" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0304@002E.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 110, errcode <= 110, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
46 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"6" & O"6" & "01" & "00" & "00" & "00",

-- L0305@002F.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 011, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
47 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"3" & O"6" & "00" & "00" & "00" & "00",

-- L0306@0030.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (1000) then 0110001 else 0110101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00;
48 => "10" & X"1" & X"8" & "00" & "11" & X"8" & "0110001" & "0110101" & X"0" & O"0" & O"6" & "00" & "10" & "00" & "00",

-- L0309@0031.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
49 => "01" & X"7" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0310@0032.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
50 => "01" & X"0" & X"D" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0311@0033.  bitcnt <= max, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2();
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 1011010 else 1011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
51 => "01" & X"B" & X"0" & "10" & "11" & X"0" & "1011010" & "1011010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0312@0034.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1001) then 0110110 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
52 => "10" & X"B" & X"0" & "00" & "11" & X"9" & "0110110" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0315@0035.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0110111, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
53 => "01" & X"0" & X"1" & "00" & "11" & X"F" & "0000000" & "0110111" & X"0" & O"0" & O"6" & "10" & "00" & "00" & "00",

-- L0316@0036.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
54 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "11" & "00" & "00" & "00",

-- L0317@0037.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
55 => "01" & X"8" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0318@0038.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 101, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
56 => "10" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"5" & O"6" & "00" & "00" & "00" & "00",

-- L0321@0039.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
57 => "10" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0322@003A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
58 => "10" & X"8" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0323@003B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then nextchar;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0111) then 0010000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
59 => "01" & X"1" & X"1" & "00" & "11" & X"7" & "0010000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0324@003C.  loopcnt <= dec, if false then next else m_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11;
60 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0101101" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "11",

-- L0328@003D.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1100101 else 1100101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
61 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1100101" & "1100101" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0329@003E.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010101, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
62 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010101" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0333@003F.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
63 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0336@0040.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
64 => "00" & X"0" & X"8" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0339@0041.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
65 => "00" & X"0" & X"4" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0342@0042.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
66 => "00" & X"0" & X"C" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0345@0043.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
67 => "00" & X"0" & X"2" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0348@0044.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
68 => "00" & X"0" & X"A" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0351@0045.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
69 => "00" & X"0" & X"6" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0354@0046.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
70 => "00" & X"0" & X"E" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0357@0047.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
71 => "00" & X"0" & X"1" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0360@0048.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
72 => "00" & X"0" & X"9" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0364@0049.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
73 => "00" & X"0" & X"5" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0368@004A.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
74 => "00" & X"0" & X"D" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0372@004B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
75 => "00" & X"0" & X"3" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0376@004C.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
76 => "00" & X"0" & X"B" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0380@004D.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001111, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
77 => "00" & X"0" & X"7" & "00" & "10" & X"F" & "0000000" & "1001111" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0384@004E.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
78 => "00" & X"0" & X"F" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0385@004F.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011110 else 1011110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
79 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011110" & "1011110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0386@0050.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
80 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0387@0051.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
81 => "01" & X"D" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0388@0052.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 010, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
82 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0000000" & "0000001" & X"0" & O"2" & O"6" & "00" & "00" & "00" & "00",

-- L0389@0053.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
83 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0390@0054.  STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0010000 else 0000001, TXDCHAR <= 0000, opr = 011, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
84 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0010000" & "0000001" & X"0" & O"3" & O"6" & "00" & "00" & "00" & "00",

-- L0393@0055.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011110 else 1011110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
85 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011110" & "1011110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0395@0056.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
86 => "10" & X"7" & X"7" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0396@0057.  bitcnt <= max, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2();
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 1011010 else 1011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
87 => "01" & X"0" & X"7" & "10" & "11" & X"0" & "1011010" & "1011010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0397@0058.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
88 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0398@0059.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
89 => "10" & X"0" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0401@005A.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 0000010 else 0000000, TXDCHAR <= 0000, opr = 100, errcode <= 110, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00;
90 => "00" & X"0" & X"0" & "00" & "11" & X"6" & "0000010" & "0000000" & X"0" & O"4" & O"6" & "00" & "01" & "01" & "00",

-- L0402@005B.  bitcnt <= dec, if false then next else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 0000000 else 1011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
91 => "00" & X"0" & X"0" & "11" & "10" & X"F" & "0000000" & "1011010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0405@005C.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
92 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0406@005D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 1011111, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
93 => "01" & X"1" & X"0" & "00" & "11" & X"F" & "0000000" & "1011111" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0409@005E.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
94 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0410@005F.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
95 => "01" & X"2" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0411@0060.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
96 => "01" & X"3" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0412@0061.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
97 => "01" & X"4" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0413@0062.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
98 => "01" & X"5" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0414@0063.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
99 => "01" & X"6" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0415@0064.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
100 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0418@0065.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
101 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0419@0066.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
102 => "01" & X"1" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0420@0067.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
103 => "01" & X"2" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0421@0068.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
104 => "01" & X"3" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0422@0069.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
105 => "01" & X"4" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0423@006A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
106 => "01" & X"5" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0424@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
107 => "01" & X"6" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0427@006C.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
108 => "01" & X"2" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0428@006D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
109 => "01" & X"3" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0429@006E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
110 => "01" & X"4" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0430@006F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
111 => "01" & X"5" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0431@0070.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
112 => "01" & X"6" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0432@0071.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
113 => "01" & X"7" & X"6" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0434@0072.trace:  if TRACE_CHAR then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 0000000 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
114 => "00" & X"0" & X"0" & "00" & "10" & X"3" & "0000000" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0437@0073.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 1010, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
115 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"A" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0438@0074.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 1001, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
116 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"9" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0440@0075.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 0010, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
117 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"2" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0441@0076.  TXDCHAR <= char_lf;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0011, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
118 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"3" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0443@0077.emit:  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
119 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0444@0078.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
120 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0445@0079.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
121 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0446@007A.  if TXDSEND then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
122 => "00" & X"0" & X"0" & "00" & "10" & X"5" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- 5 location(s) in following ranges will be filled with default value
-- 007B .. 007F

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00"
);

end hexcalc_code;

