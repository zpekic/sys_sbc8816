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
constant CODE_DATA_WIDTH: 	positive := 48;
constant CODE_ADDRESS_WIDTH: 	positive := 7;
constant CODE_ADDRESS_LAST: 	positive := 127;
constant CODE_IF_WIDTH: 	positive := 4;


type hxc_code_memory is array(0 to 127) of std_logic_vector(47 downto 0);

signal hxc_uinstruction: std_logic_vector(47 downto 0);

--hxc_uinstruction <= hxc_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0011.MT_CTRL: .valfield 2 values nop, on, off, clear default nop;
--
alias hxc_MT_CTRL: 	std_logic_vector(1 downto 0) is hxc_uinstruction(47 downto 46);
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
alias hxc_MT_ROW: 	std_logic_vector(3 downto 0) is hxc_uinstruction(45 downto 42);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_ROW <= hxc_MT_ROW;
---- End boilerplate code

--
-- L0018.MT_COL: .valfield 4 values * default 0;
--
alias hxc_MT_COL: 	std_logic_vector(3 downto 0) is hxc_uinstruction(41 downto 38);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_COL <= hxc_MT_COL;
---- End boilerplate code

--
-- L0023.bitcnt: .regfield 2 values same, load, inc, dec default same;
--
alias hxc_bitcnt: 	std_logic_vector(1 downto 0) is hxc_uinstruction(37 downto 36);
constant bitcnt_same: 	std_logic_vector(1 downto 0) := "00";
constant bitcnt_load: 	std_logic_vector(1 downto 0) := "01";
constant bitcnt_inc: 	std_logic_vector(1 downto 0) := "10";
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
--			when bitcnt_inc =>
--				bitcnt <= std_logic_vector(unsigned(bitcnt) + 1);
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
alias hxc_STATUS: 	std_logic_vector(1 downto 0) is hxc_uinstruction(35 downto 34);
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
-- L0043.seq_cond: .if 4 values true, input_is_zero, TRACE_ERROR, TRACE_CHAR, TXDREADY, TXDSEND, bitcnt_is_zero, cond_07, cond_08, cond_09, cond_10, cond_11, cond_12, cond_13, cond_14, false default true;
--
alias hxc_seq_cond: 	std_logic_vector(3 downto 0) is hxc_uinstruction(33 downto 30);
constant seq_cond_true: 	integer := 0;
constant seq_cond_input_is_zero: 	integer := 1;
constant seq_cond_TRACE_ERROR: 	integer := 2;
constant seq_cond_TRACE_CHAR: 	integer := 3;
constant seq_cond_TXDREADY: 	integer := 4;
constant seq_cond_TXDSEND: 	integer := 5;
constant seq_cond_bitcnt_is_zero: 	integer := 6;
constant seq_cond_cond_07: 	integer := 7;
constant seq_cond_cond_08: 	integer := 8;
constant seq_cond_cond_09: 	integer := 9;
constant seq_cond_cond_10: 	integer := 10;
constant seq_cond_cond_11: 	integer := 11;
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
--  cond(seq_cond_cond_07) => cond_07,
--  cond(seq_cond_cond_08) => cond_08,
--  cond(seq_cond_cond_09) => cond_09,
--  cond(seq_cond_cond_10) => cond_10,
--  cond(seq_cond_cond_11) => cond_11,
--  cond(seq_cond_cond_12) => cond_12,
--  cond(seq_cond_cond_13) => cond_13,
--  cond(seq_cond_cond_14) => cond_14,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0061.seq_then: .then 7 values next, repeat, return, fork, @ default next;
--
alias hxc_seq_then: 	std_logic_vector(6 downto 0) is hxc_uinstruction(29 downto 23);
constant seq_then_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_then_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_then_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_then_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to hxc_seq_then

