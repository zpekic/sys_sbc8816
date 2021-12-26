--------------------------------------------------------
-- mcc V1.0.1225 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'code_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package tty_screen_code is

-- memory block size
constant CODE_DATA_WIDTH: 	positive := 32;
constant CODE_ADDRESS_WIDTH: 	positive := 6;
constant CODE_ADDRESS_LAST: 	positive := 63;
constant CODE_IF_WIDTH: 	positive := 3;


type tty_code_memory is array(0 to 63) of std_logic_vector(31 downto 0);

signal tty_uinstruction: std_logic_vector(31 downto 0);

--tty_uinstruction <= tty_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0027.ready: .valfield 2 values no, char_is_zero, yes, - default no;
--
alias tty_ready: 	std_logic_vector(1 downto 0) is tty_uinstruction(31 downto 30);
constant ready_no: 	std_logic_vector(1 downto 0) := "00";
constant ready_char_is_zero: 	std_logic_vector(1 downto 0) := "01";
constant ready_yes: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- with tty_ready select ready <=
--      no when ready_no, -- default value
--      char_is_zero when ready_char_is_zero,
--      yes when ready_yes,
--      no when others;
---- End boilerplate code

--
-- L0036.seq_cond: .if 3 values true, char_is_zero, cursorx_ge_maxcol, cursory_ge_maxrow, cursorx_is_zero, cursory_is_zero, memory_ready, false default true;
--
alias tty_seq_cond: 	std_logic_vector(2 downto 0) is tty_uinstruction(29 downto 27);
constant seq_cond_true: 	integer := 0;
constant seq_cond_char_is_zero: 	integer := 1;
constant seq_cond_cursorx_ge_maxcol: 	integer := 2;
constant seq_cond_cursory_ge_maxrow: 	integer := 3;
constant seq_cond_cursorx_is_zero: 	integer := 4;
constant seq_cond_cursory_is_zero: 	integer := 5;
constant seq_cond_memory_ready: 	integer := 6;
constant seq_cond_false: 	integer := 7;
---- Start boilerplate code (use with utmost caution!)
---- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and feed 'conditions' with:
--  cond(seq_cond_true) => '1',
--  cond(seq_cond_char_is_zero) => char_is_zero,
--  cond(seq_cond_cursorx_ge_maxcol) => cursorx_ge_maxcol,
--  cond(seq_cond_cursory_ge_maxrow) => cursory_ge_maxrow,
--  cond(seq_cond_cursorx_is_zero) => cursorx_is_zero,
--  cond(seq_cond_cursory_is_zero) => cursory_is_zero,
--  cond(seq_cond_memory_ready) => memory_ready,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0048.seq_then: .then 6 values next, repeat, return, fork, @ default next;
--
alias tty_seq_then: 	std_logic_vector(5 downto 0) is tty_uinstruction(26 downto 21);
constant seq_then_next: 	std_logic_vector(5 downto 0) := "000000";
constant seq_then_repeat: 	std_logic_vector(5 downto 0) := "000001";
constant seq_then_return: 	std_logic_vector(5 downto 0) := "000010";
constant seq_then_fork: 	std_logic_vector(5 downto 0) := "000011";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to tty_seq_then

--
-- L0056.seq_else: .else 6 values next, repeat, return, fork, 0x00..0x3F, @ default next;
--
alias tty_seq_else: 	std_logic_vector(5 downto 0) is tty_uinstruction(20 downto 15);
constant seq_else_next: 	std_logic_vector(5 downto 0) := "000000";
constant seq_else_repeat: 	std_logic_vector(5 downto 0) := "000001";
constant seq_else_return: 	std_logic_vector(5 downto 0) := "000010";
constant seq_else_fork: 	std_logic_vector(5 downto 0) := "000011";
-- Values from "000000" to "111111" allowed
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'else' to tty_seq_else

