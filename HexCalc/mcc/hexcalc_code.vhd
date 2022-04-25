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
-- L0044.seq_cond: .if 4 values true, input_is_zero, TRACE_INPUT, TRACE_RESULT, TXDREADY, TXDSEND, bitcnt_is_zero, loopcnt_is_zero, d_flag_is_set, c_flag_is_set, z_flagand_is_set, loopcnt_is_max, z_flagtos_is_set, z_flagnos_is_set, loopcnt_nibble, false default true;
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
constant seq_cond_loopcnt_nibble: 	integer := 14;
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
--  cond(seq_cond_loopcnt_nibble) => loopcnt_nibble,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0063.seq_then: .then 8 values next, repeat, return, fork, @ default next;
--
alias hxc_seq_then: 	std_logic_vector(7 downto 0) is hxc_uinstruction(33 downto 26);
constant seq_then_next: 	std_logic_vector(7 downto 0) := X"00";
constant seq_then_repeat: 	std_logic_vector(7 downto 0) := X"01";
constant seq_then_return: 	std_logic_vector(7 downto 0) := X"02";
constant seq_then_fork: 	std_logic_vector(7 downto 0) := X"03";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to hxc_seq_then

--
-- L0064.seq_else: .else 8 values next, repeat, return, fork, 0b0000000..0b1111111, @ default next;
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
-- L0067.TXDCHAR: .regfield 4 values same, char_space, char_cr, char_lf, char_E, char_R, char_EQU, char_I, char_zero, inp0, inp1, input, reg, -, -, errcode default same;
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
-- L0088.opr: .valfield 3 values np_np_np, np_np_ld, m2_d2_d2, np_m2_m2, d2_d2_d2, d2_d2_np, np_d2_d2, m2_m2_np default np_np_np;
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
-- L0099.errcode: .regfield 2 values ok, err_badchar, err_divzero, same default same;
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
-- L0106.d_flag: .regfield 2 values same, column, zero, one default same;
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
-- L0112.c_flag: .regfield 2 values same, adder, zero, one default same;
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
-- L0118.z_flags: .regfield 2 values same, update, -, set default same;
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
-- L0124.loopcnt: .regfield 2 values same, inc, max, dec default same;
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
-- L0131.selreg: .valfield 1 values external, internal default external;
--
alias hxc_selreg: 	std_logic is hxc_uinstruction(0);
constant selreg_external: 	std_logic := '0';
constant selreg_internal: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	selreg <= internal when (hxc_selreg = selreg_internal) else external;
---- End boilerplate code



