--------------------------------------------------------
-- mcc V1.2.0404 - Custom microcode compiler (c)2020-... 
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
-- L0015.MT_CTRL: .valfield 2 values nop, on, off, clear default nop;
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
-- L0021.MT_ROW: .valfield 4 values * default 0;
--
alias hxc_MT_ROW: 	std_logic_vector(3 downto 0) is hxc_uinstruction(49 downto 46);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_ROW <= hxc_MT_ROW;
---- End boilerplate code

--
-- L0022.MT_COL: .valfield 4 values * default 0;
--
alias hxc_MT_COL: 	std_logic_vector(3 downto 0) is hxc_uinstruction(45 downto 42);
-- Values from X"0" to X"F" allowed
---- Start boilerplate code (use with utmost caution!)
--  MT_COL <= hxc_MT_COL;
---- End boilerplate code

--
-- L0024.bitcnt: .regfield 2 values same, load, max, dec default same;
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
-- L0032.STATUS: .valfield 2 values ready, done, busy, busy_using_mt default busy;
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
-- L0044.seq_cond: .if 4 values true, input_is_zero, TRACE_INPUT, TRACE_RESULT, TXDREADY, TXDSEND, bitcnt_is_zero, loopcnt_is_zero, d_flag_is_set, c_flag_is_set, z_flagand_is_set, loopcnt_is_max, z_flagtos_is_set, z_flagnos_is_set, daa_flag_is_set, false default true;
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
constant seq_cond_loopcnt_is_max: 	integer := 11;
constant seq_cond_z_flagtos_is_set: 	integer := 12;
constant seq_cond_z_flagnos_is_set: 	integer := 13;
constant seq_cond_daa_flag_is_set: 	integer := 14;
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
--  cond(seq_cond_loopcnt_is_max) => loopcnt_is_max,
--  cond(seq_cond_z_flagtos_is_set) => z_flagtos_is_set,
--  cond(seq_cond_z_flagnos_is_set) => z_flagnos_is_set,
--  cond(seq_cond_daa_flag_is_set) => daa_flag_is_set,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0062.seq_then: .then 8 values next, repeat, return, fork, @ default next;
--
alias hxc_seq_then: 	std_logic_vector(7 downto 0) is hxc_uinstruction(33 downto 26);
constant seq_then_next: 	std_logic_vector(7 downto 0) := X"00";
constant seq_then_repeat: 	std_logic_vector(7 downto 0) := X"01";
constant seq_then_return: 	std_logic_vector(7 downto 0) := X"02";
constant seq_then_fork: 	std_logic_vector(7 downto 0) := X"03";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to hxc_seq_then

--
-- L0063.seq_else: .else 8 values next, repeat, return, fork, 0b0000000..0b1111111, @ default next;
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
-- L0066.TXDCHAR: .regfield 4 values same, char_space, char_cr, char_lf, char_E, char_R, char_EQU, char_I, char_zero, inp0, inp1, input, reg, -, -, errcode default same;
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
-- L0087.opr: .valfield 3 values np_np_np, np_np_ld, m2_d2_d2, np_m2_m2, d2_d2_d2, d2_d2_np, np_d2_d2, m2_m2_np default np_np_np;
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
-- L0098.errcode: .regfield 2 values ok, err_badchar, err_divzero, same default same;
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
-- L0105.d_flag: .regfield 2 values same, column, zero, one default same;
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
-- L0111.c_flag: .regfield 2 values same, adder, zero, one default same;
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
-- L0117.z_flags: .regfield 2 values same, update, -, set default same;
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
-- L0123.loopcnt: .regfield 2 values same, inc, max, dec default same;
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
-- L0130.selreg: .valfield 1 values external, internal default external;
--
alias hxc_selreg: 	std_logic is hxc_uinstruction(0);
constant selreg_external: 	std_logic := '0';
constant selreg_internal: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	selreg <= internal when (hxc_selreg = selreg_internal) else external;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0213@0000._reset:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0215@0001._reset1:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0217@0002._reset2:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0219@0003._reset3:  MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0223@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 00000001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & X"01" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0224@0005.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000011 else 00000011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"03" & X"03" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0227@0006.badchar:  errcode <= err_badchar, if false then next else printerror;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00001000, TXDCHAR <= 0000, opr = 000, errcode <= 01, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
6 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"08" & X"0" & O"0" & "01" & "00" & "00" & "00" & "00" & '0',

-- L0228@0007.divzero:  errcode <= err_divzero, if false then next else printerror;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00001000, TXDCHAR <= 0000, opr = 000, errcode <= 10, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
7 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"08" & X"0" & O"0" & "10" & "00" & "00" & "00" & "00" & '0',

