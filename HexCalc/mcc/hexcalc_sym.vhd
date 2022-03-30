--------------------------------------------------------
-- mcc V1.2.0208 - Custom microcode compiler (c)2020-... 
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

-- L0210@0000._reset:  MT_CTRL = clear, errcode <= ok;
-- _reset: MT_CTRL = clear, errcode <= ok;
0 => X"5F_72_65_73_65_74_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64_65",

-- L0212@0001._reset1:  MT_CTRL = clear, errcode <= ok;
-- _reset1: MT_CTRL = clear, errcode <= ok;
1 => X"5F_72_65_73_65_74_31_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0214@0002._reset2:  MT_CTRL = clear, errcode <= ok;
-- _reset2: MT_CTRL = clear, errcode <= ok;
2 => X"5F_72_65_73_65_74_32_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0216@0003._reset3:  MT_CTRL = clear, errcode <= ok;
-- _reset3: MT_CTRL = clear, errcode <= ok;
3 => X"5F_72_65_73_65_74_33_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0220@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
-- deadloop: STATUS = ready, if input_is_zero then repeat else next;
4 => X"64_65_61_64_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_72_65_61_64_79_2C_20_69_66_20_69_6E_70",

-- L0221@0005.  if true then fork else fork;
-- if true then fork else fork;
5 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_66_6F_72_6B_20_65_6C_73_65_20_66_6F_72_6B_3B_20_20_20_20",

-- L0224@0006.badchar:  errcode <= err_badchar, if false then next else printerror;
-- badchar: errcode <= err_badchar, if false then next else printerror;
6 => X"62_61_64_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63_68_61_72_2C",

-- L0225@0007.divzero:  errcode <= err_divzero, if false then next else printerror;
-- divzero: errcode <= err_divzero, if false then next else printerror;
7 => X"64_69_76_7A_65_72_6F_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_64_69_76_7A_65_72_6F_2C",

-- L0226@0008.printerror:  emit(char_E);
-- printerror: emit(char_E);
8 => X"70_72_69_6E_74_65_72_72_6F_72_3A_20_65_6D_69_74_28_63_68_61_72_5F_45_29_3B_20_20_20_20_20_20_20",

-- L0227@0009.  emit(char_R);
-- emit(char_R);
9 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0228@000A.  emit(char_R);
-- emit(char_R);
10 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0229@000B.  emit(errcode);
-- emit(errcode);
11 => X"65_6D_69_74_28_65_72_72_63_6F_64_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0230@000C.  emit(char_space);
-- emit(char_space);
12 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0231@000D.  emit(inp1);
-- emit(inp1);
13 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0232@000E.  emit(inp0);
-- emit(inp0);
14 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0233@000F.  print_crlf();
-- print_crlf();
15 => X"70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0240@0010.  echo(input);
-- echo(input);
16 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0241@0011.nextchar:  STATUS = done, if false then next else deadloop;
-- nextchar: STATUS = done, if false then next else deadloop;
17 => X"6E_65_78_74_63_68_61_72_3A_20_53_54_41_54_55_53_20_3D_20_64_6F_6E_65_2C_20_69_66_20_66_61_6C_73",

-- L0246@0012.  echo(input);
-- echo(input);
18 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0247@0013.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- enter: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
19 => X"65_6E_74_65_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0248@0014.  if false then next else exec;
-- if false then next else exec;
20 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0254@0015.  echo(input);
-- echo(input);
21 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0255@0016.dup:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- dup: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
22 => X"64_75_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0256@0017.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
23 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0262@0018.  echo(input);
-- echo(input);
24 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0263@0019.rotate:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- rotate: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
25 => X"72_6F_74_61_74_65_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0264@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
26 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0270@001B.  echo(input);
-- echo(input);
27 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0271@001C.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
-- swap: STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
28 => X"73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54",

-- L0272@001D.  if false then next else exec;
-- if false then next else exec;
29 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0278@001E.  echo(input);
-- echo(input);
30 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0279@001F.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
31 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0285@0020.  echo(input);
-- echo(input);
32 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0286@0021.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
33 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0287@0022.exec:  z_flags <= set, div2(max);
-- exec: z_flags <= set, div2(max);
34 => X"65_78_65_63_3A_20_7A_5F_66_6C_61_67_73_20_3C_3D_20_73_65_74_2C_20_64_69_76_32_28_6D_61_78_29_3B",