constant hxc_microcode: hxc_code_memory := (

-- L0221@0000._reset:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 10, c_flag <= 10, z_flags <= 11, loopcnt <= 00, selreg = 0;
0 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "10" & "10" & "11" & "00" & '0',

-- L0223@0001._reset1:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 10, c_flag <= 10, z_flags <= 11, loopcnt <= 00, selreg = 0;
1 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "10" & "10" & "11" & "00" & '0',

-- L0225@0002._reset2:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 10, c_flag <= 10, z_flags <= 11, loopcnt <= 00, selreg = 0;
2 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "10" & "10" & "11" & "00" & '0',

-- L0227@0003._reset3:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 10, c_flag <= 10, z_flags <= 11, loopcnt <= 00, selreg = 0;
3 => "11" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "00" & "10" & "10" & "11" & "00" & '0',

-- L0231@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 00, if (0001) then 00000001 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
4 => "00" & X"0" & X"0" & "00" & "00" & X"1" & X"01" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0232@0005.  echo(input);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111000 else 11111000, TXDCHAR <= 1011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
5 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"F8" & X"F8" & X"B" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0233@0006.  if true then fork else fork;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000011 else 00000011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
6 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"03" & X"03" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0236@0007.badchar:  errcode <= err_badchar, if false then next else printerror;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00001001, TXDCHAR <= 0000, opr = 000, errcode <= 01, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
7 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"09" & X"0" & O"0" & "01" & "00" & "00" & "00" & "00" & '0',

-- L0237@0008.divzero:  errcode <= err_divzero, if false then next else printerror;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00001001, TXDCHAR <= 0000, opr = 000, errcode <= 10, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
8 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"09" & X"0" & O"0" & "10" & "00" & "00" & "00" & "00" & '0',

-- L0238@0009.printerror:  emit(char_E);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 0100, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
9 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"4" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0239@000A.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
10 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0240@000B.  emit(char_R);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 0101, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
11 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"5" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0241@000C.  emit(errcode);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 1111, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
12 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"F" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0242@000D.  emit(char_space);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 0001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
13 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"1" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0243@000E.  emit(inp1);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 1010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
14 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"A" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0244@000F.  emit(inp0);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 1001, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
15 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"9" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0245@0010.  print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111001 else 11111001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
16 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"F9" & X"F9" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0252@0011.nextchar:  STATUS = done, if false then next else deadloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 01, if (1111) then 00000000 else 00000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
17 => "00" & X"0" & X"0" & "00" & "01" & X"F" & X"00" & X"04" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0257@0012.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11010100 else 11010100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
18 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"D4" & X"D4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0258@0013.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
19 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0264@0014.  dup();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11000111 else 11000111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
20 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"C7" & X"C7" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0265@0015.  if false then next else done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00111000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
21 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"38" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0271@0016.rotate:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11010100 else 11010100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
22 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"D4" & X"D4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0272@0017.r7_to_tos:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
23 => "01" & X"7" & X"0" & "00" & "11" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0278@0018.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001011 else 11001011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
24 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CB" & X"CB" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0279@0019.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
25 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0284@001A.  shift_down();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10111110 else 10111110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
26 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"BE" & X"BE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0285@001B.  if false then next else done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00111000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
27 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"38" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0290@001C.  shift_up();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11000001 else 11000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
28 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"C1" & X"C1" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0291@001D.  if false then next else done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00111000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
29 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"38" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0297@001E.  dup();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11000111 else 11000111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
30 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"C7" & X"C7" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0298@001F.  shift_down();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10111110 else 10111110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
31 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"BE" & X"BE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0299@0020.  if z_flagtos_is_set then next else root;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1100) then 00000000 else 00100011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
32 => "00" & X"0" & X"0" & "00" & "10" & X"C" & X"00" & X"23" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0300@0021.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11011011 else 11011011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
33 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"DB" & X"DB" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0301@0022.  if false then next else exec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
34 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0302@0023.root:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11010100 else 11010100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
35 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"D4" & X"D4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0303@0024.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
36 => "10" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0304@0025.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
37 => "01" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0305@0026.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
38 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0306@0027.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 6 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
39 => "10" & X"6" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0307@0028.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
40 => "01" & X"0" & X"7" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0309@0029.  heron_step();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
41 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0311@002A.root_loop:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
42 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0312@002B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
43 => "01" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0313@002C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
44 => "01" & X"0" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0314@002D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
45 => "01" & X"7" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0315@002E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, c_flag <= one, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 11, loopcnt <= 00, selreg = 0;
46 => "01" & X"9" & X"D" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "11" & "11" & "00" & '0',

-- L0316@002F.  if c_flag_is_set then next else root_cont;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1001) then 00000000 else 00110001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
47 => "00" & X"0" & X"0" & "00" & "10" & X"9" & X"00" & X"31" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0317@0030.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 0, if false then next else r7_to_tos;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
48 => "10" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"17" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0319@0031.root_cont:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
49 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0320@0032.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
50 => "01" & X"0" & X"7" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0321@0033.  heron_step();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10110101 else 10110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
51 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"B5" & X"B5" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0322@0034.  if false then next else root_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00101010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
52 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"2A" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0328@0035.  c_flag <= zero, d_flag <= zero, z_flags <= set, errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 10, c_flag <= 10, z_flags <= 11, loopcnt <= 00, selreg = 0;
53 => "11" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"37" & X"0" & O"0" & "00" & "10" & "10" & "11" & "00" & '0',

-- L0334@0036.  c_flag <= zero, d_flag <= zero, z_flags <= set, errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 00, d_flag <= 10, c_flag <= 10, z_flags <= 11, loopcnt <= 00, selreg = 0;
54 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "00" & "10" & "10" & "11" & "00" & '0',