--
-- L0062.seq_else: .else 7 values next, repeat, return, fork, 0b0000000..0b1111111, @ default next;
--
alias hxc_seq_else: 	std_logic_vector(6 downto 0) is hxc_uinstruction(22 downto 16);
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
alias hxc_TXDCHAR: 	std_logic_vector(3 downto 0) is hxc_uinstruction(15 downto 12);
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
-- L0085.opr: .valfield 3 values np_np_np, np_np_ld, m2_d2_d2, np_m2_m2, d2_d2_d2, d2_d2_np, -, - default np_np_np;
--
alias hxc_opr: 	std_logic_vector(2 downto 0) is hxc_uinstruction(11 downto 9);
constant opr_np_np_np: 	std_logic_vector(2 downto 0) := "000";
constant opr_np_np_ld: 	std_logic_vector(2 downto 0) := "001";
constant opr_m2_d2_d2: 	std_logic_vector(2 downto 0) := "010";
constant opr_np_m2_m2: 	std_logic_vector(2 downto 0) := "011";
constant opr_d2_d2_d2: 	std_logic_vector(2 downto 0) := "100";
constant opr_d2_d2_np: 	std_logic_vector(2 downto 0) := "101";
-- Value "110" not allowed (name '-' is not assignable)
-- Value "111" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- with hxc_opr select opr <=
--      np_np_np when opr_np_np_np, -- default value
--      np_np_ld when opr_np_np_ld,
--      m2_d2_d2 when opr_m2_d2_d2,
--      np_m2_m2 when opr_np_m2_m2,
--      d2_d2_d2 when opr_d2_d2_d2,
--      d2_d2_np when opr_d2_d2_np,
--      np_np_np when others;
---- End boilerplate code

--
-- L0096.errcode: .regfield 3 values ok, err_badchar, err_2, err_3, err_4, err_5, same default same;
--
alias hxc_errcode: 	std_logic_vector(2 downto 0) is hxc_uinstruction(8 downto 6);
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
-- L0106.delay: .regfield 2 values same, column, zero, one default same;
--
alias hxc_delay: 	std_logic_vector(1 downto 0) is hxc_uinstruction(5 downto 4);
constant delay_same: 	std_logic_vector(1 downto 0) := "00";
constant delay_column: 	std_logic_vector(1 downto 0) := "01";
constant delay_zero: 	std_logic_vector(1 downto 0) := "10";
constant delay_one: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_delay: process(clk, hxc_delay)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_delay is
----			when delay_same =>
----				delay <= delay;
--			when delay_column =>
--				delay <= column;
--			when delay_zero =>
--				delay <= (others => '0');
--			when delay_one =>
--				delay <= one;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0112.carry: .regfield 2 values same, update, zero, one default same;
--
alias hxc_carry: 	std_logic_vector(1 downto 0) is hxc_uinstruction(3 downto 2);
constant carry_same: 	std_logic_vector(1 downto 0) := "00";
constant carry_update: 	std_logic_vector(1 downto 0) := "01";
constant carry_zero: 	std_logic_vector(1 downto 0) := "10";
constant carry_one: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_carry: process(clk, hxc_carry)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_carry is
----			when carry_same =>
----				carry <= carry;
--			when carry_update =>
--				carry <= update;
--			when carry_zero =>
--				carry <= (others => '0');
--			when carry_one =>
--				carry <= one;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0119.dummy: .valfield 2 values * default 0;
--
alias hxc_dummy: 	std_logic_vector(1 downto 0) is hxc_uinstruction(1 downto 0);
-- Values from "00" to "11" allowed
---- Start boilerplate code (use with utmost caution!)
--  dummy <= hxc_dummy;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0186@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, delay <= 00, carry <= 00, dummy = 00;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00",

-- L0188@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, delay <= 00, carry <= 00, dummy = 00;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00",

-- L0190@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, delay <= 00, carry <= 00, dummy = 00;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00",

-- L0192@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, delay <= 00, carry <= 00, dummy = 00;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00",

