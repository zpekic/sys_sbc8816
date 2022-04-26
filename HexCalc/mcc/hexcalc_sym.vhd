--------------------------------------------------------
-- mcc V1.2.0404 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'symbol_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package hexcalc_sym is

-- memory block size
constant SYMBOL_DATA_WIDTH: 	positive := 256;
constant SYMBOL_ADDRESS_WIDTH: 	positive := 8;
constant SYMBOL_ADDRESS_LAST: 	positive := 255;
constant SYMBOL_BYTE_LAST: 	positive := 31;
constant SYMBOL_BYTE_WIDTH: positive := 5;


type t_hxc_symbol_entry is array(0 to SYMBOL_ADDRESS_LAST) of std_logic_vector(SYMBOL_DATA_WIDTH -1 downto 0);
type t_hxc_symbol_byte is array(0 to(SYMBOL_ADDRESS_LAST + 1) * (SYMBOL_BYTE_LAST + 1) - 1) of std_logic_vector(7 downto 0);


signal hxc_symbol_byte: t_hxc_symbol_byte;
signal hxc_sym_d: std_logic_vector(7 downto 0);
signal hxc_sym_a: std_logic_vector(SYMBOL_ADDRESS_WIDTH + SYMBOL_BYTE_WIDTH - 1 downto 0);
----Start boilerplate code(use with utmost caution!)
-- hxc_sym_a <= -- TODO concatenate microinstruction address and character address
-- hxc_sym_d <= hxc_symbol_byte(to_integer(unsigned(hxc_sym_a)));
----convert symbol entries to byte-oriented ROM
--gen_r: for r in 0 to SYMBOL_ADDRESS_LAST generate
--begin
--    gen_c: for c in 0 to SYMBOL_BYTE_LAST generate
--   begin
--           --assert false report "r = " & integer'image(r) & " c = " & integer'image(c) severity note;
--           hxc_symbol_byte(r * (SYMBOL_BYTE_LAST + 1) + c) <= hxc_symbol_entry(r)(SYMBOL_DATA_WIDTH - 8 * c - 1 downto SYMBOL_DATA_WIDTH - 8 * (c + 1));
--   end generate;
--end generate;
----End boilerplate code