--
-- L0066.cursorx: .regfield 3 values same, zero, inc, dec, maxcol default same;
--
alias tty_cursorx: 	std_logic_vector(2 downto 0) is tty_uinstruction(14 downto 12);
constant cursorx_same: 	std_logic_vector(2 downto 0) := "000";
constant cursorx_zero: 	std_logic_vector(2 downto 0) := "001";
constant cursorx_inc: 	std_logic_vector(2 downto 0) := "010";
constant cursorx_dec: 	std_logic_vector(2 downto 0) := "011";
constant cursorx_maxcol: 	std_logic_vector(2 downto 0) := "100";
---- Start boilerplate code (use with utmost caution!)
-- update_cursorx: process(clk, tty_cursorx)
-- begin
--	if (rising_edge(clk)) then
--		case tty_cursorx is
----			when cursorx_same =>
----				cursorx <= cursorx;
--			when cursorx_zero =>
--				cursorx <= (others => '0');
--			when cursorx_inc =>
--				cursorx <= std_logic_vector(unsigned(cursorx) + 1);
--			when cursorx_dec =>
--				cursorx <= std_logic_vector(unsigned(cursorx) - 1);
--			when cursorx_maxcol =>
--				cursorx <= maxcol;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0074.cursory: .regfield 3 values same, zero, inc, dec, maxrow default same;
--
alias tty_cursory: 	std_logic_vector(2 downto 0) is tty_uinstruction(11 downto 9);
constant cursory_same: 	std_logic_vector(2 downto 0) := "000";
constant cursory_zero: 	std_logic_vector(2 downto 0) := "001";
constant cursory_inc: 	std_logic_vector(2 downto 0) := "010";
constant cursory_dec: 	std_logic_vector(2 downto 0) := "011";
constant cursory_maxrow: 	std_logic_vector(2 downto 0) := "100";
---- Start boilerplate code (use with utmost caution!)
-- update_cursory: process(clk, tty_cursory)
-- begin
--	if (rising_edge(clk)) then
--		case tty_cursory is
----			when cursory_same =>
----				cursory <= cursory;
--			when cursory_zero =>
--				cursory <= (others => '0');
--			when cursory_inc =>
--				cursory <= std_logic_vector(unsigned(cursory) + 1);
--			when cursory_dec =>
--				cursory <= std_logic_vector(unsigned(cursory) - 1);
--			when cursory_maxrow =>
--				cursory <= maxrow;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0082.data: .regfield 2 values same, char, memory, space default same;
--
alias tty_data: 	std_logic_vector(1 downto 0) is tty_uinstruction(8 downto 7);
constant data_same: 	std_logic_vector(1 downto 0) := "00";
constant data_char: 	std_logic_vector(1 downto 0) := "01";
constant data_memory: 	std_logic_vector(1 downto 0) := "10";
constant data_space: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- update_data: process(clk, tty_data)
-- begin
--	if (rising_edge(clk)) then
--		case tty_data is
----			when data_same =>
----				data <= data;
--			when data_char =>
--				data <= char;
--			when data_memory =>
--				data <= memory;
--			when data_space =>
--				data <= space;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0089.mem: .valfield 2 values nop, read, write, - default nop;
--
alias tty_mem: 	std_logic_vector(1 downto 0) is tty_uinstruction(6 downto 5);
constant mem_nop: 	std_logic_vector(1 downto 0) := "00";
constant mem_read: 	std_logic_vector(1 downto 0) := "01";
constant mem_write: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- with tty_mem select mem <=
--      nop when mem_nop, -- default value
--      read when mem_read,
--      write when mem_write,
--      nop when others;
---- End boilerplate code

--
-- L0096.reserved: .valfield 5 values -, -, -, -, - default 0;
--
alias tty_reserved: 	std_logic_vector(4 downto 0) is tty_uinstruction(4 downto 0);
-- Value "00000" not allowed (name '-' is not assignable)
-- Value "00001" not allowed (name '-' is not assignable)
-- Value "00010" not allowed (name '-' is not assignable)
-- Value "00011" not allowed (name '-' is not assignable)
-- Value "00100" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- with tty_reserved select reserved <=
--      (others => '0') when others;
---- End boilerplate code