-- L0196@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 0000001 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & "0000001" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0197@0005.  trace();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1010110 else 1010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1010110" & "1010110" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0198@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000011" & "0000011" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0201@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001000 else 0010000, TXDCHAR <= 0000, opr = 000, errcode <= 001, delay <= 00, carry <= 00, dummy = 00;
7 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001000" & "0010000" & X"0" & O"0" & O"1" & "00" & "00" & "00",

-- L0202@0008.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0100, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
8 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"4" & O"0" & O"6" & "00" & "00" & "00",

-- L0203@0009.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0101, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"5" & O"0" & O"6" & "00" & "00" & "00",

-- L0204@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0101, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"5" & O"0" & O"6" & "00" & "00" & "00",

-- L0205@000B.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 1111, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"F" & O"0" & O"6" & "00" & "00" & "00",

-- L0206@000C.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0001, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"1" & O"0" & O"6" & "00" & "00" & "00",

-- L0207@000D.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 1010, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"A" & O"0" & O"6" & "00" & "00" & "00",

-- L0208@000E.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 1001, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"9" & O"0" & O"6" & "00" & "00" & "00",

-- L0209@000F.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0214@0010.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
16 => "00" & X"0" & X"0" & "00" & "01" & X"F" & "0000000" & "0000100" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0219@0011.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000001 else 1000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
17 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000001" & "1000001" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0220@0012.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
18 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0225@0013.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 000, delay <= 00, carry <= 00, dummy = 00;
19 => "11" & X"0" & X"0" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"0" & "00" & "00" & "00",

-- L0230@0014.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000011 else 1000011, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
20 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000011" & "1000011" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0231@0015.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 000, delay <= 00, carry <= 00, dummy = 00;
21 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"0" & "00" & "00" & "00",

-- L0232@0016.exec:  bitcnt <= load, MT_COL = 0, div2();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 01, STATUS = 10, if (0000) then 0111111 else 0111111, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
22 => "00" & X"0" & X"0" & "01" & "10" & X"0" & "0111111" & "0111111" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0233@0017.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
23 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0237@0018.plus:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1010000 else 1010000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
24 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1010000" & "1010000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0239@0019.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
25 => "01" & X"B" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0240@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
26 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0241@001B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD, carry <= zero, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 10, dummy = 00;
27 => "01" & X"1" & X"D" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"6" & "00" & "10" & "00",

-- L0245@001C.minus:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1010000 else 1010000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
28 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1010000" & "1010000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0247@001D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
29 => "01" & X"B" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0248@001E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
30 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0249@001F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
31 => "01" & X"1" & X"9" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0250@0020.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, carry <= one, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 11, dummy = 00;
32 => "01" & X"9" & X"D" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"6" & "00" & "11" & "00",

-- L0254@0021.mul:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000011 else 1000011, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
33 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000011" & "1000011" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0255@0022.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
34 => "10" & X"7" & X"7" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0256@0023.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
35 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0257@0024.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2();
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0111111 else 0111111, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
36 => "01" & X"0" & X"7" & "00" & "11" & X"0" & "0111111" & "0111111" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0258@0025.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
37 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0262@0026.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1001001 else 1001001, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
38 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1001001" & "1001001" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0263@0027.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
39 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0267@0028.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
40 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0270@0029.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
41 => "00" & X"0" & X"8" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0273@002A.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
42 => "00" & X"0" & X"4" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0276@002B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
43 => "00" & X"0" & X"C" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0279@002C.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
44 => "00" & X"0" & X"2" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0282@002D.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
45 => "00" & X"0" & X"A" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0285@002E.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
46 => "00" & X"0" & X"6" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0288@002F.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
47 => "00" & X"0" & X"E" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0291@0030.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
48 => "00" & X"0" & X"1" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0294@0031.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
49 => "00" & X"0" & X"9" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0298@0032.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
50 => "00" & X"0" & X"5" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0302@0033.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
51 => "00" & X"0" & X"D" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0306@0034.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
52 => "00" & X"0" & X"3" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0310@0035.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
53 => "00" & X"0" & X"B" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0314@0036.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0111000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
54 => "00" & X"0" & X"7" & "00" & "10" & X"F" & "0000000" & "0111000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0318@0037.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 001, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
55 => "00" & X"0" & X"F" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"1" & O"6" & "00" & "00" & "00",

