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
-- L0011.MT_CTRL: .valfield 2 values nop, off, on, clear default nop;
--
alias hxc_MT_CTRL: 	std_logic_vector(1 downto 0) is hxc_uinstruction(47 downto 46);
constant MT_CTRL_nop: 	std_logic_vector(1 downto 0) := "00";
constant MT_CTRL_off: 	std_logic_vector(1 downto 0) := "01";
constant MT_CTRL_on: 	std_logic_vector(1 downto 0) := "10";
constant MT_CTRL_clear: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- with hxc_MT_CTRL select MT_CTRL <=
--      nop when MT_CTRL_nop, -- default value
--      off when MT_CTRL_off,
--      on when MT_CTRL_on,
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
-- L0023.bitcnt: .regfield 2 values same, zero, inc, - default same;
--
alias hxc_bitcnt: 	std_logic_vector(1 downto 0) is hxc_uinstruction(37 downto 36);
constant bitcnt_same: 	std_logic_vector(1 downto 0) := "00";
constant bitcnt_zero: 	std_logic_vector(1 downto 0) := "01";
constant bitcnt_inc: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_bitcnt: process(clk, hxc_bitcnt)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_bitcnt is
----			when bitcnt_same =>
----				bitcnt <= bitcnt;
--			when bitcnt_zero =>
--				bitcnt <= (others => '0');
--			when bitcnt_inc =>
--				bitcnt <= std_logic_vector(unsigned(bitcnt) + 1);
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
-- L0091.regs: .regfield 2 values same, load, div2, mul2 default same;
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
-- L0098.errcode: .regfield 3 values ok, err_badchar, err_2, err_3, err_4, err_5, same default same;
--
alias hxc_errcode: 	std_logic_vector(2 downto 0) is hxc_uinstruction(9 downto 7);
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
-- L0110.dummy: .valfield 7 values * default 0;
--
alias hxc_dummy: 	std_logic_vector(6 downto 0) is hxc_uinstruction(6 downto 0);
-- Values from "0000000" to "1111111" allowed
---- Start boilerplate code (use with utmost caution!)
--  dummy <= hxc_dummy;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0163@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 000, dummy = 0000000;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"0" & "0000000",

-- L0165@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 000, dummy = 0000000;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"0" & "0000000",

-- L0167@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 000, dummy = 0000000;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"0" & "0000000",

-- L0169@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 000, dummy = 0000000;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"0" & "0000000",

-- L0173@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 0000001 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & "0000001" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0174@0005.  trace();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1000001 else 1000001, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1000001" & "1000001" & X"0" & "00" & O"6" & "0000000",

-- L0175@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000011" & "0000011" & X"0" & "00" & O"6" & "0000000",

-- L0178@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001000 else 0001111, TXDCHAR <= 0000, regs <= 00, errcode <= 001, dummy = 0000000;
7 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001000" & "0001111" & X"0" & "00" & O"1" & "0000000",

-- L0179@0008.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 0100, regs <= 00, errcode <= 110, dummy = 0000000;
8 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"4" & "00" & O"6" & "0000000",

-- L0180@0009.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 0101, regs <= 00, errcode <= 110, dummy = 0000000;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"5" & "00" & O"6" & "0000000",

-- L0181@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 0101, regs <= 00, errcode <= 110, dummy = 0000000;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"5" & "00" & O"6" & "0000000",

-- L0182@000B.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 1111, regs <= 00, errcode <= 110, dummy = 0000000;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"F" & "00" & O"6" & "0000000",

-- L0183@000C.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 0001, regs <= 00, errcode <= 110, dummy = 0000000;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"1" & "00" & O"6" & "0000000",

-- L0184@000D.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 1010, regs <= 00, errcode <= 110, dummy = 0000000;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"A" & "00" & O"6" & "0000000",

-- L0185@000E.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1000110 else 1000110, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1000110" & "1000110" & X"0" & "00" & O"6" & "0000000",

