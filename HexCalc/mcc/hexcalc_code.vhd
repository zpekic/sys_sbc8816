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
-- L0096.errcode: .regfield 3 values ok, err_badchar, err_divzero, err_3, err_4, err_5, same default same;
--
alias hxc_errcode: 	std_logic_vector(2 downto 0) is hxc_uinstruction(10 downto 8);
constant errcode_ok: 	std_logic_vector(2 downto 0) := "000";
constant errcode_err_badchar: 	std_logic_vector(2 downto 0) := "001";
constant errcode_err_divzero: 	std_logic_vector(2 downto 0) := "010";
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
--			when errcode_err_divzero =>
--				errcode <= err_divzero;
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

-- L0211@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0213@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0215@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0217@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0221@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 0000001 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & "0000001" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0222@0005.  trace();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110100 else 1110100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110100" & "1110100" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0223@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000011" & "0000011" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0226@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001001 else 0010001, TXDCHAR <= 0000, opr = 000, errcode <= 001, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
7 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001001" & "0010001" & X"0" & O"0" & O"1" & "00" & "00" & "00" & "00",

-- L0227@0008.divzero:  errcode <= err_divzero, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001001 else 0010001, TXDCHAR <= 0000, opr = 000, errcode <= 010, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
8 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001001" & "0010001" & X"0" & O"0" & O"2" & "00" & "00" & "00" & "00",

-- L0228@0009.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 0100, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"4" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0229@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 0101, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"5" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0230@000B.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 0101, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"5" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0231@000C.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 1111, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"F" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0232@000D.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 0001, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"1" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0233@000E.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 1010, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"A" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0234@000F.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 1001, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"9" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0235@0010.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1110111 else 1110111, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
16 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1110111" & "1110111" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0240@0011.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
17 => "00" & X"0" & X"0" & "00" & "01" & X"F" & "0000000" & "0000100" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0245@0012.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1011110 else 1011110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
18 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1011110" & "1011110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0246@0013.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
19 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0251@0014.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
20 => "11" & X"0" & X"0" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0256@0015.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1100000 else 1100000, TXDCHAR <= 0000, opr = 000, errcode <= 000, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
21 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1100000" & "1100000" & X"0" & O"0" & O"0" & "00" & "00" & "00" & "00",

-- L0257@0016.exec:  z_flags <= set, div2(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 1011100 else 1011100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00;
22 => "00" & X"0" & X"0" & "10" & "10" & X"0" & "1011100" & "1011100" & X"0" & O"0" & O"6" & "00" & "00" & "11" & "00",

-- L0258@0017.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
23 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0262@0018.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1101110 else 1101110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00;
24 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1101110" & "1101110" & X"0" & O"0" & O"6" & "00" & "10" & "00" & "00",

-- L0263@0019.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
25 => "01" & X"1" & X"D" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0264@001A.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
26 => "01" & X"B" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0265@001B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
27 => "01" & X"0" & X"C" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0269@001C.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1101110 else 1101110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00;
28 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1101110" & "1101110" & X"0" & O"0" & O"6" & "00" & "11" & "00" & "00",

-- L0270@001D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
29 => "01" & X"1" & X"9" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0271@001E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0011010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
30 => "01" & X"9" & X"D" & "00" & "11" & X"F" & "0000000" & "0011010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0275@001F.div:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1010111 else 1010111, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10;
31 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1010111" & "1010111" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "10",

-- L0276@0020.  if z_flagtos_is_set then divzero;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1100) then 0001000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
32 => "00" & X"0" & X"0" & "00" & "10" & X"C" & "0001000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0278@0021.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
33 => "10" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0279@0022.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
34 => "01" & X"8" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "10" & "00" & "00" & "00",

-- L0280@0023.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
35 => "01" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0281@0024.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 111, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
36 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"7" & O"6" & "00" & "00" & "00" & "00",

-- L0282@0025.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
37 => "10" & X"8" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0283@0026.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
38 => "10" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0284@0027.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
39 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0288@0028.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
40 => "01" & X"7" & X"9" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0289@0029.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 1010100 else 1010100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00;
41 => "01" & X"9" & X"D" & "00" & "11" & X"0" & "1010100" & "1010100" & X"0" & O"0" & O"6" & "00" & "11" & "00" & "00",

-- L0290@002A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
--  MT_CTRL = 10, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
42 => "10" & X"9" & X"D" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0292@002B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if c_flag_is_set then next else restore_a;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1001) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
43 => "00" & X"0" & X"1" & "00" & "10" & X"9" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0305@002C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
44 => "01" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0306@002D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
45 => "01" & X"D" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0308@002E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
46 => "01" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0309@002F.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
47 => "10" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0310@0030.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
48 => "01" & X"1" & X"8" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0311@0031.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
49 => "01" & X"8" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0312@0032.  STATUS = busy_using_mt, opr = d2_d2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 101, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
50 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"5" & O"6" & "00" & "00" & "00" & "00",

-- L0313@0033.  d_flag <= one;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
51 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "11" & "00" & "00" & "00",

-- L0314@0034.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 111, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
52 => "00" & X"0" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"7" & O"6" & "00" & "00" & "00" & "00",

-- L0315@0035.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1100001 else 1100001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
53 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1100001" & "1100001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0316@0036.  if button then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1011) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
54 => "00" & X"0" & X"0" & "00" & "10" & X"B" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0317@0037.  if false then next else div_next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
55 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0111010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0320@0038.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 1010100 else 1010100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00;
56 => "01" & X"7" & X"D" & "00" & "11" & X"0" & "1010100" & "1010100" & X"0" & O"0" & O"6" & "00" & "10" & "00" & "00",