constant hxc_symbol_entry: t_hxc_symbol_entry := (

-- L0221@0000._reset:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
-- _reset: c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
0 => X"5F_72_65_73_65_74_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_64_5F_66_6C_61_67_20_3C",

-- L0223@0001._reset1:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
-- _reset1: c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
1 => X"5F_72_65_73_65_74_31_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_64_5F_66_6C_61_67_20",

-- L0225@0002._reset2:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
-- _reset2: c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
2 => X"5F_72_65_73_65_74_32_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_64_5F_66_6C_61_67_20",

-- L0227@0003._reset3:  c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
-- _reset3: c_flag <= zero, d_flag <= zero, z_flags <= set, MT_CTRL = clear, errcode <= ok;
3 => X"5F_72_65_73_65_74_33_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_64_5F_66_6C_61_67_20",

-- L0231@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
-- deadloop: STATUS = ready, if input_is_zero then repeat else next;
4 => X"64_65_61_64_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_72_65_61_64_79_2C_20_69_66_20_69_6E_70",

-- L0232@0005.  echo(input);
-- echo(input);
5 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0233@0006.  if true then fork else fork;
-- if true then fork else fork;
6 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_66_6F_72_6B_20_65_6C_73_65_20_66_6F_72_6B_3B_20_20_20_20",

-- L0236@0007.badchar:  errcode <= err_badchar, if false then next else printerror;
-- badchar: errcode <= err_badchar, if false then next else printerror;
7 => X"62_61_64_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63_68_61_72_2C",

-- L0237@0008.divzero:  errcode <= err_divzero, if false then next else printerror;
-- divzero: errcode <= err_divzero, if false then next else printerror;
8 => X"64_69_76_7A_65_72_6F_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_64_69_76_7A_65_72_6F_2C",

-- L0238@0009.printerror:  emit(char_E);
-- printerror: emit(char_E);
9 => X"70_72_69_6E_74_65_72_72_6F_72_3A_20_65_6D_69_74_28_63_68_61_72_5F_45_29_3B_20_20_20_20_20_20_20",

-- L0239@000A.  emit(char_R);
-- emit(char_R);
10 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0240@000B.  emit(char_R);
-- emit(char_R);
11 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0241@000C.  emit(errcode);
-- emit(errcode);
12 => X"65_6D_69_74_28_65_72_72_63_6F_64_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0242@000D.  emit(char_space);
-- emit(char_space);
13 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0243@000E.  emit(inp1);
-- emit(inp1);
14 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0244@000F.  emit(inp0);
-- emit(inp0);
15 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0245@0010.  print_crlf();
-- print_crlf();
16 => X"70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0252@0011.nextchar:  STATUS = done, if false then next else deadloop;
-- nextchar: STATUS = done, if false then next else deadloop;
17 => X"6E_65_78_74_63_68_61_72_3A_20_53_54_41_54_55_53_20_3D_20_64_6F_6E_65_2C_20_69_66_20_66_61_6C_73",

-- L0257@0012.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- enter: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
18 => X"65_6E_74_65_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0258@0013.  if false then next else exec;
-- if false then next else exec;
19 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0264@0014.  dup();
-- dup();
20 => X"64_75_70_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0265@0015.  if false then next else done;
-- if false then next else done;
21 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_64_6F_6E_65_3B_20_20_20",

-- L0271@0016.rotate:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- rotate: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
22 => X"72_6F_74_61_74_65_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0272@0017.r7_to_tos:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
-- r7_to_tos: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
23 => X"72_37_5F_74_6F_5F_74_6F_73_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0278@0018.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
-- swap: STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
24 => X"73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54",

-- L0279@0019.  if false then next else exec;
-- if false then next else exec;
25 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0284@001A.  shift_down();
-- shift_down();
26 => X"73_68_69_66_74_5F_64_6F_77_6E_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0285@001B.  if false then next else done;
-- if false then next else done;
27 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_64_6F_6E_65_3B_20_20_20",

-- L0290@001C.  shift_up();
-- shift_up();
28 => X"73_68_69_66_74_5F_75_70_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0291@001D.  if false then next else done;
-- if false then next else done;
29 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_64_6F_6E_65_3B_20_20_20",

-- L0297@001E.  dup();
-- dup();
30 => X"64_75_70_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0298@001F.  shift_down();
-- shift_down();
31 => X"73_68_69_66_74_5F_64_6F_77_6E_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0299@0020.  if z_flagtos_is_set then next else root;
-- if z_flagtos_is_set then next else root;
32 => X"69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C",

-- L0300@0021.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
33 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0301@0022.  if false then next else exec;
-- if false then next else exec;
34 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0302@0023.root:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- root: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
35 => X"72_6F_6F_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54",

-- L0303@0024.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
36 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0304@0025.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
37 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0305@0026.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
38 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0306@0027.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 6 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 6 , MT_COL = 7;
39 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0307@0028.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
40 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0309@0029.  heron_step();
-- heron_step();
41 => X"68_65_72_6F_6E_5F_73_74_65_70_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0311@002A.root_loop:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- root_loop: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
42 => X"72_6F_6F_74_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0312@002B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
43 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0313@002C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
44 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0314@002D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
45 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0315@002E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, c_flag <= one, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, c_flag <= one, div2(max, set);
46 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0316@002F.  if c_flag_is_set then next else root_cont;
-- if c_flag_is_set then next else root_cont;
47 => X"69_66_20_63_5F_66_6C_61_67_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0317@0030.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 0, if false then next else r7_to_tos;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 0, if false then next else r7_to_tos;
48 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0319@0031.root_cont:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- root_cont: STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
49 => X"72_6F_6F_74_5F_63_6F_6E_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0320@0032.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
50 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0321@0033.  heron_step();
-- heron_step();
51 => X"68_65_72_6F_6E_5F_73_74_65_70_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0322@0034.  if false then next else root_loop;
-- if false then next else root_loop;
52 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_6F_6F_74_5F_6C_6F_6F",

-- L0328@0035.  c_flag <= zero, d_flag <= zero, z_flags <= set, errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
-- c_flag <= zero, d_flag <= zero, z_flags <= set, errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
53 => X"63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20",

-- L0334@0036.  c_flag <= zero, d_flag <= zero, z_flags <= set, errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- c_flag <= zero, d_flag <= zero, z_flags <= set, errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
54 => X"63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20",

-- L0335@0037.exec:  div2(max, set);
-- exec: div2(max, set);
55 => X"65_78_65_63_3A_20_64_69_76_32_28_6D_61_78_2C_20_73_65_74_29_3B_20_20_20_20_20_20_20_20_20_20_20",

-- L0336@0038.done:  print_st();
-- done: print_st();
56 => X"64_6F_6E_65_3A_20_70_72_69_6E_74_5F_73_74_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0337@0039.  if false then next else nextchar;
-- if false then next else nextchar;
57 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65_78_74_63_68_61_72",

-- L0344@003A.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- plus: c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
58 => X"70_6C_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0345@003B.add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
-- add: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
59 => X"61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0346@003C.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- pm: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
60 => X"70_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43",

-- L0347@003D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
61 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0352@003E.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- minus: c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
62 => X"6D_69_6E_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0353@003F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
63 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0354@0040.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
64 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0359@0041.  divmod(zero);
-- divmod(zero);
65 => X"64_69_76_6D_6F_64_28_7A_65_72_6F_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0360@0042.  if false then next else swap;
-- if false then next else swap;
66 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_73_77_61_70_3B_20_20_20",

-- L0365@0043.mul:  prep_regs(max);
-- mul: prep_regs(max);
67 => X"6D_75_6C_3A_20_70_72_65_70_5F_72_65_67_73_28_6D_61_78_29_3B_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0366@0044.  if z_flagnos_is_set then done;
-- if z_flagnos_is_set then done;
68 => X"69_66_20_7A_5F_66_6C_61_67_6E_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_64_6F_6E_65_3B_20_20",

-- L0368@0045.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- m_loop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
69 => X"6D_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0369@0046.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
70 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0370@0047.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
71 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0371@0048.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
-- c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
72 => X"63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0374@0049.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
-- m_add_r7: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
73 => X"6D_5F_61_64_64_5F_72_37_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0375@004A.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
-- m_add: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
74 => X"6D_5F_61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0376@004B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
75 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0377@004C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
76 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0380@004D.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
-- m_shift0: d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
77 => X"6D_5F_73_68_69_66_74_30_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53",

-- L0381@004E.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- m_shift1: d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
78 => X"6D_5F_73_68_69_66_74_31_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20",

-- L0382@004F.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
-- m_shift: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
79 => X"6D_5F_73_68_69_66_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C",

-- L0383@0050.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
80 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0386@0051.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
81 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0387@0052.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
82 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0388@0053.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
83 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0389@0054.  loopcnt <= dec, if false then next else m_loop;
-- loopcnt <= dec, if false then next else m_loop;
84 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0394@0055.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
85 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0395@0056.  div2(max, set);
-- div2(max, set);
86 => X"64_69_76_32_28_6D_61_78_2C_20_73_65_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0396@0057.  bitcnt <= max, if z_flagtos_is_set then conv_done0;
-- bitcnt <= max, if z_flagtos_is_set then conv_done0;
87 => X"62_69_74_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73",

-- L0397@0058.bitcnt_s0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- bitcnt_s0: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
88 => X"62_69_74_63_6E_74_5F_73_30_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0398@0059.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
89 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0399@005A.  STATUS = busy_using_mt, opr = d2_d2_np;
-- STATUS = busy_using_mt, opr = d2_d2_np;
90 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0400@005B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
91 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0401@005C.  loopcnt <= max;
-- loopcnt <= max;
92 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0402@005D.  loopcnt <= inc;
-- loopcnt <= inc;
93 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0403@005E.loopcnt_s0:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- loopcnt_s0: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
94 => X"6C_6F_6F_70_63_6E_74_5F_73_30_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0404@005F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
95 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0406@0060.loopcnt_d0:  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
-- loopcnt_d0: STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
96 => X"6C_6F_6F_70_63_6E_74_5F_64_30_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0407@0061.  if loopcnt_nibble then next else loopcnt_d0;
-- if loopcnt_nibble then next else loopcnt_d0;
97 => X"69_66_20_6C_6F_6F_70_63_6E_74_5F_6E_69_62_62_6C_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65",

-- L0408@0062.  if d_flag_is_set then next else loopcnt_n0;
-- if d_flag_is_set then next else loopcnt_n0;
98 => X"69_66_20_64_5F_66_6C_61_67_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0409@0063.  bcd_adjust(one);
-- bcd_adjust(one);
99 => X"62_63_64_5F_61_64_6A_75_73_74_28_6F_6E_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0410@0064.loopcnt_n0:  if loopcnt_is_zero then next else loopcnt_s0;
-- loopcnt_n0: if loopcnt_is_zero then next else loopcnt_s0;
100 => X"6C_6F_6F_70_63_6E_74_5F_6E_30_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74",

-- L0411@0065.  if bitcnt_is_zero then conv_done0;
-- if bitcnt_is_zero then conv_done0;
101 => X"69_66_20_62_69_74_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_63_6F_6E_76_5F_64_6F_6E_65",

-- L0412@0066.  bitcnt <= dec, if false then next else bitcnt_s0;
-- bitcnt <= dec, if false then next else bitcnt_s0;
102 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0413@0067.conv_done0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- conv_done0: STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
103 => X"63_6F_6E_76_5F_64_6F_6E_65_30_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0414@0068.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
104 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0419@0069.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
105 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0420@006A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
106 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0421@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 7;
107 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0422@006C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, div2(max, set);
108 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0423@006D.  bitcnt <= max, if z_flagtos_is_set then done;
-- bitcnt <= max, if z_flagtos_is_set then done;
109 => X"62_69_74_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73",

-- L0424@006E.bitcnt_s1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- bitcnt_s1: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
110 => X"62_69_74_63_6E_74_5F_73_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0425@006F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
111 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0426@0070.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
112 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0427@0071.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
113 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0428@0072.  loopcnt <= max;
-- loopcnt <= max;
114 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0429@0073.  loopcnt <= inc;
-- loopcnt <= inc;
115 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0430@0074.loopcnt_s1:  c_flag <= one, opr = np_np_ld, MT_COL = 5;
-- loopcnt_s1: c_flag <= one, opr = np_np_ld, MT_COL = 5;
116 => X"6C_6F_6F_70_63_6E_74_5F_73_31_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_6F_70_72_20_3D",

-- L0431@0075.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
117 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0432@0076.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
118 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0433@0077.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
119 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0434@0078.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD;
120 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0436@0079.loopcnt_d1:  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- loopcnt_d1: STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
121 => X"6C_6F_6F_70_63_6E_74_5F_64_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0437@007A.  if loopcnt_nibble then next else loopcnt_d1;
-- if loopcnt_nibble then next else loopcnt_d1;
122 => X"69_66_20_6C_6F_6F_70_63_6E_74_5F_6E_69_62_62_6C_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65",

-- L0438@007B.  if c_flag_is_set then next else loopcnt_n1;
-- if c_flag_is_set then next else loopcnt_n1;
123 => X"69_66_20_63_5F_66_6C_61_67_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0439@007C.  if bitcnt_is_zero then loopcnt_n1 else next;
-- if bitcnt_is_zero then loopcnt_n1 else next;
124 => X"69_66_20_62_69_74_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_6C_6F_6F_70_63_6E_74_5F_6E",

-- L0440@007D.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
125 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0441@007E.  bcd_adjust(zero);
-- bcd_adjust(zero);
126 => X"62_63_64_5F_61_64_6A_75_73_74_28_7A_65_72_6F_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0442@007F.loopcnt_n1:  if loopcnt_is_zero then next else loopcnt_s1;
-- loopcnt_n1: if loopcnt_is_zero then next else loopcnt_s1;
127 => X"6C_6F_6F_70_63_6E_74_5F_6E_31_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74",

-- L0443@0080.  if bitcnt_is_zero then conv_done1;
-- if bitcnt_is_zero then conv_done1;
128 => X"69_66_20_62_69_74_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_63_6F_6E_76_5F_64_6F_6E_65",

-- L0444@0081.  bitcnt <= dec, if false then next else bitcnt_s1;
-- bitcnt <= dec, if false then next else bitcnt_s1;
129 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0445@0082.conv_done1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- conv_done1: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
130 => X"63_6F_6E_76_5F_64_6F_6E_65_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0446@0083.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
131 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0447@0084.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
132 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0448@0085.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 1, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 1, if false then next else exec;
133 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0461@0086.  opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
134 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_30_30_30_30_2C",

-- L0467@0087.  opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
135 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_31_30_31_2C",

-- L0471@0088.  opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
136 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_31_31_31_2C",

-- L0480@0089.  opr = np_np_ld, MT_COL = 0b1001;
-- opr = np_np_ld, MT_COL = 0b1001;
137 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_30_30_31_3B",

-- L0481@008A.hexchar:  bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- hexchar: bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
138 => X"68_65_78_63_68_61_72_3A_20_62_69_74_63_6E_74_20_3C_3D_20_6C_6F_61_64_2C_20_4D_54_5F_43_4F_4C_20",

-- L0482@008B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
139 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0483@008C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
140 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0484@008D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
141 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0485@008E.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
-- STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
142 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0486@008F.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
143 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0487@0090.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
144 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0488@0091.  bitcnt <= dec;
-- bitcnt <= dec;
145 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0489@0092.  bitcnt <= dec;
-- bitcnt <= dec;
146 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0490@0093.  bitcnt <= dec;
-- bitcnt <= dec;
147 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0491@0094.  STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
-- STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
148 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0496@0095.divmod:  prep_regs(max);
-- divmod: prep_regs(max);
149 => X"64_69_76_6D_6F_64_3A_20_70_72_65_70_5F_72_65_67_73_28_6D_61_78_29_3B_20_20_20_20_20_20_20_20_20",

-- L0497@0096.  if z_flagtos_is_set then next else div_loop;
-- if z_flagtos_is_set then next else div_loop;
150 => X"69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C",

-- L0498@0097.  if d_flag_is_set then swap else divzero;
-- if d_flag_is_set then swap else divzero;
151 => X"69_66_20_64_5F_66_6C_61_67_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_73_77_61_70_20_65_6C_73_65_20",

-- L0500@0098.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- div_loop: STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
152 => X"64_69_76_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0501@0099.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
153 => X"64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0502@009A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
154 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0503@009B.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
155 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0504@009C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
156 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0505@009D.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
157 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0506@009E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
158 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0509@009F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
159 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0510@00A0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
160 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0512@00A1.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
161 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0515@00A2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
162 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0516@00A3.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
163 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0517@00A4.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
164 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0518@00A5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
165 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0519@00A6.  STATUS = busy_using_mt, opr = d2_d2_np;
-- STATUS = busy_using_mt, opr = d2_d2_np;
166 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0520@00A7.  d_flag <= one;
-- d_flag <= one;
167 => X"64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0521@00A8.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
168 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0522@00A9.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
169 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0524@00AA.div_next:  if loopcnt_is_zero then return;
-- div_next: if loopcnt_is_zero then return;
170 => X"64_69_76_5F_6E_65_78_74_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65",

-- L0525@00AB.  loopcnt <= dec, if false then next else div_loop;
-- loopcnt <= dec, if false then next else div_loop;
171 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0528@00AC.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
-- restore_a: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
172 => X"72_65_73_74_6F_72_65_5F_61_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0529@00AD.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
173 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0532@00AE.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- a_pm_m: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
174 => X"61_5F_70_6D_5F_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0533@00AF.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
175 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0534@00B0.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
176 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0537@00B1.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- prep_regs: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
177 => X"70_72_65_70_5F_72_65_67_73_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0538@00B2.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
178 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0539@00B3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
179 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0540@00B4.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
180 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0541@00B5.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
181 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0544@00B6.heron_step:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- heron_step: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
182 => X"68_65_72_6F_6E_5F_73_74_65_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0545@00B7.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, div2(max, set);
183 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0546@00B8.  divmod(same);
-- divmod(same);
184 => X"64_69_76_6D_6F_64_28_73_61_6D_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0547@00B9.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
185 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0548@00BA.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
186 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0549@00BB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
187 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0550@00BC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
188 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0551@00BD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD;
189 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0552@00BE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, c_flag <= zero, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, c_flag <= zero, div2(max, set);
190 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0556@00BF.shift_down:  prep_shift();
-- shift_down: prep_shift();
191 => X"73_68_69_66_74_5F_64_6F_77_6E_3A_20_70_72_65_70_5F_73_68_69_66_74_28_29_3B_20_20_20_20_20_20_20",

-- L0557@00C0.shift_dloop:  STATUS = busy_using_mt, opr = m2_m2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then return;
-- shift_dloop: STATUS = busy_using_mt, opr = m2_m2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then return;
192 => X"73_68_69_66_74_5F_64_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0558@00C1.  bitcnt <= dec, if false then next else shift_dloop;
-- bitcnt <= dec, if false then next else shift_dloop;
193 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0561@00C2.shift_up:  prep_shift();
-- shift_up: prep_shift();
194 => X"73_68_69_66_74_5F_75_70_3A_20_70_72_65_70_5F_73_68_69_66_74_28_29_3B_20_20_20_20_20_20_20_20_20",

-- L0562@00C3.shift_uloop:  STATUS = busy_using_mt, opr = d2_d2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then return;
-- shift_uloop: STATUS = busy_using_mt, opr = d2_d2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then return;
195 => X"73_68_69_66_74_5F_75_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0563@00C4.  bitcnt <= dec, if false then next else shift_uloop;
-- bitcnt <= dec, if false then next else shift_uloop;
196 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0566@00C5.prep_shift:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- prep_shift: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
197 => X"70_72_65_70_5F_73_68_69_66_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0567@00C6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 8;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 8;
198 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0568@00C7.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0, d_flag <= zero, bitcnt <= max, z_flags <= set, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0, d_flag <= zero, bitcnt <= max, z_flags <= set, if true then return else return;
199 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0570@00C8.dup:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- dup: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
200 => X"64_75_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0571@00C9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= max, z_flags <= set;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= max, z_flags <= set;
201 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0575@00CA.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
-- div2: STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
202 => X"64_69_76_32_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70",

-- L0576@00CB.  bitcnt <= dec, if false then next else div2;
-- bitcnt <= dec, if false then next else div2;
203 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0579@00CC.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_swap: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
204 => X"6D_61_74_72_69_78_5F_73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0580@00CD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
205 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0583@00CE.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- matrix_nop1: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
206 => X"6D_61_74_72_69_78_5F_6E_6F_70_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0585@00CF.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
-- matrix_nop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
207 => X"6D_61_74_72_69_78_5F_6E_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0586@00D0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
208 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0587@00D1.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
209 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0588@00D2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
210 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0589@00D3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
211 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0590@00D4.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
212 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0593@00D5.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_push: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
213 => X"6D_61_74_72_69_78_5F_70_75_73_68_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0594@00D6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
214 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0595@00D7.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
215 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0596@00D8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
216 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0597@00D9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
217 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0598@00DA.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
218 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0599@00DB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
219 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0602@00DC.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
-- matrix_pop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
220 => X"6D_61_74_72_69_78_5F_70_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0603@00DD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
221 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0604@00DE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
222 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0605@00DF.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
223 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0606@00E0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
224 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0607@00E1.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
225 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0611@00E2.bcd_adjust:  STATUS = busy_using_mt, opr = np_m2_m2;
-- bcd_adjust: STATUS = busy_using_mt, opr = np_m2_m2;
226 => X"62_63_64_5F_61_64_6A_75_73_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0612@00E3.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
227 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0613@00E4.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
228 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0614@00E5.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
229 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0617@00E6.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
230 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0618@00E7.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
231 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0619@00E8.  opr = np_np_ld, MT_COL = 3, if c_flag_is_set then next else bcd_add3;
-- opr = np_np_ld, MT_COL = 3, if c_flag_is_set then next else bcd_add3;
232 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_2C_20_69_66_20_63",

-- L0622@00E9.bcd_sub3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
-- bcd_sub3: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
233 => X"62_63_64_5F_73_75_62_33_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0623@00EA.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else bcd_3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else bcd_3;
234 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0626@00EB.bcd_add3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
-- bcd_add3: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
235 => X"62_63_64_5F_61_64_64_33_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0628@00EC.bcd_3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 1;
-- bcd_3: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 1;
236 => X"62_63_64_5F_33_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0629@00ED.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
237 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0630@00EE.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
238 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0631@00EF.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
239 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0632@00F0.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
240 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0633@00F1.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 1;
241 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0634@00F2.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xD , MT_COL = 0xD, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xD , MT_COL = 0xD, if true then return else return;
242 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0637@00F3.print_st:  loopcnt <= max, if TRACE_RESULT then next else return;
-- print_st: loopcnt <= max, if TRACE_RESULT then next else return;
243 => X"70_72_69_6E_74_5F_73_74_3A_20_6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_69_66_20_54_52_41",

-- L0638@00F4.  loopcnt <= inc, print_crlf();
-- loopcnt <= inc, print_crlf();
244 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20",

-- L0639@00F5.st_loop:  selreg = internal, emit(reg);
-- st_loop: selreg = internal, emit(reg);
245 => X"73_74_5F_6C_6F_6F_70_3A_20_73_65_6C_72_65_67_20_3D_20_69_6E_74_65_72_6E_61_6C_2C_20_65_6D_69_74",

-- L0640@00F6.st_loop1:  loopcnt <= inc;
-- st_loop1: loopcnt <= inc;
246 => X"73_74_5F_6C_6F_6F_70_31_3A_20_6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20",

-- L0641@00F7.  if loopcnt_nibble then next else st_loop1;
-- if loopcnt_nibble then next else st_loop1;
247 => X"69_66_20_6C_6F_6F_70_63_6E_74_5F_6E_69_62_62_6C_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65",

-- L0642@00F8.  if loopcnt_is_zero then print_crlf else st_loop;
-- if loopcnt_is_zero then print_crlf else st_loop;
248 => X"69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_70_72_69_6E_74_5F_63_72",

-- L0644@00F9.echo:  if TRACE_INPUT then emit else emit0;
-- echo: if TRACE_INPUT then emit else emit0;
249 => X"65_63_68_6F_3A_20_69_66_20_54_52_41_43_45_5F_49_4E_50_55_54_20_74_68_65_6E_20_65_6D_69_74_20_65",

-- L0646@00FA.print_crlf:  emit(char_cr);
-- print_crlf: emit(char_cr);
250 => X"70_72_69_6E_74_5F_63_72_6C_66_3A_20_65_6D_69_74_28_63_68_61_72_5F_63_72_29_3B_20_20_20_20_20_20",

-- L0647@00FB.  TXDCHAR <= char_lf;
-- TXDCHAR <= char_lf;
251 => X"54_58_44_43_48_41_52_20_3C_3D_20_63_68_61_72_5F_6C_66_3B_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0649@00FC.emit:  if TXDSEND then next else repeat;
-- emit: if TXDSEND then next else repeat;
252 => X"65_6D_69_74_3A_20_69_66_20_54_58_44_53_45_4E_44_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0650@00FD.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
253 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0651@00FE.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
254 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0652@00FF.emit0:  TXDCHAR <= char_zero, if true then return else return;
-- emit0: TXDCHAR <= char_zero, if true then return else return;
255 => X"65_6D_69_74_30_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_63_68_61_72_5F_7A_65_72_6F_2C_20_69_66_20");

end hexcalc_sym;