-- L0335@0037.exec:  div2(max, set);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
55 => "00" & X"0" & X"0" & "10" & "10" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0336@0038.done:  print_st();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11110010 else 11110010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
56 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"F2" & X"F2" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0337@0039.  if false then next else nextchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00010001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
57 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"11" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0344@003A.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11011011 else 11011011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
58 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"DB" & X"DB" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0345@003B.add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
59 => "01" & X"1" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0346@003C.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
60 => "01" & X"B" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0347@003D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
61 => "01" & X"0" & X"C" & "00" & "11" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0352@003E.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11011011 else 11011011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
62 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"DB" & X"DB" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0353@003F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
63 => "01" & X"1" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0354@0040.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00111100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
64 => "01" & X"9" & X"D" & "00" & "11" & X"F" & X"00" & X"3C" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0359@0041.  divmod();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 01000011 else 01000011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
65 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"43" & X"43" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0360@0042.  if false then next else swap;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 00011000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
66 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"18" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0362@0043.divmod:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10110000 else 10110000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
67 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"B0" & X"B0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0363@0044.  if z_flagtos_is_set then divzero;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1100) then 00001000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
68 => "00" & X"0" & X"0" & "00" & "10" & X"C" & X"08" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0365@0045.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
69 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0366@0046.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
70 => "01" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "10" & "00" & "00" & "00" & '0',

-- L0367@0047.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
71 => "01" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0368@0048.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
72 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0369@0049.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
73 => "10" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0370@004A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
74 => "10" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0371@004B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
75 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0374@004C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
76 => "01" & X"7" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0375@004D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 10101101 else 10101101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
77 => "01" & X"9" & X"D" & "00" & "11" & X"0" & X"AD" & X"AD" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0377@004E.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
--  MT_CTRL = 10, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1001) then 00000000 else 01011001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
78 => "10" & X"9" & X"D" & "00" & "11" & X"9" & X"00" & X"59" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0380@004F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
79 => "01" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0381@0050.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
80 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0382@0051.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
81 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0383@0052.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
82 => "01" & X"8" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0384@0053.  STATUS = busy_using_mt, opr = d2_d2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
83 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0385@0054.  d_flag <= one;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
84 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "11" & "00" & "00" & "00" & '0',

-- L0386@0055.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
85 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0387@0056.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001110 else 11001110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
86 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CE" & X"CE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0389@0057.div_next:  if loopcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 00000010 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
87 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"02" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0390@0058.  loopcnt <= dec, if false then next else div_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 01000101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
88 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"45" & X"0" & O"0" & "11" & "00" & "00" & "00" & "11" & '0',

-- L0393@0059.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 10101101 else 10101101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
89 => "01" & X"7" & X"D" & "00" & "11" & X"0" & X"AD" & X"AD" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0394@005A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 01010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
90 => "10" & X"7" & X"D" & "00" & "11" & X"F" & X"00" & X"57" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0399@005B.mul:  prep_regs(max);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 10110000 else 10110000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
91 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"B0" & X"B0" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0400@005C.  if z_flagnos_is_set then done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1101) then 00111000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
92 => "00" & X"0" & X"0" & "00" & "10" & X"D" & X"38" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0402@005D.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
93 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0403@005E.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
94 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "00" & '0',

-- L0404@005F.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
95 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0405@0060.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (1000) then 01100001 else 01100101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
96 => "10" & X"1" & X"8" & "00" & "11" & X"8" & X"61" & X"65" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0408@0061.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
97 => "01" & X"7" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0409@0062.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
98 => "01" & X"0" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0410@0063.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
99 => "01" & X"B" & X"0" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0411@0064.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1001) then 01100110 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
100 => "10" & X"B" & X"0" & "00" & "11" & X"9" & X"66" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0414@0065.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 01100111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
101 => "01" & X"0" & X"1" & "00" & "11" & X"F" & X"00" & X"67" & X"0" & O"0" & "11" & "10" & "00" & "00" & "00" & '0',

-- L0415@0066.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 11, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
102 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "11" & "00" & "00" & "00" & '0',

-- L0416@0067.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
103 => "01" & X"8" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0417@0068.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
104 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0420@0069.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
105 => "10" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0421@006A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
106 => "10" & X"8" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0422@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0111) then 00111000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
107 => "01" & X"1" & X"1" & "00" & "11" & X"7" & X"38" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0423@006C.  loopcnt <= dec, if false then next else m_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 01011101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
108 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"5D" & X"0" & O"0" & "11" & "00" & "00" & "00" & "11" & '0',