-- L0229@0008.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 0100, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
8 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"4" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0230@0009.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0231@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0232@000B.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 1111, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"F" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0233@000C.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 0001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"1" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0234@000D.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 1010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"A" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0235@000E.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 1001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"9" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0236@000F.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100111 else 11100111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E7" & X"E7" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0243@0010.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
16 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0244@0011.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 00000000 else 00000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
17 => "00" & X"0" & X"0" & "00" & "01" & X"F" & X"00" & X"04" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0249@0012.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
18 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0250@0013.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11000000 else 11000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
19 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"C0" & X"C0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0251@0014.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
20 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0257@0015.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
21 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0258@0016.dup:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11000000 else 11000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
22 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"C0" & X"C0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0259@0017.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
23 => "01" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0265@0018.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
24 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0266@0019.rotate:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11000000 else 11000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
25 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"C0" & X"C0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0267@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
26 => "01" & X"7" & X"0" & "00" & "11" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0273@001B.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
27 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0274@001C.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10110111 else 10110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
28 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"B7" & X"B7" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0275@001D.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
29 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0280@001E.  prep_shift();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10110000 else 10110000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
30 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"B0" & X"B0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0281@001F.lsr_loop:  STATUS = busy_using_mt, opr = m2_m2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 00101001 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 01, loopcnt <= 00, selreg = 0;
31 => "00" & X"0" & X"0" & "00" & "11" & X"6" & X"29" & X"00" & X"0" & O"7" & "11" & "01" & "00" & "01" & "00" & '0',

-- L0282@0020.  bitcnt <= dec, if false then next else lsr_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 00011111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
32 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"1F" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0287@0021.  prep_shift();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10110000 else 10110000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
33 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"B0" & X"B0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0288@0022.lsl_loop:  STATUS = busy_using_mt, opr = d2_d2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 00101001 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 01, loopcnt <= 00, selreg = 0;
34 => "00" & X"0" & X"0" & "00" & "11" & X"6" & X"29" & X"00" & X"0" & O"5" & "11" & "01" & "00" & "01" & "00" & '0',

-- L0289@0023.  bitcnt <= dec, if false then next else lsl_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 00100010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
35 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"22" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0295@0024.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
36 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0296@0025.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
37 => "11" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"28" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0302@0026.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
38 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0303@0027.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111001 else 10111001, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
39 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"B9" & X"B9" & X"0" & O"0" & "00" & "00" & "00" & "00" & "00" & '0',

-- L0304@0028.exec:  div2(max, set);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
40 => "00" & X"0" & X"0" & "10" & "10" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0305@0029.done:  print_st();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11011110 else 11011110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
41 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"DE" & X"DE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0306@002A.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00010001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
42 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"11" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0311@002B.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
43 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0315@002C.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11000111 else 11000111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
44 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"C7" & X"C7" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0316@002D.add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
45 => "01" & X"1" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0317@002E.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
46 => "01" & X"B" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0318@002F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
47 => "01" & X"0" & X"C" & "00" & "11" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0323@0030.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
48 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0324@0031.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11000111 else 11000111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
49 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"C7" & X"C7" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0325@0032.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
50 => "01" & X"1" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0326@0033.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
51 => "01" & X"9" & X"D" & "00" & "11" & X"F" & X"00" & X"2E" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0331@0034.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
52 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0332@0035.div:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10101011 else 10101011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
53 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"AB" & X"AB" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0333@0036.  if z_flagtos_is_set then divzero;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1100) then 00000111 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
54 => "00" & X"0" & X"0" & "00" & "10" & X"C" & X"07" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0335@0037.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
55 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0336@0038.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
56 => "01" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "10" & "00" & "00" & "00" & '0',

-- L0337@0039.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
57 => "01" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0338@003A.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
58 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0339@003B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
59 => "10" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0340@003C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
60 => "10" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0341@003D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
61 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0344@003E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
62 => "01" & X"7" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0345@003F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 10101000 else 10101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
63 => "01" & X"9" & X"D" & "00" & "11" & X"0" & X"A8" & X"A8" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0347@0040.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
--  MT_CTRL = 10, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1001) then 00000000 else 01001011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
64 => "10" & X"9" & X"D" & "00" & "11" & X"9" & X"00" & X"4B" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0350@0041.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
65 => "01" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0351@0042.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
66 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0352@0043.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
67 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0353@0044.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
68 => "01" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0354@0045.  STATUS = busy_using_mt, opr = d2_d2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
69 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0355@0046.  d_flag <= one;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
70 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "11" & "00" & "00" & "00" & '0',