constant tty_microcode: tty_code_memory := (

-- L0110@0000._reset:  if true then next else next;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
0 => "00" & O"0" & O"00" & O"00" & O"0" & O"0" & "00" & "00" & "00000",

-- L0112@0001._reset1:  if true then next else next;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
1 => "00" & O"0" & O"00" & O"00" & O"0" & O"0" & "00" & "00" & "00000",

-- L0114@0002._reset2:  if true then next else next;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
2 => "00" & O"0" & O"00" & O"00" & O"0" & O"0" & "00" & "00" & "00000",

-- L0116@0003._reset3:  cursorx <= zero, cursory <= zero;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 001, cursory <= 001, data <= 00, mem = 00, reserved = 00000;
3 => "00" & O"0" & O"00" & O"00" & O"1" & O"1" & "00" & "00" & "00000",

-- L0118@0004.waitChar:  ready = char_is_zero, data <= char, if char_is_zero then repeat else next;
--  ready = 01, if (001) then 000001 else 000000, cursorx <= 000, cursory <= 000, data <= 01, mem = 00, reserved = 00000;
4 => "01" & O"1" & O"01" & O"00" & O"0" & O"0" & "01" & "00" & "00000",

-- L0121@0005.  if true then fork else fork;
--  ready = 00, if (000) then 000011 else 000011, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
5 => "00" & O"0" & O"03" & O"03" & O"0" & O"0" & "00" & "00" & "00000",

-- L0125@0006.main:  writeMem();
--  ready = 00, if (000) then 100010 else 100010, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
6 => "00" & O"0" & O"42" & O"42" & O"0" & O"0" & "00" & "00" & "00000",

-- L0127@0007.  cursorx <= inc;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 010, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
7 => "00" & O"0" & O"00" & O"00" & O"2" & O"0" & "00" & "00" & "00000",

-- L0129@0008.  if cursorx_ge_maxcol then next else nextChar;
--  ready = 00, if (010) then 000000 else 001010, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
8 => "00" & O"2" & O"00" & O"12" & O"0" & O"0" & "00" & "00" & "00000",

-- L0131@0009.  cursorx <= zero, if false then next else LF;
--  ready = 00, if (111) then 000000 else 010011, cursorx <= 001, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
9 => "00" & O"7" & O"00" & O"23" & O"1" & O"0" & "00" & "00" & "00000",

-- L0135@000A.nextChar:  ready = yes, if char_is_zero then waitChar else repeat;
--  ready = 10, if (001) then 000100 else 000001, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
10 => "10" & O"1" & O"04" & O"01" & O"0" & O"0" & "00" & "00" & "00000",

-- L0139@000B.CLS:  data <= space, cursory <= zero;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 000, cursory <= 001, data <= 11, mem = 00, reserved = 00000;
11 => "00" & O"0" & O"00" & O"00" & O"0" & O"1" & "11" & "00" & "00000",

-- L0141@000C.nextRow:  cursorx <= zero;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 001, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
12 => "00" & O"0" & O"00" & O"00" & O"1" & O"0" & "00" & "00" & "00000",

-- L0143@000D.nextCol:  writeMem();
--  ready = 00, if (000) then 100010 else 100010, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
13 => "00" & O"0" & O"42" & O"42" & O"0" & O"0" & "00" & "00" & "00000",

-- L0145@000E.  cursorx <= inc;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 010, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
14 => "00" & O"0" & O"00" & O"00" & O"2" & O"0" & "00" & "00" & "00000",

-- L0147@000F.  if cursorx_ge_maxcol then next else nextCol;
--  ready = 00, if (010) then 000000 else 001101, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
15 => "00" & O"2" & O"00" & O"15" & O"0" & O"0" & "00" & "00" & "00000",

-- L0149@0010.  cursory <= inc;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 000, cursory <= 010, data <= 00, mem = 00, reserved = 00000;
16 => "00" & O"0" & O"00" & O"00" & O"0" & O"2" & "00" & "00" & "00000",

-- L0151@0011.  if cursory_ge_maxrow then HOME else nextRow;
--  ready = 00, if (011) then 010010 else 001100, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
17 => "00" & O"3" & O"22" & O"14" & O"0" & O"0" & "00" & "00" & "00000",

-- L0154@0012.HOME:  cursorx <= zero, cursory <= zero, if false then next else nextChar;
--  ready = 00, if (111) then 000000 else 001010, cursorx <= 001, cursory <= 001, data <= 00, mem = 00, reserved = 00000;
18 => "00" & O"7" & O"00" & O"12" & O"1" & O"1" & "00" & "00" & "00000",

-- L0158@0013.LF:  cursory <= inc;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 000, cursory <= 010, data <= 00, mem = 00, reserved = 00000;
19 => "00" & O"0" & O"00" & O"00" & O"0" & O"2" & "00" & "00" & "00000",

-- L0160@0014.  if cursory_ge_maxrow then next else nextChar;
--  ready = 00, if (011) then 000000 else 001010, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
20 => "00" & O"3" & O"00" & O"12" & O"0" & O"0" & "00" & "00" & "00000",

-- L0162@0015.scrollUp:  cursory <= zero;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 000, cursory <= 001, data <= 00, mem = 00, reserved = 00000;
21 => "00" & O"0" & O"00" & O"00" & O"0" & O"1" & "00" & "00" & "00000",

-- L0164@0016.copyRow:  if cursory_ge_maxrow then lastLine else next;
--  ready = 00, if (011) then 011101 else 000000, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
22 => "00" & O"3" & O"35" & O"00" & O"0" & O"0" & "00" & "00" & "00000",

-- L0166@0017.  cursorx <= zero;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 001, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
23 => "00" & O"0" & O"00" & O"00" & O"1" & O"0" & "00" & "00" & "00000",

-- L0168@0018.copyCol:  if cursorx_ge_maxcol then nextY else next;
--  ready = 00, if (010) then 011100 else 000000, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
24 => "00" & O"2" & O"34" & O"00" & O"0" & O"0" & "00" & "00" & "00000",

-- L0170@0019.  cursory <= inc, readMem();
--  ready = 00, if (000) then 100100 else 100100, cursorx <= 000, cursory <= 010, data <= 00, mem = 00, reserved = 00000;
25 => "00" & O"0" & O"44" & O"44" & O"0" & O"2" & "00" & "00" & "00000",

-- L0173@001A.  cursory <= dec, writeMem();
--  ready = 00, if (000) then 100010 else 100010, cursorx <= 000, cursory <= 011, data <= 00, mem = 00, reserved = 00000;
26 => "00" & O"0" & O"42" & O"42" & O"0" & O"3" & "00" & "00" & "00000",

-- L0176@001B.  cursorx <= inc, if false then next else copyCol;
--  ready = 00, if (111) then 000000 else 011000, cursorx <= 010, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
27 => "00" & O"7" & O"00" & O"30" & O"2" & O"0" & "00" & "00" & "00000",

-- L0179@001C.nextY:  cursory <= inc, if false then next else copyRow;
--  ready = 00, if (111) then 000000 else 010110, cursorx <= 000, cursory <= 010, data <= 00, mem = 00, reserved = 00000;
28 => "00" & O"7" & O"00" & O"26" & O"0" & O"2" & "00" & "00" & "00000",

-- L0182@001D.lastLine:  data <= space, cursory <= dec, cursorx <= zero;
--  ready = 00, if (000) then 000000 else 000000, cursorx <= 001, cursory <= 011, data <= 11, mem = 00, reserved = 00000;
29 => "00" & O"0" & O"00" & O"00" & O"1" & O"3" & "11" & "00" & "00000",

-- L0184@001E.clearCol:  if cursorx_ge_maxcol then CR else next;
--  ready = 00, if (010) then 100001 else 000000, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
30 => "00" & O"2" & O"41" & O"00" & O"0" & O"0" & "00" & "00" & "00000",

-- L0186@001F.  writeMem();
--  ready = 00, if (000) then 100010 else 100010, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
31 => "00" & O"0" & O"42" & O"42" & O"0" & O"0" & "00" & "00" & "00000",

-- L0188@0020.  cursorx <= inc, if false then next else clearCol;
--  ready = 00, if (111) then 000000 else 011110, cursorx <= 010, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
32 => "00" & O"7" & O"00" & O"36" & O"2" & O"0" & "00" & "00" & "00000",

-- L0192@0021.CR:  cursorx <= zero, if false then next else nextChar;
--  ready = 00, if (111) then 000000 else 001010, cursorx <= 001, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
33 => "00" & O"7" & O"00" & O"12" & O"1" & O"0" & "00" & "00" & "00000",

-- L0195@0022.writeMem:  if memory_ready then next else repeat;
--  ready = 00, if (110) then 000000 else 000001, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
34 => "00" & O"6" & O"00" & O"01" & O"0" & O"0" & "00" & "00" & "00000",

-- L0197@0023.  mem = write, if false then next else return;
--  ready = 00, if (111) then 000000 else 000010, cursorx <= 000, cursory <= 000, data <= 00, mem = 10, reserved = 00000;
35 => "00" & O"7" & O"00" & O"02" & O"0" & O"0" & "00" & "10" & "00000",

-- L0200@0024.readMem:  if memory_ready then next else repeat;
--  ready = 00, if (110) then 000000 else 000001, cursorx <= 000, cursory <= 000, data <= 00, mem = 00, reserved = 00000;
36 => "00" & O"6" & O"00" & O"01" & O"0" & O"0" & "00" & "00" & "00000",

-- L0202@0025.  mem = read, data <= memory, if false then next else return;
--  ready = 00, if (111) then 000000 else 000010, cursorx <= 000, cursory <= 000, data <= 10, mem = 01, reserved = 00000;
37 => "00" & O"7" & O"00" & O"02" & O"0" & O"0" & "10" & "01" & "00000",

-- 26 location(s) in following ranges will be filled with default value
-- 0026 .. 003F

others => "00" & O"0" & O"00" & O"00" & O"0" & O"0" & "00" & "00" & "00000"
);

end tty_screen_code;