-- L0428@006D.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11010100 else 11010100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
109 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"D4" & X"D4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0429@006E.  div2(max, set);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
110 => "00" & X"0" & X"0" & "10" & "10" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0430@006F.  bitcnt <= max, if z_flagtos_is_set then conv_done0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (1100) then 01111111 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
111 => "00" & X"0" & X"0" & "10" & "10" & X"C" & X"7F" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0431@0070.bitcnt_s0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001110 else 11001110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
112 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CE" & X"CE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0432@0071.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
113 => "01" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0433@0072.  STATUS = busy_using_mt, opr = d2_d2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
114 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"5" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0434@0073.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
115 => "10" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0435@0074.  loopcnt <= max;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
116 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0436@0075.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
117 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0437@0076.loopcnt_s0:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
118 => "01" & X"1" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0438@0077.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
119 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0440@0078.loopcnt_d0:  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 00, loopcnt <= 11, selreg = 0;
120 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "01" & "00" & "00" & "11" & '0',

-- L0441@0079.  if loopcnt_nibble then next else loopcnt_d0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1110) then 00000000 else 01111000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
121 => "00" & X"0" & X"0" & "00" & "10" & X"E" & X"00" & X"78" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0442@007A.  if d_flag_is_set then next else loopcnt_n0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1000) then 00000000 else 01111100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
122 => "00" & X"0" & X"0" & "00" & "10" & X"8" & X"00" & X"7C" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0443@007B.  bcd_adjust(one);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100001 else 11100001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
123 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E1" & X"E1" & X"0" & O"0" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0444@007C.loopcnt_n0:  if loopcnt_is_zero then next else loopcnt_s0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 00000000 else 01110110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
124 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"00" & X"76" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0445@007D.  if bitcnt_is_zero then conv_done0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 01111111 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
125 => "00" & X"0" & X"0" & "00" & "10" & X"6" & X"7F" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0446@007E.  bitcnt <= dec, if false then next else bitcnt_s0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 01110000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
126 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"70" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0447@007F.conv_done0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11011011 else 11011011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
127 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"DB" & X"DB" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0448@0080.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
128 => "01" & X"0" & X"0" & "00" & "11" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0453@0081.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001110 else 11001110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
129 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CE" & X"CE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0454@0082.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
130 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0455@0083.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
131 => "01" & X"1" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0456@0084.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
132 => "01" & X"0" & X"0" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0457@0085.  bitcnt <= max, if z_flagtos_is_set then done;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 10, if (1100) then 00111000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
133 => "00" & X"0" & X"0" & "10" & "10" & X"C" & X"38" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0458@0086.bitcnt_s1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001110 else 11001110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
134 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CE" & X"CE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0459@0087.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
135 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0460@0088.  STATUS = busy_using_mt, opr = m2_m2_np;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
136 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"7" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0461@0089.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
137 => "10" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0462@008A.  loopcnt <= max;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
138 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0463@008B.  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
139 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0464@008C.loopcnt_s1:  c_flag <= one, opr = np_np_ld, MT_COL = 5;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0101, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 11, z_flags <= 00, loopcnt <= 00, selreg = 0;
140 => "00" & X"0" & X"5" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"1" & "11" & "00" & "11" & "00" & "00" & '0',

-- L0465@008D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
141 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0466@008E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
142 => "01" & X"1" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0467@008F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
143 => "01" & X"D" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0468@0090.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
144 => "01" & X"9" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0470@0091.loopcnt_d1:  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 11, selreg = 0;
145 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "11" & '0',

-- L0471@0092.  if loopcnt_nibble then next else loopcnt_d1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1110) then 00000000 else 10010001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
146 => "00" & X"0" & X"0" & "00" & "10" & X"E" & X"00" & X"91" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0472@0093.  if c_flag_is_set then next else loopcnt_n1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1001) then 00000000 else 10010111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
147 => "00" & X"0" & X"0" & "00" & "10" & X"9" & X"00" & X"97" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0473@0094.  if bitcnt_is_zero then loopcnt_n1 else next;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 10010111 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
148 => "00" & X"0" & X"0" & "00" & "10" & X"6" & X"97" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0474@0095.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
--  MT_CTRL = 10, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
149 => "10" & X"9" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0475@0096.  bcd_adjust(zero);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11100001 else 11100001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
150 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"E1" & X"E1" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0476@0097.loopcnt_n1:  if loopcnt_is_zero then next else loopcnt_s1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 00000000 else 10001100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
151 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"00" & X"8C" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0477@0098.  if bitcnt_is_zero then conv_done1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0110) then 10011010 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
152 => "00" & X"0" & X"0" & "00" & "10" & X"6" & X"9A" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0478@0099.  bitcnt <= dec, if false then next else bitcnt_s1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 10000110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
153 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"86" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0479@009A.conv_done1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001110 else 11001110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
154 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CE" & X"CE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0480@009B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
155 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0481@009C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
156 => "01" & X"1" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0482@009D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 1, if false then next else exec;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 00110111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
157 => "01" & X"7" & X"1" & "00" & "11" & X"F" & X"00" & X"37" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0495@009E.  opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 10100010, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
158 => "00" & X"0" & X"0" & "00" & "10" & X"F" & X"00" & X"A2" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0501@009F.  opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1101, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 10100010, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
159 => "00" & X"0" & X"D" & "00" & "10" & X"F" & X"00" & X"A2" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0505@00A0.  opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1111, bitcnt <= 00, STATUS = 10, if (1111) then 00000000 else 10100010, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
160 => "00" & X"0" & X"F" & "00" & "10" & X"F" & X"00" & X"A2" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0514@00A1.  opr = np_np_ld, MT_COL = 0b1001;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 1001, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
161 => "00" & X"0" & X"9" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0515@00A2.hexchar:  bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 01, STATUS = 11, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 00, loopcnt <= 00, selreg = 0;
162 => "11" & X"0" & X"3" & "01" & "11" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "10" & "00" & "00" & '0',

