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
-- L0085.regs: .regfield 2 values same, load, div2, mul2 default same;
--
alias hxc_regs: 	std_logic_vector(1 downto 0) is hxc_uinstruction(11 downto 10);
constant regs_same: 	std_logic_vector(1 downto 0) := "00";
constant regs_load: 	std_logic_vector(1 downto 0) := "01";
constant regs_div2: 	std_logic_vector(1 downto 0) := "10";
constant regs_mul2: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_regs: process(clk, hxc_regs)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_regs is
----			when regs_same =>
----				regs <= regs;
--			when regs_load =>
--				regs <= load;
--			when regs_div2 =>
--				regs <= div2;
--			when regs_mul2 =>
--				regs <= mul2;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0091.reg0: .regfield 2 values same, -, div2, mul2 default same;
--
alias hxc_reg0: 	std_logic_vector(1 downto 0) is hxc_uinstruction(9 downto 8);
constant reg0_same: 	std_logic_vector(1 downto 0) := "00";
-- Value "01" not allowed (name '-' is not assignable)
constant reg0_div2: 	std_logic_vector(1 downto 0) := "10";
constant reg0_mul2: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_reg0: process(clk, hxc_reg0)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_reg0 is
----			when reg0_same =>
----				reg0 <= reg0;
--			when reg0_div2 =>
--				reg0 <= div2;
--			when reg0_mul2 =>
--				reg0 <= mul2;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0098.errcode: .regfield 3 values ok, err_badchar, err_2, err_3, err_4, err_5, same default same;
--
alias hxc_errcode: 	std_logic_vector(2 downto 0) is hxc_uinstruction(7 downto 5);
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
-- L0108.delay: .regfield 2 values same, column, zero, one default same;
--
alias hxc_delay: 	std_logic_vector(1 downto 0) is hxc_uinstruction(4 downto 3);
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
-- L0115.dummy: .valfield 3 values * default 0;
--
alias hxc_dummy: 	std_logic_vector(2 downto 0) is hxc_uinstruction(2 downto 0);
-- Values from "000" to "111" allowed
---- Start boilerplate code (use with utmost caution!)
--  dummy <= hxc_dummy;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0180@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, dummy = 000;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & O"0",

-- L0182@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, dummy = 000;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & O"0",

-- L0184@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, dummy = 000;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & O"0",

-- L0186@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, dummy = 000;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & O"0",

-- L0190@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 0000001 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & "0000001" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0191@0005.  trace();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1000010 else 1000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1000010" & "1000010" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0192@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000011" & "0000011" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0195@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001000 else 0010000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 001, delay <= 00, dummy = 000;
7 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001000" & "0010000" & X"0" & "00" & "00" & O"1" & "00" & O"0",

-- L0196@0008.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0100, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
8 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"4" & "00" & "00" & O"6" & "00" & O"0",

-- L0197@0009.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0101, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"5" & "00" & "00" & O"6" & "00" & O"0",

-- L0198@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0101, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"5" & "00" & "00" & O"6" & "00" & O"0",

-- L0199@000B.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 1111, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"F" & "00" & "00" & O"6" & "00" & O"0",

-- L0200@000C.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0001, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"1" & "00" & "00" & O"6" & "00" & O"0",

-- L0201@000D.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 1010, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"A" & "00" & "00" & O"6" & "00" & O"0",

-- L0202@000E.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 1001, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"9" & "00" & "00" & O"6" & "00" & O"0",

-- L0203@000F.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1000111 else 1000111, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1000111" & "1000111" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0208@0010.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
16 => "00" & X"0" & X"0" & "00" & "01" & X"F" & "0000000" & "0000100" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0213@0011.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0110011 else 0110011, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
17 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0110011" & "0110011" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0214@0012.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
18 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0219@0013.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, dummy = 000;
19 => "11" & X"0" & X"0" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"0" & "00" & O"0",

-- L0224@0014.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0110101 else 0110101, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
20 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0110101" & "0110101" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0225@0015.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, dummy = 000;
21 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & O"0",