-- L0288@0023.done:  print_st();
-- done: print_st();
35 => X"64_6F_6E_65_3A_20_70_72_69_6E_74_5F_73_74_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0289@0024.  if false then next else nextchar;
-- if false then next else nextchar;
36 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65_78_74_63_68_61_72",

-- L0294@0025.  echo(input);
-- echo(input);
37 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0295@0026.  bcd_add();
-- bcd_add();
38 => X"62_63_64_5F_61_64_64_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0296@0027.  if false then next else done;
-- if false then next else done;
39 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_64_6F_6E_65_3B_20_20_20",

-- L0298@0028.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- plus: c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
40 => X"70_6C_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0299@0029.add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
-- add: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
41 => X"61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0300@002A.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- pm: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
42 => X"70_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43",

-- L0301@002B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
43 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0304@002C.bcd_add:  c_flag <= zero, loopcnt <= max;
-- bcd_add: c_flag <= zero, loopcnt <= max;
44 => X"62_63_64_5F_61_64_64_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_6C_6F_6F_70_63_6E_74",

-- L0305@002D.  loopcnt <= inc;
-- loopcnt <= inc;
45 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0306@002E.bcd_loop:  STATUS = busy_using_mt, MT_CTRL = clear;
-- bcd_loop: STATUS = busy_using_mt, MT_CTRL = clear;
46 => X"62_63_64_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0307@002F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
47 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0308@0030.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
48 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0309@0031.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
49 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0310@0032.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
50 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0312@0033.bcd_digadd:  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- bcd_digadd: STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
51 => X"62_63_64_5F_64_69_67_61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0313@0034.  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
52 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0314@0035.  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
53 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0315@0036.  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update, loopcnt <= dec;
54 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0316@0037.  if daa_flag_is_set then next else next_digit;
-- if daa_flag_is_set then next else next_digit;
55 => X"69_66_20_64_61_61_5F_66_6C_61_67_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73",

-- L0317@0038.bcd_daa:  STATUS = busy_using_mt, MT_CTRL = clear;
-- bcd_daa: STATUS = busy_using_mt, MT_CTRL = clear;
56 => X"62_63_64_5F_64_61_61_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C",

-- L0318@0039.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
57 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0319@003A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
58 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0321@003B.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
59 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0322@003C.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
60 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0323@003D.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
61 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0324@003E.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
62 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0325@003F.  STATUS = busy_using_mt, MT_CTRL = clear;
-- STATUS = busy_using_mt, MT_CTRL = clear;
63 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0326@0040.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
64 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0327@0041.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
65 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0328@0042.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
66 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0329@0043.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
67 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0331@0044.  c_flag <= zero, opr = np_np_ld, MT_COL = 0;
-- c_flag <= zero, opr = np_np_ld, MT_COL = 0;
68 => X"63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20",

-- L0332@0045.  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
69 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0333@0046.  opr = np_np_ld, MT_COL = 1;
-- opr = np_np_ld, MT_COL = 1;
70 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_31_3B_20_20_20_20_20",

-- L0334@0047.  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
71 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0335@0048.  opr = np_np_ld, MT_COL = 1;
-- opr = np_np_ld, MT_COL = 1;
72 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_31_3B_20_20_20_20_20",

-- L0336@0049.  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
73 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0337@004A.  opr = np_np_ld, MT_COL = 0;
-- opr = np_np_ld, MT_COL = 0;
74 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_3B_20_20_20_20_20",

-- L0338@004B.  STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = d2_d2_np, c_flag <= adder, z_flags <= update;
75 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0339@004C.  c_flag <= one;
-- c_flag <= one;
76 => X"63_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0340@004D.next_digit:  if loopcnt_is_zero then return else bcd_loop;
-- next_digit: if loopcnt_is_zero then return else bcd_loop;
77 => X"6E_65_78_74_5F_64_69_67_69_74_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74",

-- L0345@004E.  echo(input);
-- echo(input);
78 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0346@004F.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- minus: c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
79 => X"6D_69_6E_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0347@0050.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
80 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0348@0051.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
81 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0353@0052.  echo(input);
-- echo(input);
82 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0354@0053.div:  prep_regs(max);
-- div: prep_regs(max);
83 => X"64_69_76_3A_20_70_72_65_70_5F_72_65_67_73_28_6D_61_78_29_3B_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0355@0054.  if z_flagtos_is_set then divzero;
-- if z_flagtos_is_set then divzero;
84 => X"69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_64_69_76_7A_65_72_6F",