-- L0516@00A3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 1100, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
163 => "01" & X"C" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0517@00A4.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
164 => "01" & X"D" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0518@00A5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
165 => "01" & X"B" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0519@00A6.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 010, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
166 => "00" & X"0" & X"0" & "11" & "11" & X"6" & X"00" & X"01" & X"0" & O"2" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0520@00A7.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
167 => "10" & X"B" & X"0" & "10" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0521@00A8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
168 => "01" & X"0" & X"0" & "11" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0522@00A9.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
169 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0523@00AA.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
170 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0524@00AB.  bitcnt <= dec;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
171 => "00" & X"0" & X"0" & "11" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0525@00AC.  STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 11, if (0110) then 00010001 else 00000001, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
172 => "00" & X"0" & X"0" & "11" & "11" & X"6" & X"11" & X"01" & X"0" & O"6" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0530@00AD.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
173 => "01" & X"0" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0531@00AE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
174 => "01" & X"B" & X"0" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0532@00AF.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
175 => "10" & X"B" & X"0" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0535@00B0.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
176 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0536@00B1.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 10, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
177 => "10" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0537@00B2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
178 => "01" & X"0" & X"7" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0538@00B3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
179 => "01" & X"7" & X"7" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0539@00B4.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 0000, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
180 => "10" & X"0" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0542@00B5.heron_step:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
181 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0543@00B6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
182 => "01" & X"7" & X"0" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0544@00B7.  divmod();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 01000011 else 01000011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
183 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"43" & X"43" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0545@00B8.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
184 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0546@00B9.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
185 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0547@00BA.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
186 => "01" & X"2" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0548@00BB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
187 => "01" & X"1" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0549@00BC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
188 => "01" & X"7" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0550@00BD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, c_flag <= zero, div2(max, set);
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 11001001 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 10, z_flags <= 11, loopcnt <= 00, selreg = 0;
189 => "01" & X"B" & X"0" & "10" & "11" & X"0" & X"C9" & X"C9" & X"0" & O"0" & "11" & "00" & "10" & "11" & "00" & '0',

-- L0554@00BE.shift_down:  prep_shift();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11000100 else 11000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
190 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"C4" & X"C4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0555@00BF.shift_dloop:  STATUS = busy_using_mt, opr = m2_m2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 00000010 else 00000000, TXDCHAR <= 0000, opr = 111, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 01, loopcnt <= 00, selreg = 0;
191 => "00" & X"0" & X"0" & "00" & "11" & X"6" & X"02" & X"00" & X"0" & O"7" & "11" & "01" & "00" & "01" & "00" & '0',

-- L0556@00C0.  bitcnt <= dec, if false then next else shift_dloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 10111111, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
192 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"BF" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0559@00C1.shift_up:  prep_shift();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11000100 else 11000100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
193 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"C4" & X"C4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0560@00C2.shift_uloop:  STATUS = busy_using_mt, opr = d2_d2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 00000010 else 00000000, TXDCHAR <= 0000, opr = 101, errcode <= 11, d_flag <= 01, c_flag <= 00, z_flags <= 01, loopcnt <= 00, selreg = 0;
194 => "00" & X"0" & X"0" & "00" & "11" & X"6" & X"02" & X"00" & X"0" & O"5" & "11" & "01" & "00" & "01" & "00" & '0',

