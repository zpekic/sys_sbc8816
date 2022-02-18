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
-- L0114.carry: .regfield 2 values same, adc, zero, one default same;
--
alias hxc_carry: 	std_logic_vector(1 downto 0) is hxc_uinstruction(2 downto 1);
constant carry_same: 	std_logic_vector(1 downto 0) := "00";
constant carry_adc: 	std_logic_vector(1 downto 0) := "01";
constant carry_zero: 	std_logic_vector(1 downto 0) := "10";
constant carry_one: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_carry: process(clk, hxc_carry)
-- begin
--	if (rising_edge(clk)) then
--		case hxc_carry is
----			when carry_same =>
----				carry <= carry;
--			when carry_adc =>
--				carry <= adc;
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
-- L0121.dummy: .valfield 1 values * default 0;
--
alias hxc_dummy: 	std_logic is hxc_uinstruction(0);
-- Values from '0' to '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  dummy <= hxc_dummy;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0188@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, carry <= 00, dummy = 0;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & "00" & '0',

-- L0190@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, carry <= 00, dummy = 0;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & "00" & '0',

-- L0192@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, carry <= 00, dummy = 0;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & "00" & '0',

-- L0194@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, carry <= 00, dummy = 0;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & "00" & '0',

-- L0198@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 0000001 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & "0000001" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0199@0005.  trace();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1010011 else 1010011, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1010011" & "1010011" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0200@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000011 else 0000011, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000011" & "0000011" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0203@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 0001000 else 0010000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 001, delay <= 00, carry <= 00, dummy = 0;
7 => "00" & X"0" & X"0" & "00" & "10" & X"2" & "0001000" & "0010000" & X"0" & "00" & "00" & O"1" & "00" & "00" & '0',

-- L0204@0008.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0100, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
8 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"4" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0205@0009.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0101, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"5" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0206@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0101, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"5" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0207@000B.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 1111, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"F" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0208@000C.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0001, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"1" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0209@000D.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 1010, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"A" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0210@000E.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 1001, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"9" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0211@000F.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011000 else 1011000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011000" & "1011000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0216@0010.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 0000000 else 0000100, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
16 => "00" & X"0" & X"0" & "00" & "01" & X"F" & "0000000" & "0000100" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0221@0011.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0111110 else 0111110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
17 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "0111110" & "0111110" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0222@0012.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
18 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0227@0013.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, carry <= 00, dummy = 0;
19 => "11" & X"0" & X"0" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"0" & "00" & "00" & '0',

-- L0232@0014.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000000 else 1000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
20 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000000" & "1000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0233@0015.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 000, delay <= 00, carry <= 00, dummy = 0;
21 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"0" & "00" & "00" & '0',

-- L0234@0016.exec:  bitcnt <= load, MT_COL = 0, div2();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 01, STATUS = 10, if (0000) then 0111100 else 0111100, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
22 => "00" & X"0" & X"0" & "01" & "10" & X"0" & "0111100" & "0111100" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0235@0017.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
23 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0239@0018.plus:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000000 else 1000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
24 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000000" & "1000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0240@0019.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
25 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0241@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
26 => "01" & X"B" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0242@001B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
27 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0243@001C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD, carry <= zero, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 10, dummy = 0;
28 => "01" & X"1" & X"D" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"6" & "00" & "10" & '0',

-- L0247@001D.minus:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000000 else 1000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
29 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000000" & "1000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0248@001E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
30 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0249@001F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
31 => "01" & X"B" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0250@0020.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
32 => "01" & X"0" & X"C" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0251@0021.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
33 => "01" & X"1" & X"9" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0252@0022.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, carry <= one, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 11, dummy = 0;
34 => "01" & X"9" & X"D" & "00" & "11" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"6" & "00" & "11" & '0',

-- L0256@0023.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000110 else 1000110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
35 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000110" & "1000110" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0257@0024.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0010110, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
36 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0010110" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0261@0025.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
37 => "00" & X"0" & X"0" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0264@0026.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
38 => "00" & X"0" & X"8" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0267@0027.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
39 => "00" & X"0" & X"4" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0270@0028.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
40 => "00" & X"0" & X"C" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0273@0029.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
41 => "00" & X"0" & X"2" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0276@002A.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1010, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
42 => "00" & X"0" & X"A" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0279@002B.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
43 => "00" & X"0" & X"6" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0282@002C.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1110, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
44 => "00" & X"0" & X"E" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0285@002D.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
45 => "00" & X"0" & X"1" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0288@002E.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
46 => "00" & X"0" & X"9" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0292@002F.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
47 => "00" & X"0" & X"5" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0296@0030.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
48 => "00" & X"0" & X"D" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0300@0031.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
49 => "00" & X"0" & X"3" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0304@0032.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1011, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
50 => "00" & X"0" & X"B" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0308@0033.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 10, if (1111) then 0000000 else 0110101, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
51 => "00" & X"0" & X"7" & "00" & "10" & X"F" & "0000000" & "0110101" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0312@0034.  regs <= load, MT_ROW = 0b0000, MT_COL = 0b1111;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 01, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
52 => "00" & X"0" & X"F" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "01" & "00" & O"6" & "00" & "00" & '0',