-- L0321@0039.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
57 => "10" & X"7" & X"D" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0323@003A.div_next:  if loopcnt_is_zero then nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 0010001 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
58 => "00" & X"0" & X"0" & "00" & "10" & X"7" & "0010001" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0324@003B.  loopcnt <= dec, if false then next else div_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11;
59 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0100001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "11",

-- L0356@003C.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1100111 else 1100111, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
60 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1100111" & "1100111" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0357@003D.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
61 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0361@003E.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
62 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0364@003F.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
63 => "00" & X"0" & X"8" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0367@0040.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
64 => "00" & X"0" & X"4" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0370@0041.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
65 => "00" & X"0" & X"C" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0373@0042.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
66 => "00" & X"0" & X"2" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0376@0043.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
67 => "00" & X"0" & X"A" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0379@0044.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
68 => "00" & X"0" & X"6" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0382@0045.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
69 => "00" & X"0" & X"E" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0385@0046.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
70 => "00" & X"0" & X"1" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0388@0047.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
71 => "00" & X"0" & X"9" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0392@0048.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
72 => "00" & X"0" & X"5" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0396@0049.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
73 => "00" & X"0" & X"D" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0400@004A.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
74 => "00" & X"0" & X"3" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0404@004B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
75 => "00" & X"0" & X"B" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0408@004C.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 1001110, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
76 => "00" & X"0" & X"7" & "00" & "10" & X"F" & "0000000" & "1001110" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0412@004D.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 001, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
77 => "00" & X"0" & X"F" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"1" & O"6" & "00" & "00" & "00" & "00",

-- L0413@004E.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1100000 else 1100000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
78 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1100000" & "1100000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0414@004F.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
79 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0415@0050.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
80 => "01" & X"D" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0416@0051.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 010, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
81 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0000000" & "0000001" & X"0" & O"2" & O"6" & "00" & "00" & "00" & "00",

-- L0417@0052.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
82 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0418@0053.  STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0010001 else 0000001, TXDCHAR <= 0000, opr = 011, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
83 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0010001" & "0000001" & X"0" & O"3" & O"6" & "00" & "00" & "00" & "00",

-- L0421@0054.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
84 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0422@0055.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, div2(max);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 1011100 else 1011100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00;
85 => "01" & X"B" & X"0" & "10" & "11" & X"0" & "1011100" & "1011100" & X"0" & O"0" & O"6" & "00" & "00" & "11" & "00",

-- L0423@0056.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
86 => "10" & X"B" & X"0" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0427@0057.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1100000 else 1100000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
87 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1100000" & "1100000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0429@0058.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
88 => "10" & X"7" & X"7" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0430@0059.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, z_flags <= set, div2(max);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 1011100 else 1011100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00;
89 => "01" & X"0" & X"7" & "10" & "11" & X"0" & "1011100" & "1011100" & X"0" & O"0" & O"6" & "00" & "00" & "11" & "00",

-- L0431@005A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
90 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0432@005B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
91 => "10" & X"0" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0435@005C.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 0000010 else 0000000, TXDCHAR <= 0000, opr = 100, errcode <= 110, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00;
92 => "00" & X"0" & X"0" & "00" & "11" & X"6" & "0000010" & "0000000" & X"0" & O"4" & O"6" & "00" & "01" & "01" & "00",

-- L0436@005D.  bitcnt <= dec, if false then next else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 0000000 else 1011100, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
93 => "00" & X"0" & X"0" & "11" & "10" & X"F" & "0000000" & "1011100" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0439@005E.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
94 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0440@005F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 1100001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
95 => "01" & X"1" & X"0" & "00" & "11" & X"F" & "0000000" & "1100001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0443@0060.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
96 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0444@0061.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
97 => "01" & X"2" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0445@0062.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
98 => "01" & X"3" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0446@0063.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
99 => "01" & X"4" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0447@0064.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
100 => "01" & X"5" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0448@0065.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
101 => "01" & X"6" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0449@0066.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
102 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0452@0067.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
103 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0453@0068.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
104 => "01" & X"1" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0454@0069.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
105 => "01" & X"2" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0455@006A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
106 => "01" & X"3" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0456@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
107 => "01" & X"4" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0457@006C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
108 => "01" & X"5" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0458@006D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
109 => "01" & X"6" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0461@006E.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
110 => "01" & X"2" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0462@006F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
111 => "01" & X"3" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0463@0070.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
112 => "01" & X"4" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0464@0071.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
113 => "01" & X"5" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0465@0072.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
114 => "01" & X"6" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0466@0073.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
115 => "01" & X"7" & X"6" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0468@0074.trace:  if TRACE_CHAR then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 0000000 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
116 => "00" & X"0" & X"0" & "00" & "10" & X"3" & "0000000" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0471@0075.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 1010, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
117 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"A" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0472@0076.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 1001, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
118 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"9" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0474@0077.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1111001 else 1111001, TXDCHAR <= 0010, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
119 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1111001" & "1111001" & X"2" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0475@0078.  TXDCHAR <= char_lf;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0011, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
120 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"3" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0477@0079.emit:  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
121 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0478@007A.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
122 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0479@007B.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
123 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- L0480@007C.  if TXDSEND then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00;
124 => "00" & X"0" & X"0" & "00" & "10" & X"5" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00",

-- 3 location(s) in following ranges will be filled with default value
-- 007D .. 007F

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00" & "00"
);

end hexcalc_code;