-- L0561@00C3.  bitcnt <= dec, if false then next else shift_uloop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 11000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
195 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"C2" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0564@00C4.prep_shift:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11001101 else 11001101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
196 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"CD" & X"CD" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0565@00C5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 8;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 1000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
197 => "01" & X"0" & X"8" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0566@00C6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0, d_flag <= zero, bitcnt <= max, z_flags <= set, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 1000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 10, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
198 => "01" & X"8" & X"0" & "10" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "10" & "00" & "11" & "00" & '0',

-- L0568@00C7.dup:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
--  MT_CTRL = 11, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 11010100 else 11010100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
199 => "11" & X"0" & X"0" & "00" & "11" & X"0" & X"D4" & X"D4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0569@00C8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= max, z_flags <= set;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 10, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 11, loopcnt <= 00, selreg = 0;
200 => "01" & X"0" & X"0" & "10" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "11" & "00" & '0',

-- L0573@00C9.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0110) then 00000010 else 00000000, TXDCHAR <= 0000, opr = 100, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
201 => "00" & X"0" & X"0" & "00" & "11" & X"6" & X"02" & X"00" & X"0" & O"4" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0574@00CA.  bitcnt <= dec, if false then next else div2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 11, STATUS = 10, if (1111) then 00000000 else 11001001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
202 => "00" & X"0" & X"0" & "11" & "10" & X"F" & X"00" & X"C9" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0577@00CB.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
203 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0578@00CC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 11001110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
204 => "01" & X"1" & X"0" & "00" & "11" & X"F" & X"00" & X"CE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0581@00CD.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
205 => "01" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0583@00CE.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
206 => "01" & X"2" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0584@00CF.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
207 => "01" & X"3" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0585@00D0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
208 => "01" & X"4" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0586@00D1.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
209 => "01" & X"5" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0587@00D2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
210 => "01" & X"6" & X"6" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0588@00D3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
211 => "01" & X"7" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0591@00D4.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0000, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
212 => "01" & X"0" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0592@00D5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
213 => "01" & X"1" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0593@00D6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
214 => "01" & X"2" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0594@00D7.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
215 => "01" & X"3" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0595@00D8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
216 => "01" & X"4" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0596@00D9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
217 => "01" & X"5" & X"6" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0597@00DA.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0111, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
218 => "01" & X"6" & X"7" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0600@00DB.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 0010, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
219 => "01" & X"2" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0601@00DC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
--  MT_CTRL = 01, MT_ROW = 0011, MT_COL = 0010, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
220 => "01" & X"3" & X"2" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0602@00DD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
--  MT_CTRL = 01, MT_ROW = 0100, MT_COL = 0011, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
221 => "01" & X"4" & X"3" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0603@00DE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
--  MT_CTRL = 01, MT_ROW = 0101, MT_COL = 0100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
222 => "01" & X"5" & X"4" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0604@00DF.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
--  MT_CTRL = 01, MT_ROW = 0110, MT_COL = 0101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
223 => "01" & X"6" & X"5" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0605@00E0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
--  MT_CTRL = 01, MT_ROW = 0111, MT_COL = 0110, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
224 => "01" & X"7" & X"6" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0609@00E1.bcd_adjust:  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
225 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0610@00E2.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
226 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0611@00E3.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
227 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0612@00E4.  STATUS = busy_using_mt, opr = np_m2_m2;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 011, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
228 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"3" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0615@00E5.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 0001, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
229 => "10" & X"1" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0616@00E6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
--  MT_CTRL = 01, MT_ROW = 0001, MT_COL = 1100, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
230 => "01" & X"1" & X"C" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0617@00E7.  opr = np_np_ld, MT_COL = 3, if c_flag_is_set then next else bcd_add3;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0011, bitcnt <= 00, STATUS = 10, if (1001) then 00000000 else 11101010, TXDCHAR <= 0000, opr = 001, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
231 => "00" & X"0" & X"3" & "00" & "10" & X"9" & X"00" & X"EA" & X"0" & O"1" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0620@00E8.bcd_sub3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
232 => "01" & X"D" & X"9" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0621@00E9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else bcd_3;
--  MT_CTRL = 01, MT_ROW = 1001, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (1111) then 00000000 else 11101011, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
233 => "01" & X"9" & X"D" & "00" & "11" & X"F" & X"00" & X"EB" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0624@00EA.bcd_add3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
--  MT_CTRL = 01, MT_ROW = 1101, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
234 => "01" & X"D" & X"D" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0626@00EB.bcd_3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 1;
--  MT_CTRL = 01, MT_ROW = 1011, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
235 => "01" & X"B" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0627@00EC.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
236 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0628@00ED.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
237 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0629@00EE.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
238 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0630@00EF.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 110, errcode <= 11, d_flag <= 00, c_flag <= 01, z_flags <= 01, loopcnt <= 00, selreg = 0;
239 => "00" & X"0" & X"0" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"6" & "11" & "00" & "01" & "01" & "00" & '0',