-- L0357@0055.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- div_loop: STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
85 => X"64_69_76_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0358@0056.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
86 => X"64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0359@0057.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
87 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0360@0058.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
88 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0361@0059.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
89 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0362@005A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
90 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0363@005B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
91 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0366@005C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
92 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0367@005D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
93 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0369@005E.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
94 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0372@005F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
95 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0373@0060.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
96 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0374@0061.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
97 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0375@0062.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
98 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0376@0063.  STATUS = busy_using_mt, opr = d2_d2_np;
-- STATUS = busy_using_mt, opr = d2_d2_np;
99 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0377@0064.  d_flag <= one;
-- d_flag <= one;
100 => X"64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0378@0065.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
101 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0379@0066.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
102 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0381@0067.div_next:  if loopcnt_is_zero then swap;
-- div_next: if loopcnt_is_zero then swap;
103 => X"64_69_76_5F_6E_65_78_74_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65",

-- L0382@0068.  loopcnt <= dec, if false then next else div_loop;
-- loopcnt <= dec, if false then next else div_loop;
104 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0385@0069.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
-- restore_a: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
105 => X"72_65_73_74_6F_72_65_5F_61_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0386@006A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
106 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0391@006B.  echo(input);
-- echo(input);
107 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0392@006C.mul:  prep_regs(max);
-- mul: prep_regs(max);
108 => X"6D_75_6C_3A_20_70_72_65_70_5F_72_65_67_73_28_6D_61_78_29_3B_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0393@006D.  if z_flagnos_is_set then done;
-- if z_flagnos_is_set then done;
109 => X"69_66_20_7A_5F_66_6C_61_67_6E_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_64_6F_6E_65_3B_20_20",

-- L0395@006E.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- m_loop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
110 => X"6D_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0396@006F.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
111 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0397@0070.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
112 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0398@0071.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
-- c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
113 => X"63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0401@0072.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
-- m_add_r7: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
114 => X"6D_5F_61_64_64_5F_72_37_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0402@0073.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
-- m_add: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
115 => X"6D_5F_61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0403@0074.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max);
116 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0404@0075.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
117 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0407@0076.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
-- m_shift0: d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
118 => X"6D_5F_73_68_69_66_74_30_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53",

-- L0408@0077.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- m_shift1: d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
119 => X"6D_5F_73_68_69_66_74_31_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20",

-- L0409@0078.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
-- m_shift: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
120 => X"6D_5F_73_68_69_66_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C",

-- L0410@0079.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
121 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0413@007A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
122 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0414@007B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
123 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0415@007C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
124 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0416@007D.  loopcnt <= dec, if false then next else m_loop;
-- loopcnt <= dec, if false then next else m_loop;
125 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0429@007E.  opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
126 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_30_30_30_30_2C",

-- L0435@007F.  opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
127 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_31_30_31_2C",

-- L0439@0080.  opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
128 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_31_31_31_2C",

-- L0448@0081.  opr = np_np_ld, MT_COL = 0b1001;
-- opr = np_np_ld, MT_COL = 0b1001;
129 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_30_30_31_3B",

-- L0449@0082.hexchar:  echo(input);
-- hexchar: echo(input);
130 => X"68_65_78_63_68_61_72_3A_20_65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20",

-- L0450@0083.  bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
131 => X"62_69_74_63_6E_74_20_3C_3D_20_6C_6F_61_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_2C_20_63_5F_66_6C",

-- L0451@0084.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
132 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0452@0085.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
133 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0453@0086.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
134 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0454@0087.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
-- STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
135 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0455@0088.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
136 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0456@0089.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
137 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0457@008A.  bitcnt <= dec;
-- bitcnt <= dec;
138 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0458@008B.  bitcnt <= dec;
-- bitcnt <= dec;
139 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0459@008C.  bitcnt <= dec;
-- bitcnt <= dec;
140 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0460@008D.  STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
-- STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
141 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0463@008E.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- a_pm_m: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
142 => X"61_5F_70_6D_5F_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0464@008F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, div2(max);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, div2(max);
143 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0465@0090.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
144 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0469@0091.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- prep_regs: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
145 => X"70_72_65_70_5F_72_65_67_73_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0471@0092.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
146 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0472@0093.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, z_flags <= set, div2(max);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, z_flags <= set, div2(max);
147 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0473@0094.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
148 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0474@0095.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
149 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0477@0096.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
-- div2: STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
150 => X"64_69_76_32_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70",