-- L0356@0047.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
71 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0357@0048.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111010 else 10111010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
72 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"BA" & X"BA" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0359@0049.div_next:  if loopcnt_is_zero then swap;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 00011100 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
73 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"1C" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0360@004A.  loopcnt <= dec, if false then next else div_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
74 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "11" & '0',

-- L0363@004B.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 10101000 else 10101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
75 => "01" & X"7" & X"D" & "00" & "11" & X"0" & X"A8" & X"A8" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0364@004C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 01001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
76 => "10" & X"7" & X"D" & "00" & "11" & X"F" & X"00" & X"49" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0369@004D.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
77 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0370@004E.mul:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10101011 else 10101011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
78 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"AB" & X"AB" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0371@004F.  if z_flagnos_is_set then done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1101) then 00101001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
79 => "00" & X"0" & X"0" & "00" & "10" & X"D" & X"29" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0373@0050.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
80 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0374@0051.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
81 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "00" & '0',

-- L0375@0052.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
82 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0376@0053.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (1000) then 01010100 else 01011000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
83 => "10" & X"1" & X"8" & "00" & "11" & X"8" & X"54" & X"58" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0379@0054.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
84 => "01" & X"7" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0380@0055.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
85 => "01" & X"0" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0381@0056.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
86 => "01" & X"B" & X"0" & "10" & "11" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0382@0057.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1001) then 01011001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
87 => "10" & X"B" & X"0" & "00" & "11" & X"9" & X"59" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0385@0058.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 01011010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
88 => "01" & X"0" & X"1" & "00" & "11" & X"F" & X"00" & X"5A" & X"0" & O"0" & "11" & "10" & "00" & "00" & "00" & '0',

-- L0386@0059.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
89 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "11" & "00" & "00" & "00" & '0',

-- L0387@005A.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
90 => "01" & X"8" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0388@005B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
91 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0391@005C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
92 => "10" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0392@005D.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
93 => "10" & X"8" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0393@005E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0111) then 00101001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
94 => "01" & X"1" & X"1" & "00" & "11" & X"7" & X"29" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0394@005F.  loopcnt <= dec, if false then next else m_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 01010000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
95 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"50" & X"0" & O"0" & "11" & "00" & "00" & "00" & "11" & '0',

-- L0399@0060.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
96 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0400@0061.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11000000 else 11000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
97 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"C0" & X"C0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0401@0062.  div2(max, set);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
98 => "00" & X"0" & X"0" & "10" & "10" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0402@0063.  bitcnt <= max, if z_flagtos_is_set then conv_done0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (1100) then 01110101 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
99 => "00" & X"0" & X"0" & "10" & "10" & X"C" & X"75" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0403@0064.bitcnt_s0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111010 else 10111010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
100 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"BA" & X"BA" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0404@0065.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
101 => "01" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0405@0066.  STATUS = busy_using_mt, opr = d2_d2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
102 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0406@0067.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
103 => "10" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0407@0068.  loopcnt <= max;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
104 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0408@0069.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
105 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0409@006A.loopcnt_s0:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
106 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0410@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
107 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0412@006C.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
108 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "11" & '0',

-- L0413@006D.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
109 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "11" & '0',

-- L0414@006E.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
110 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "11" & '0',

-- L0415@006F.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
111 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "11" & '0',

-- L0416@0070.  if d_flag_is_set then next else loopcnt_n0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1000) then 00000000 else 01110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
112 => "00" & X"0" & X"0" & "00" & "10" & X"8" & X"00" & X"72" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0417@0071.  bcd_adjust(one);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
113 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0418@0072.loopcnt_n0:  if loopcnt_is_zero then next else loopcnt_s0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 00000000 else 01101010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
114 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"00" & X"6A" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0419@0073.  if bitcnt_is_zero then conv_done0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 01110101 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
115 => "00" & X"0" & X"0" & "00" & "10" & X"6" & X"75" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0420@0074.  bitcnt <= dec, if false then next else bitcnt_s0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 01100100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
116 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"64" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0421@0075.conv_done0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11000111 else 11000111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
117 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"C7" & X"C7" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0422@0076.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
118 => "01" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0427@0077.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
119 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0428@0078.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111010 else 10111010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
120 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"BA" & X"BA" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0429@0079.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
121 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0430@007A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
122 => "01" & X"1" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0431@007B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
123 => "01" & X"0" & X"0" & "10" & "11" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0432@007C.  bitcnt <= max, if z_flagtos_is_set then done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (1100) then 00101001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
124 => "00" & X"0" & X"0" & "10" & "10" & X"C" & X"29" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0433@007D.bitcnt_s1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111010 else 10111010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
125 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"BA" & X"BA" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0434@007E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
126 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0435@007F.  if true then next else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
127 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0436@0080.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
128 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0437@0081.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
129 => "10" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0438@0082.  loopcnt <= max;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
130 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0439@0083.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
131 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0440@0084.loopcnt_s1:  c_flag <= one, opr = np_np_ld, MT_COL = 5;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
132 => "00" & X"0" & X"5" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"1" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0441@0085.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
133 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0442@0086.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
134 => "01" & X"1" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0443@0087.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
135 => "01" & X"D" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0444@0088.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
136 => "01" & X"9" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0446@0089.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 11, selreg = 0;
137 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "11" & '0',