-- L0190@000F.nextchar:  STATUS = done, errcode <= ok, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, regs <= 00, errcode <= 000, dummy = 0000000;
15 => "00" & X"0" & X"0" & "00" & "01" & X"F" & "0000000" & "0000100" & X"0" & "00" & O"0" & "0000000",

-- L0196@0010.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0110010 else 0110010, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
16 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0110010" & "0110010" & X"0" & "00" & O"6" & "0000000",

-- L0197@0011.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101001, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
17 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0101001" & X"0" & "00" & O"6" & "0000000",

-- L0201@0012.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0111010 else 0111010, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
18 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0111010" & "0111010" & X"0" & "00" & O"6" & "0000000",

-- L0202@0013.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0101001, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
19 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0101001" & X"0" & "00" & O"6" & "0000000",

-- L0206@0014.  regs <= load, MT_ROW = 0b1110, MT_COL = 0, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
20 => "00" & X"E" & X"0" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0209@0015.  regs <= load, MT_ROW = 0b1110, MT_COL = 1, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
21 => "00" & X"E" & X"1" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0212@0016.  regs <= load, MT_ROW = 0b1110, MT_COL = 2, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
22 => "00" & X"E" & X"2" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0215@0017.  regs <= load, MT_ROW = 0b1110, MT_COL = 3, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
23 => "00" & X"E" & X"3" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0218@0018.  regs <= load, MT_ROW = 0b1110, MT_COL = 4, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
24 => "00" & X"E" & X"4" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0221@0019.  regs <= load, MT_ROW = 0b1110, MT_COL = 5, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
25 => "00" & X"E" & X"5" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0224@001A.  regs <= load, MT_ROW = 0b1110, MT_COL = 6, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
26 => "00" & X"E" & X"6" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0227@001B.  regs <= load, MT_ROW = 0b1110, MT_COL = 7, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 0111, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
27 => "00" & X"E" & X"7" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0230@001C.  regs <= load, MT_ROW = 0b1110, MT_COL = 8, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
28 => "00" & X"E" & X"8" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0233@001D.  regs <= load, MT_ROW = 0b1110, MT_COL = 9, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
29 => "00" & X"E" & X"9" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0237@001E.  regs <= load, MT_ROW = 0b1110, MT_COL = 10, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
30 => "00" & X"E" & X"A" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0241@001F.  regs <= load, MT_ROW = 0b1110, MT_COL = 11, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
31 => "00" & X"E" & X"B" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0245@0020.  regs <= load, MT_ROW = 0b1110, MT_COL = 12, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
32 => "00" & X"E" & X"C" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0249@0021.  regs <= load, MT_ROW = 0b1110, MT_COL = 13, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
33 => "00" & X"E" & X"D" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0253@0022.  regs <= load, MT_ROW = 0b1110, MT_COL = 14, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0100100, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
34 => "00" & X"E" & X"E" & "00" & "10" & X"F" & "0000000" & "0100100" & X"0" & "01" & O"6" & "0000000",

-- L0257@0023.  regs <= load, MT_ROW = 0b1110, MT_COL = 15;
--  MT_CTRL = 00, MT_ROW = 1110, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 01, errcode <= 110, dummy = 0000000;
35 => "00" & X"E" & X"F" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "01" & O"6" & "0000000",

-- L0259@0024.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0110100 else 0110100, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
36 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0110100" & "0110100" & X"0" & "00" & O"6" & "0000000",

-- L0261@0025.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xE;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 1110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
37 => "10" & X"0" & X"E" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0262@0026.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xF;
--  MT_CTRL = 10, MT_ROW = 1100, MT_COL = 1111, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
38 => "10" & X"C" & X"F" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0263@0027.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xA , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 1010, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
39 => "10" & X"A" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0264@0028.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 1101, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
40 => "10" & X"D" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0265@0029.exec:  run_div2();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0101111 else 0101111, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
41 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0101111" & "0101111" & X"0" & "00" & O"6" & "0000000",

-- L0266@002A.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0001111, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
42 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0001111" & X"0" & "00" & O"6" & "0000000",