-- L0478@0097.  bitcnt <= dec, if false then next else div2;
-- bitcnt <= dec, if false then next else div2;
151 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0481@0098.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_swap: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
152 => X"6D_61_74_72_69_78_5F_73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0482@0099.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
153 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0485@009A.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- matrix_nop1: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
154 => X"6D_61_74_72_69_78_5F_6E_6F_70_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0486@009B.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
-- matrix_nop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
155 => X"6D_61_74_72_69_78_5F_6E_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0487@009C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
156 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0488@009D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
157 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0489@009E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
158 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0490@009F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
159 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0491@00A0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
160 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0494@00A1.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_push: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
161 => X"6D_61_74_72_69_78_5F_70_75_73_68_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0495@00A2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
162 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0496@00A3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
163 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0497@00A4.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
164 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0498@00A5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
165 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0499@00A6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
166 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0500@00A7.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
167 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0503@00A8.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
-- matrix_pop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
168 => X"6D_61_74_72_69_78_5F_70_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0504@00A9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
169 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0505@00AA.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
170 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0506@00AB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
171 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0507@00AC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
172 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0508@00AD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
173 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0511@00AE.print_st:  loopcnt <= max, if TRACE_RESULT then next else return;
-- print_st: loopcnt <= max, if TRACE_RESULT then next else return;
174 => X"70_72_69_6E_74_5F_73_74_3A_20_6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_69_66_20_54_52_41",

-- L0512@00AF.  loopcnt <= inc, print_crlf();
-- loopcnt <= inc, print_crlf();
175 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20",

-- L0513@00B0.st_loop:  selreg = internal, emit(reg);
-- st_loop: selreg = internal, emit(reg);
176 => X"73_74_5F_6C_6F_6F_70_3A_20_73_65_6C_72_65_67_20_3D_20_69_6E_74_65_72_6E_61_6C_2C_20_65_6D_69_74",

-- L0514@00B1.  loopcnt <= inc;
-- loopcnt <= inc;
177 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0515@00B2.  loopcnt <= inc;
-- loopcnt <= inc;
178 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0516@00B3.  loopcnt <= inc;
-- loopcnt <= inc;
179 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0517@00B4.  loopcnt <= inc;
-- loopcnt <= inc;
180 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0518@00B5.  if loopcnt_is_zero then print_crlf else st_loop;
-- if loopcnt_is_zero then print_crlf else st_loop;
181 => X"69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_70_72_69_6E_74_5F_63_72",

-- L0520@00B6.echo:  if TRACE_INPUT then emit else return;
-- echo: if TRACE_INPUT then emit else return;
182 => X"65_63_68_6F_3A_20_69_66_20_54_52_41_43_45_5F_49_4E_50_55_54_20_74_68_65_6E_20_65_6D_69_74_20_65",

-- L0522@00B7.print_crlf:  emit(char_cr);
-- print_crlf: emit(char_cr);
183 => X"70_72_69_6E_74_5F_63_72_6C_66_3A_20_65_6D_69_74_28_63_68_61_72_5F_63_72_29_3B_20_20_20_20_20_20",

-- L0523@00B8.  TXDCHAR <= char_lf;
-- TXDCHAR <= char_lf;
184 => X"54_58_44_43_48_41_52_20_3C_3D_20_63_68_61_72_5F_6C_66_3B_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0525@00B9.emit:  if TXDREADY then next else repeat;
-- emit: if TXDREADY then next else repeat;
185 => X"65_6D_69_74_3A_20_69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65",

-- L0526@00BA.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
186 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0527@00BB.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
187 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0528@00BC.  if TXDSEND then next;
-- if TXDSEND then next;
188 => X"69_66_20_54_58_44_53_45_4E_44_20_74_68_65_6E_20_6E_65_78_74_3B_20_20_20_20_20_20_20_20_20_20_20",

-- L0529@00BD.  if TXDREADY then return else repeat;
-- if TXDREADY then return else repeat;
189 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_70",

190 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

191 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

192 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

193 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

194 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

195 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

196 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

197 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

198 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

199 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

200 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

201 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

202 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

203 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

204 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

205 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

206 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

207 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

208 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

209 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

210 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

211 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

212 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

213 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

214 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

215 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

216 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

217 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

218 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

219 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

220 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

221 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

222 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

223 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

224 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

225 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

226 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

227 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

228 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

229 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

230 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

231 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

232 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

233 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

234 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

235 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

236 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

237 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

238 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

239 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

240 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

241 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

242 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

243 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

244 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

245 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

246 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

247 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

248 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

249 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

250 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

251 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

252 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

253 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

254 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

255 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20");

end hexcalc_sym;