-- L0447@008A.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 11, selreg = 0;
138 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "11" & '0',

-- L0448@008B.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 11, selreg = 0;
139 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "11" & '0',

-- L0449@008C.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 11, selreg = 0;
140 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "11" & '0',

-- L0450@008D.  if c_flag_is_set then next else loopcnt_n1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1001) then 00000000 else 10010001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
141 => "00" & X"0" & X"0" & "00" & "10" & X"9" & X"00" & X"91" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0451@008E.  if bitcnt_is_zero then loopcnt_n1 else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 10010001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
142 => "00" & X"0" & X"0" & "00" & "10" & X"6" & X"91" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0452@008F.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
--  MT_CTRL = 10, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
143 => "10" & X"9" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0453@0090.  bcd_adjust(zero);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
144 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0454@0091.loopcnt_n1:  if loopcnt_is_zero then next else loopcnt_s1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 00000000 else 10000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
145 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"00" & X"84" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0455@0092.  if bitcnt_is_zero then conv_done1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 10010100 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
146 => "00" & X"0" & X"0" & "00" & "10" & X"6" & X"94" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0456@0093.  bitcnt <= dec, if false then next else bitcnt_s1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 01111101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
147 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"7D" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0457@0094.conv_done1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111010 else 10111010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
148 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"BA" & X"BA" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0458@0095.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
149 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0459@0096.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
150 => "01" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0460@0097.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 1, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00101000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
151 => "01" & X"7" & X"1" & "00" & "11" & X"F" & X"00" & X"28" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0473@0098.  opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 10011100, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
152 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"9C" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0479@0099.  opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 10011100, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
153 => "00" & X"0" & X"D" & "00" & "10" & X"F" & X"00" & X"9C" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0483@009A.  opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 10011100, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
154 => "00" & X"0" & X"F" & "00" & "10" & X"F" & X"00" & X"9C" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0492@009B.  opr = np_np_ld, MT_COL = 0b1001;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
155 => "00" & X"0" & X"9" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0493@009C.hexchar:  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
156 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0494@009D.  bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 11, if (0000) then 10111001 else 10111001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
157 => "11" & X"0" & X"3" & "01" & "11" & X"0" & X"B9" & X"B9" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0495@009E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 1100, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
158 => "01" & X"C" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0496@009F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
159 => "01" & X"D" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0497@00A0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
160 => "01" & X"B" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0498@00A1.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 010, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
161 => "00" & X"0" & X"0" & "11" & "11" & X"6" & X"00" & X"01" & X"0" & O"2" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0499@00A2.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
162 => "10" & X"B" & X"0" & "10" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0500@00A3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
163 => "01" & X"0" & X"0" & "11" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0501@00A4.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
164 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0502@00A5.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
165 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0503@00A6.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
166 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0504@00A7.  STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 00010001 else 00000001, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
167 => "00" & X"0" & X"0" & "11" & "11" & X"6" & X"11" & X"01" & X"0" & O"6" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0510@00A8.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
168 => "01" & X"0" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0511@00A9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
169 => "01" & X"B" & X"0" & "10" & "11" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0512@00AA.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
170 => "10" & X"B" & X"0" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0515@00AB.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111001 else 10111001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
171 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"B9" & X"B9" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0516@00AC.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
172 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0517@00AD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
173 => "01" & X"0" & X"7" & "10" & "11" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0518@00AE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
174 => "01" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0519@00AF.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
175 => "10" & X"0" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0522@00B0.prep_shift:  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100110 else 11100110, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
176 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E6" & X"E6" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0523@00B1.lsr:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 10111001 else 10111001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
177 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"B9" & X"B9" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0524@00B2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
178 => "01" & X"0" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0525@00B3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
179 => "01" & X"8" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0526@00B4.  d_flag <= zero, bitcnt <= max, z_flags <= set, if true then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
180 => "00" & X"0" & X"0" & "10" & "10" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "10" & "00" & "11" & "00" & '0',