-- L0270@002B.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0110100 else 0110100, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
43 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0110100" & "0110100" & X"0" & "00" & O"6" & "0000000",

-- L0271@002C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
44 => "10" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0272@002D.  run_div2();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0101111 else 0101111, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
45 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0101111" & "0101111" & X"0" & "00" & O"6" & "0000000",

-- L0273@002E.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0001111, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
46 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0001111" & X"0" & "00" & O"6" & "0000000",

-- L0276@002F.run_div2:  bitcnt <= zero;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
47 => "00" & X"0" & X"0" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0277@0030.run_loop:  STATUS = busy_using_mt, regs <= div2, bitcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 10, errcode <= 110, dummy = 0000000;
48 => "00" & X"0" & X"0" & "10" & "11" & X"0" & "0000000" & "0000000" & X"0" & "10" & O"6" & "0000000",

-- L0278@0031.  if bitcnt_is_zero then return else run_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 0000010 else 0110000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
49 => "00" & X"0" & X"0" & "00" & "10" & X"6" & "0000010" & "0110000" & X"0" & "00" & O"6" & "0000000",

-- L0281@0032.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
50 => "10" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0282@0033.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
51 => "10" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0285@0034.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 10, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
52 => "10" & X"2" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0286@0035.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 10, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
53 => "10" & X"3" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0287@0036.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 10, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
54 => "10" & X"4" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0288@0037.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 10, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
55 => "10" & X"5" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0289@0038.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 10, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
56 => "10" & X"6" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0290@0039.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
57 => "10" & X"7" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & "00" & O"6" & "0000000",

-- L0293@003A.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
58 => "10" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0294@003B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
59 => "10" & X"1" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0295@003C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 10, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
60 => "10" & X"2" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0296@003D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 10, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
61 => "10" & X"3" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0297@003E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 10, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
62 => "10" & X"4" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0298@003F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 10, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
63 => "10" & X"5" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000",

-- L0299@0040.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
64 => "10" & X"6" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & "00" & O"6" & "0000000",

-- L0301@0041.trace:  if TRACE_CHAR then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 0000000 else 0000010, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
65 => "00" & X"0" & X"0" & "00" & "10" & X"3" & "0000000" & "0000010" & X"0" & "00" & O"6" & "0000000",

-- L0302@0042.  emit(char_I);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 0111, regs <= 00, errcode <= 110, dummy = 0000000;
66 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"7" & "00" & O"6" & "0000000",

-- L0303@0043.  emit(char_EQU);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 0110, regs <= 00, errcode <= 110, dummy = 0000000;
67 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"6" & "00" & O"6" & "0000000",

-- L0304@0044.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 1010, regs <= 00, errcode <= 110, dummy = 0000000;
68 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"A" & "00" & O"6" & "0000000",

-- L0305@0045.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 1001, regs <= 00, errcode <= 110, dummy = 0000000;
69 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"9" & "00" & O"6" & "0000000",

-- L0307@0046.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1001000 else 1001000, TXDCHAR <= 0010, regs <= 00, errcode <= 110, dummy = 0000000;
70 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1001000" & "1001000" & X"2" & "00" & O"6" & "0000000",

-- L0308@0047.  TXDCHAR <= char_lf;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0011, regs <= 00, errcode <= 110, dummy = 0000000;
71 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"3" & "00" & O"6" & "0000000",

-- L0310@0048.emit:  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
72 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & O"6" & "0000000",

-- L0311@0049.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
73 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & O"6" & "0000000",

-- L0312@004A.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
74 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & O"6" & "0000000",

-- L0313@004B.  if TXDSEND then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, errcode <= 110, dummy = 0000000;
75 => "00" & X"0" & X"0" & "00" & "10" & X"5" & "0000010" & "0000010" & X"0" & "00" & O"6" & "0000000",

-- 52 location(s) in following ranges will be filled with default value
-- 004C .. 007F

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & O"6" & "0000000"
);

end hexcalc_code;