-- L0319@0038.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000011 else 1000011, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
56 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000011" & "1000011" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0320@0039.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
57 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0321@003A.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
58 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0322@003B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
59 => "01" & X"D" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0323@003C.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 010, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
60 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0000000" & "0000001" & X"0" & O"2" & O"6" & "00" & "00" & "00",

-- L0324@003D.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
61 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0325@003E.  STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0010000 else 0000001, TXDCHAR <= 0000, opr = 011, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
62 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0010000" & "0000001" & X"0" & O"3" & O"6" & "00" & "00" & "00",

-- L0328@003F.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, bitcnt <= inc, carry <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 100, errcode <= 110, delay <= 00, carry <= 01, dummy = 00;
63 => "00" & X"0" & X"0" & "10" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"4" & O"6" & "00" & "01" & "00",

-- L0329@0040.  if bitcnt_is_zero then return else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 0000010 else 0111111, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
64 => "00" & X"0" & X"0" & "00" & "10" & X"6" & "0000010" & "0111111" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0332@0041.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
65 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0333@0042.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
66 => "01" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0336@0043.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
67 => "01" & X"2" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0337@0044.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
68 => "01" & X"3" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0338@0045.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
69 => "01" & X"4" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0339@0046.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
70 => "01" & X"5" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0340@0047.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
71 => "01" & X"6" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0341@0048.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
72 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0344@0049.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
73 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0345@004A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
74 => "01" & X"1" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0346@004B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
75 => "01" & X"2" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0347@004C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
76 => "01" & X"3" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0348@004D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
77 => "01" & X"4" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0349@004E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
78 => "01" & X"5" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0350@004F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
79 => "01" & X"6" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0353@0050.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
80 => "01" & X"2" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0354@0051.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
81 => "01" & X"3" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0355@0052.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
82 => "01" & X"4" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0356@0053.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
83 => "01" & X"5" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0357@0054.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
84 => "01" & X"6" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0358@0055.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
85 => "01" & X"7" & X"6" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0360@0056.trace:  if TRACE_CHAR then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 0000000 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
86 => "00" & X"0" & X"0" & "00" & "10" & X"3" & "0000000" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0361@0057.  emit(char_I);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0111, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
87 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"7" & O"0" & O"6" & "00" & "00" & "00",

-- L0362@0058.  emit(char_EQU);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0110, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
88 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"6" & O"0" & O"6" & "00" & "00" & "00",

-- L0363@0059.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 1010, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
89 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"A" & O"0" & O"6" & "00" & "00" & "00",

-- L0364@005A.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 1001, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
90 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"9" & O"0" & O"6" & "00" & "00" & "00",

-- L0366@005B.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0010, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
91 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"2" & O"0" & O"6" & "00" & "00" & "00",

-- L0367@005C.  emit(char_lf);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011110 else 1011110, TXDCHAR <= 0011, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
92 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011110" & "1011110" & X"3" & O"0" & O"6" & "00" & "00" & "00",

-- L0368@005D.  if true then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
93 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0370@005E.emit:  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
94 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0371@005F.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
95 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0372@0060.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
96 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- L0373@0061.  if TXDSEND then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 0000010 else 0000010, TXDCHAR <= 0000, opr = 000, errcode <= 110, delay <= 00, carry <= 00, dummy = 00;
97 => "00" & X"0" & X"0" & "00" & "10" & X"5" & "0000010" & "0000010" & X"0" & O"0" & O"6" & "00" & "00" & "00",

-- 30 location(s) in following ranges will be filled with default value
-- 0062 .. 007F

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & O"0" & O"6" & "00" & "00" & "00"
);

end hexcalc_code;