-- L0529@00B5.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 00000010 else 00000000, TXDCHAR <= 0000, opr = 100, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
181 => "00" & X"0" & X"0" & "00" & "11" & X"6" & X"02" & X"00" & X"0" & O"4" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0530@00B6.  bitcnt <= dec, if false then next else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
182 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0533@00B7.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
183 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0534@00B8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 10111010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
184 => "01" & X"1" & X"0" & "00" & "11" & X"F" & X"00" & X"BA" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0537@00B9.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
185 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0539@00BA.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
186 => "01" & X"2" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0540@00BB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
187 => "01" & X"3" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0541@00BC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
188 => "01" & X"4" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0542@00BD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
189 => "01" & X"5" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0543@00BE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
190 => "01" & X"6" & X"6" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0544@00BF.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
191 => "01" & X"7" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0547@00C0.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
192 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0548@00C1.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
193 => "01" & X"1" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0549@00C2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
194 => "01" & X"2" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0550@00C3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
195 => "01" & X"3" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0551@00C4.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
196 => "01" & X"4" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0552@00C5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
197 => "01" & X"5" & X"6" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0553@00C6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
198 => "01" & X"6" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0556@00C7.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
199 => "01" & X"2" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0557@00C8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
200 => "01" & X"3" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0558@00C9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
201 => "01" & X"4" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0559@00CA.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
202 => "01" & X"5" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0560@00CB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
203 => "01" & X"6" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0561@00CC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
204 => "01" & X"7" & X"6" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0565@00CD.bcd_adjust:  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
205 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0566@00CE.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
206 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0567@00CF.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
207 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0568@00D0.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
208 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0571@00D1.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
209 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0572@00D2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
210 => "01" & X"1" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0573@00D3.  opr = np_np_ld, MT_COL = 3, if c_flag_is_set then next else bcd_add3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1001) then 00000000 else 11010110, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
211 => "00" & X"0" & X"3" & "00" & "10" & X"9" & X"00" & X"D6" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0576@00D4.bcd_sub3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
212 => "01" & X"D" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0577@00D5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else bcd_3;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 11010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
213 => "01" & X"9" & X"D" & "00" & "11" & X"F" & X"00" & X"D7" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0580@00D6.bcd_add3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
214 => "01" & X"D" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0582@00D7.bcd_3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
215 => "01" & X"B" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0583@00D8.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
216 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0584@00D9.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
217 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0585@00DA.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
218 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0586@00DB.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
219 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0587@00DC.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
220 => "10" & X"B" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0588@00DD.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xD , MT_COL = 0xD, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 1101, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
221 => "10" & X"D" & X"D" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0591@00DE.print_st:  loopcnt <= max, if TRACE_RESULT then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 00000000 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
222 => "00" & X"0" & X"0" & "00" & "10" & X"3" & X"00" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0592@00DF.  loopcnt <= inc, print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100111 else 11100111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
223 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E7" & X"E7" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0593@00E0.st_loop:  selreg = internal, emit(reg);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 1100, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 1;
224 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"C" & O"0" & "11" & "00" & "00" & "00" & "00" & '1',

-- L0594@00E1.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
225 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0595@00E2.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
226 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0596@00E3.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
227 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0597@00E4.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
228 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0598@00E5.  if loopcnt_is_zero then print_crlf else st_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 11100111 else 11100000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
229 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"E7" & X"E0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0600@00E6.echo:  if TRACE_INPUT then emit else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 11101001 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
230 => "00" & X"0" & X"0" & "00" & "10" & X"2" & X"E9" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0602@00E7.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11101001 else 11101001, TXDCHAR <= 0010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
231 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E9" & X"E9" & X"2" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0603@00E8.  TXDCHAR <= char_lf;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
232 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"3" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0605@00E9.emit:  if TXDSEND then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
233 => "00" & X"0" & X"0" & "00" & "10" & X"5" & X"00" & X"01" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0606@00EA.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
234 => "00" & X"0" & X"0" & "00" & "10" & X"4" & X"00" & X"01" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0607@00EB.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
235 => "00" & X"0" & X"0" & "00" & "10" & X"4" & X"00" & X"01" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0608@00EC.  TXDCHAR <= char_zero, if true then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000010 else 00000010, TXDCHAR <= 1000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
236 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"02" & X"02" & X"8" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- 19 location(s) in following ranges will be filled with default value
-- 00ED .. 00FF

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0'
);

end hexcalc_code;