-- L0226@0016.exec:  bitcnt <= load, MT_COL = 0, div2();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 01, STATUS = 10, if (0000) then 0110001 else 0110001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
22 => "00" & X"0" & X"0" & "01" & "10" & X"0" & "0110001" & "0110001" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0227@0017.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
23 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0231@0018.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0111011 else 0111011, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
24 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0111011" & "0111011" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0232@0019.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
25 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0236@001A.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
26 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0239@001B.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
27 => "00" & X"0" & X"8" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0242@001C.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
28 => "00" & X"0" & X"4" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0245@001D.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
29 => "00" & X"0" & X"C" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0248@001E.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
30 => "00" & X"0" & X"2" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0251@001F.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
31 => "00" & X"0" & X"A" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0254@0020.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
32 => "00" & X"0" & X"6" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0257@0021.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
33 => "00" & X"0" & X"E" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0260@0022.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
34 => "00" & X"0" & X"1" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0263@0023.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
35 => "00" & X"0" & X"9" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0267@0024.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
36 => "00" & X"0" & X"5" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0271@0025.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
37 => "00" & X"0" & X"D" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0275@0026.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
38 => "00" & X"0" & X"3" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0279@0027.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
39 => "00" & X"0" & X"B" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0283@0028.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101010, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
40 => "00" & X"0" & X"7" & "00" & "10" & X"F" & "0000000" & "0101010" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0287@0029.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1111;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
41 => "00" & X"0" & X"F" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "01" & "00" & O"6" & "00" & O"0",

-- L0288@002A.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0110101 else 0110101, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
42 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0110101" & "0110101" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0289@002B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
43 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0290@002C.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
44 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0291@002D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
45 => "01" & X"D" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0292@002E.  STATUS = busy_using_mt, reg0 <= mul2, regs <= div2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 10, reg0 <= 11, errcode <= 110, delay <= 00, dummy = 000;
46 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0000000" & "0000001" & X"0" & "10" & "11" & O"6" & "00" & O"0",

-- L0293@002F.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
47 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0294@0030.  STATUS = busy_using_mt, regs <= mul2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0010000 else 0000001, TXDCHAR <= 0000, regs <= 11, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
48 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0010000" & "0000001" & X"0" & "11" & "00" & O"6" & "00" & O"0",

-- L0303@0031.div2:  STATUS = busy_using_mt, reg0 <= div2, regs <= div2, bitcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 10, reg0 <= 10, errcode <= 110, delay <= 00, dummy = 000;
49 => "00" & X"0" & X"0" & "10" & "11" & X"0" & "0000000" & "0000000" & X"0" & "10" & "10" & O"6" & "00" & O"0",

-- L0304@0032.  if bitcnt_is_zero then return else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 0000010 else 0110001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
50 => "00" & X"0" & X"0" & "00" & "10" & X"6" & "0000010" & "0110001" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0307@0033.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
51 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0308@0034.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
52 => "01" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0311@0035.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
53 => "01" & X"2" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0312@0036.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
54 => "01" & X"3" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0313@0037.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
55 => "01" & X"4" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0314@0038.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
56 => "01" & X"5" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0315@0039.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
57 => "01" & X"6" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0316@003A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
58 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0319@003B.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
59 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0320@003C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
60 => "01" & X"1" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0321@003D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
61 => "01" & X"2" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0322@003E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
62 => "01" & X"3" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0323@003F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
63 => "01" & X"4" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0324@0040.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
64 => "01" & X"5" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0325@0041.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
65 => "01" & X"6" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0327@0042.trace:  if TRACE_CHAR then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 0000000 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
66 => "00" & X"0" & X"0" & "00" & "10" & X"3" & "0000000" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0328@0043.  emit(char_I);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0111, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
67 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"7" & "00" & "00" & O"6" & "00" & O"0",

-- L0329@0044.  emit(char_EQU);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0110, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
68 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"6" & "00" & "00" & O"6" & "00" & O"0",

-- L0330@0045.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 1010, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
69 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"A" & "00" & "00" & O"6" & "00" & O"0",

-- L0331@0046.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 1001, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
70 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"9" & "00" & "00" & O"6" & "00" & O"0",

-- L0333@0047.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0010, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
71 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"2" & "00" & "00" & O"6" & "00" & O"0",

-- L0334@0048.  emit(char_lf);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001010 else 1001010, TXDCHAR <= 0011, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
72 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001010" & "1001010" & X"3" & "00" & "00" & O"6" & "00" & O"0",

-- L0335@0049.  if true then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
73 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0337@004A.emit:  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
74 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0338@004B.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
75 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0339@004C.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
76 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- L0340@004D.  if TXDSEND then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, dummy = 000;
77 => "00" & X"0" & X"0" & "00" & "10" & X"5" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & O"0",

-- 50 location(s) in following ranges will be filled with default value
-- 004E .. 007F

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & O"0"
);

end hexcalc_code;