-- L0631@00F0.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 1;
--  MT_CTRL = 10, MT_ROW = 1011, MT_COL = 0001, bitcnt <= 00, STATUS = 11, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
240 => "10" & X"B" & X"1" & "00" & "11" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0632@00F1.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xD , MT_COL = 0xD, if true then return else return;
--  MT_CTRL = 10, MT_ROW = 1101, MT_COL = 1101, bitcnt <= 00, STATUS = 11, if (0000) then 00000010 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
241 => "10" & X"D" & X"D" & "00" & "11" & X"0" & X"02" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0635@00F2.print_st:  loopcnt <= max, if TRACE_RESULT then next else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0011) then 00000000 else 00000010, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 10, selreg = 0;
242 => "00" & X"0" & X"0" & "00" & "10" & X"3" & X"00" & X"02" & X"0" & O"0" & "11" & "00" & "00" & "00" & "10" & '0',

-- L0636@00F3.  loopcnt <= inc, print_crlf();
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111001 else 11111001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
243 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"F9" & X"F9" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0637@00F4.st_loop:  selreg = internal, emit(reg);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 1100, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 1;
244 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"C" & O"0" & "11" & "00" & "00" & "00" & "00" & '1',

-- L0638@00F5.st_loop1:  loopcnt <= inc;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 01, selreg = 0;
245 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "01" & '0',

-- L0639@00F6.  if loopcnt_nibble then next else st_loop1;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (1110) then 00000000 else 11110101, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
246 => "00" & X"0" & X"0" & "00" & "10" & X"E" & X"00" & X"F5" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0640@00F7.  if loopcnt_is_zero then print_crlf else st_loop;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0111) then 11111001 else 11110100, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
247 => "00" & X"0" & X"0" & "00" & "10" & X"7" & X"F9" & X"F4" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0642@00F8.echo:  if TRACE_INPUT then emit else emit0;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0010) then 11111011 else 11111110, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
248 => "00" & X"0" & X"0" & "00" & "10" & X"2" & X"FB" & X"FE" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0644@00F9.print_crlf:  emit(char_cr);
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 11111011 else 11111011, TXDCHAR <= 0010, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
249 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"FB" & X"FB" & X"2" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0645@00FA.  TXDCHAR <= char_lf;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000000 else 00000000, TXDCHAR <= 0011, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
250 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"3" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0647@00FB.emit:  if TXDSEND then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0101) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
251 => "00" & X"0" & X"0" & "00" & "10" & X"5" & X"00" & X"01" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0648@00FC.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
252 => "00" & X"0" & X"0" & "00" & "10" & X"4" & X"00" & X"01" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0649@00FD.  if TXDREADY then next else repeat;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0100) then 00000000 else 00000001, TXDCHAR <= 0000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
253 => "00" & X"0" & X"0" & "00" & "10" & X"4" & X"00" & X"01" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- L0650@00FE.emit0:  TXDCHAR <= char_zero, if true then return else return;
--  MT_CTRL = 00, MT_ROW = 0000, MT_COL = 0000, bitcnt <= 00, STATUS = 10, if (0000) then 00000010 else 00000010, TXDCHAR <= 1000, opr = 000, errcode <= 11, d_flag <= 00, c_flag <= 00, z_flags <= 00, loopcnt <= 00, selreg = 0;
254 => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"02" & X"02" & X"8" & O"0" & "11" & "00" & "00" & "00" & "00" & '0',

-- 1 location(s) in following ranges will be filled with default value
-- 00FF .. 00FF

others => "00" & X"0" & X"0" & "00" & "10" & X"0" & X"00" & X"00" & X"0" & O"0" & "11" & "00" & "00" & "00" & "00" & '0'
);

end hexcalc_code;