-- L0313@0035.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 1000000 else 1000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
53 => "11" & X"0" & X"0" & "00" & "11" & X"0" & "1000000" & "1000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0314@0036.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
54 => "01" & X"1" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0315@0037.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
55 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0316@0038.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
56 => "01" & X"D" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0317@0039.  STATUS = busy_using_mt, reg0 <= mul2, regs <= div2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 10, reg0 <= 11, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
57 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0000000" & "0000001" & X"0" & "10" & "11" & O"6" & "00" & "00" & '0',

-- L0318@003A.  bitcnt <= load, MT_COL = 3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 10, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
58 => "00" & X"0" & X"3" & "01" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0319@003B.  STATUS = busy_using_mt, regs <= mul2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 0010000 else 0000001, TXDCHAR <= 0000, regs <= 11, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
59 => "00" & X"0" & X"0" & "11" & "11" & X"6" & "0010000" & "0000001" & X"0" & "11" & "00" & O"6" & "00" & "00" & '0',

-- L0322@003C.div2:  STATUS = busy_using_mt, reg0 <= div2, regs <= div2, bitcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 10, reg0 <= 10, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
60 => "00" & X"0" & X"0" & "10" & "11" & X"0" & "0000000" & "0000000" & X"0" & "10" & "10" & O"6" & "00" & "00" & '0',

-- L0323@003D.  if bitcnt_is_zero then return else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 0000010 else 0111100, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
61 => "00" & X"0" & X"0" & "00" & "10" & X"6" & "0000010" & "0111100" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0326@003E.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
62 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0327@003F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
63 => "01" & X"1" & X"0" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0330@0040.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
64 => "01" & X"2" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0331@0041.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
65 => "01" & X"3" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0332@0042.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
66 => "01" & X"4" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0333@0043.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
67 => "01" & X"5" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0334@0044.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
68 => "01" & X"6" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0335@0045.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
69 => "01" & X"7" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0338@0046.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
70 => "01" & X"0" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0339@0047.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
71 => "01" & X"1" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0340@0048.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
72 => "01" & X"2" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0341@0049.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
73 => "01" & X"3" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0342@004A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
74 => "01" & X"4" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0343@004B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
75 => "01" & X"5" & X"6" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0344@004C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
76 => "01" & X"6" & X"7" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0347@004D.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
77 => "01" & X"2" & X"1" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0348@004E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
78 => "01" & X"3" & X"2" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0349@004F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
79 => "01" & X"4" & X"3" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0350@0050.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
80 => "01" & X"5" & X"4" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0351@0051.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 0000000 else 0000000, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
81 => "01" & X"6" & X"5" & "00" & "11" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0352@0052.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
82 => "01" & X"7" & X"6" & "00" & "11" & X"0" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0354@0053.trace:  if TRACE_CHAR then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 0000000 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
83 => "00" & X"0" & X"0" & "00" & "10" & X"3" & "0000000" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0355@0054.  emit(char_I);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0111, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
84 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"7" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0356@0055.  emit(char_EQU);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0110, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
85 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"6" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0357@0056.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 1010, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
86 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"A" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0358@0057.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 1001, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
87 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"9" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0360@0058.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0010, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
88 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"2" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0361@0059.  emit(char_lf);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 1011011 else 1011011, TXDCHAR <= 0011, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
89 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "1011011" & "1011011" & X"3" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0362@005A.  if true then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
90 => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0364@005B.emit:  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
91 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0365@005C.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
92 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0366@005D.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 0000000 else 0000001, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
93 => "00" & X"0" & X"0" & "00" & "10" & X"4" & "0000000" & "0000001" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- L0367@005E.  if TXDSEND then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 0000010 else 0000010, TXDCHAR <= 0000, regs <= 00, reg0 <= 00, errcode <= 110, delay <= 00, carry <= 00, dummy = 0;
94 => "00" & X"0" & X"0" & "00" & "10" & X"5" & "0000010" & "0000010" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0',

-- 33 location(s) in following ranges will be filled with default value
-- 005F .. 007F

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & "0000000" & "0000000" & X"0" & "00" & "00" & O"6" & "00" & "00" & '0'
);

end hexcalc_code;

