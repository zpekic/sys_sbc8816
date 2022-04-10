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

-- L0212@0000._reset:  MT_CTRL = clear, errcode <= ok;
-- _reset: MT_CTRL = clear, errcode <= ok;
0 => X"5F_72_65_73_65_74_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64_65",

-- L0214@0001._reset1:  MT_CTRL = clear, errcode <= ok;
-- _reset1: MT_CTRL = clear, errcode <= ok;
1 => X"5F_72_65_73_65_74_31_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0216@0002._reset2:  MT_CTRL = clear, errcode <= ok;
-- _reset2: MT_CTRL = clear, errcode <= ok;
2 => X"5F_72_65_73_65_74_32_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0218@0003._reset3:  MT_CTRL = clear, errcode <= ok;
-- _reset3: MT_CTRL = clear, errcode <= ok;
3 => X"5F_72_65_73_65_74_33_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0222@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
-- deadloop: STATUS = ready, if input_is_zero then repeat else next;
4 => X"64_65_61_64_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_72_65_61_64_79_2C_20_69_66_20_69_6E_70",

-- L0223@0005.  if true then fork else fork;
-- if true then fork else fork;
5 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_66_6F_72_6B_20_65_6C_73_65_20_66_6F_72_6B_3B_20_20_20_20",

-- L0226@0006.badchar:  errcode <= err_badchar, if false then next else printerror;
-- badchar: errcode <= err_badchar, if false then next else printerror;
6 => X"62_61_64_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63_68_61_72_2C",

-- L0227@0007.divzero:  errcode <= err_divzero, if false then next else printerror;
-- divzero: errcode <= err_divzero, if false then next else printerror;
7 => X"64_69_76_7A_65_72_6F_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_64_69_76_7A_65_72_6F_2C",

-- L0228@0008.printerror:  emit(char_E);
-- printerror: emit(char_E);
8 => X"70_72_69_6E_74_65_72_72_6F_72_3A_20_65_6D_69_74_28_63_68_61_72_5F_45_29_3B_20_20_20_20_20_20_20",

-- L0229@0009.  emit(char_R);
-- emit(char_R);
9 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0230@000A.  emit(char_R);
-- emit(char_R);
10 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0231@000B.  emit(errcode);
-- emit(errcode);
11 => X"65_6D_69_74_28_65_72_72_63_6F_64_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0232@000C.  emit(char_space);
-- emit(char_space);
12 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0233@000D.  emit(inp1);
-- emit(inp1);
13 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0234@000E.  emit(inp0);
-- emit(inp0);
14 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0235@000F.  print_crlf();
-- print_crlf();
15 => X"70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0242@0010.  echo(input);
-- echo(input);
16 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0243@0011.nextchar:  STATUS = done, if false then next else deadloop;
-- nextchar: STATUS = done, if false then next else deadloop;
17 => X"6E_65_78_74_63_68_61_72_3A_20_53_54_41_54_55_53_20_3D_20_64_6F_6E_65_2C_20_69_66_20_66_61_6C_73",

-- L0248@0012.  echo(input);
-- echo(input);
18 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0249@0013.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- enter: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
19 => X"65_6E_74_65_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0250@0014.  if false then next else exec;
-- if false then next else exec;
20 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0256@0015.  echo(input);
-- echo(input);
21 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0257@0016.dup:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- dup: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
22 => X"64_75_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0258@0017.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
23 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0264@0018.  echo(input);
-- echo(input);
24 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0265@0019.rotate:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- rotate: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
25 => X"72_6F_74_61_74_65_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0266@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0, if false then next else exec;
26 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0272@001B.  echo(input);
-- echo(input);
27 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0273@001C.swap:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
-- swap: STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
28 => X"73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54",

-- L0274@001D.  if false then next else exec;
-- if false then next else exec;
29 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0279@001E.  prep_shift();
-- prep_shift();
30 => X"70_72_65_70_5F_73_68_69_66_74_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0280@001F.lsr_loop:  STATUS = busy_using_mt, opr = m2_m2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then done;
-- lsr_loop: STATUS = busy_using_mt, opr = m2_m2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then done;
31 => X"6C_73_72_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0281@0020.  bitcnt <= dec, if false then next else lsr_loop;
-- bitcnt <= dec, if false then next else lsr_loop;
32 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0286@0021.  prep_shift();
-- prep_shift();
33 => X"70_72_65_70_5F_73_68_69_66_74_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0287@0022.lsl_loop:  STATUS = busy_using_mt, opr = d2_d2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then done;
-- lsl_loop: STATUS = busy_using_mt, opr = d2_d2_np, z_flags <= update, d_flag <= column, if bitcnt_is_zero then done;
34 => X"6C_73_6C_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0288@0023.  bitcnt <= dec, if false then next else lsl_loop;
-- bitcnt <= dec, if false then next else lsl_loop;
35 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0294@0024.  echo(input);
-- echo(input);
36 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0295@0025.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
37 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0301@0026.  echo(input);
-- echo(input);
38 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0302@0027.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
39 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0303@0028.exec:  div2(max, set);
-- exec: div2(max, set);
40 => X"65_78_65_63_3A_20_64_69_76_32_28_6D_61_78_2C_20_73_65_74_29_3B_20_20_20_20_20_20_20_20_20_20_20",

-- L0304@0029.done:  print_st();
-- done: print_st();
41 => X"64_6F_6E_65_3A_20_70_72_69_6E_74_5F_73_74_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0305@002A.  if false then next else nextchar;
-- if false then next else nextchar;
42 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65_78_74_63_68_61_72",

-- L0310@002B.  echo(input);
-- echo(input);
43 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0314@002C.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- plus: c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
44 => X"70_6C_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0315@002D.add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
-- add: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
45 => X"61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0316@002E.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- pm: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
46 => X"70_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43",

-- L0317@002F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
47 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0322@0030.  echo(input);
-- echo(input);
48 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0323@0031.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- minus: c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
49 => X"6D_69_6E_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0324@0032.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
50 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0325@0033.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
51 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0330@0034.  echo(input);
-- echo(input);
52 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0331@0035.div:  prep_regs(max);
-- div: prep_regs(max);
53 => X"64_69_76_3A_20_70_72_65_70_5F_72_65_67_73_28_6D_61_78_29_3B_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0332@0036.  if z_flagtos_is_set then divzero;
-- if z_flagtos_is_set then divzero;
54 => X"69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_64_69_76_7A_65_72_6F",

-- L0334@0037.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- div_loop: STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
55 => X"64_69_76_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0335@0038.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
56 => X"64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0336@0039.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
57 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0337@003A.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
58 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0338@003B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
59 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0339@003C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
60 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0340@003D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
61 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0343@003E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
62 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0344@003F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
63 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0346@0040.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD, if c_flag_is_set then next else restore_a;
64 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0349@0041.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
65 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0350@0042.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
66 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0351@0043.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
67 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0352@0044.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
68 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0353@0045.  STATUS = busy_using_mt, opr = d2_d2_np;
-- STATUS = busy_using_mt, opr = d2_d2_np;
69 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0354@0046.  d_flag <= one;
-- d_flag <= one;
70 => X"64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0355@0047.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
71 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0356@0048.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
72 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0358@0049.div_next:  if loopcnt_is_zero then swap;
-- div_next: if loopcnt_is_zero then swap;
73 => X"64_69_76_5F_6E_65_78_74_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65",

-- L0359@004A.  loopcnt <= dec, if false then next else div_loop;
-- loopcnt <= dec, if false then next else div_loop;
74 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0362@004B.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
-- restore_a: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
75 => X"72_65_73_74_6F_72_65_5F_61_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0363@004C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD, if false then next else div_next;
76 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0368@004D.  echo(input);
-- echo(input);
77 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0369@004E.mul:  prep_regs(max);
-- mul: prep_regs(max);
78 => X"6D_75_6C_3A_20_70_72_65_70_5F_72_65_67_73_28_6D_61_78_29_3B_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0370@004F.  if z_flagnos_is_set then done;
-- if z_flagnos_is_set then done;
79 => X"69_66_20_7A_5F_66_6C_61_67_6E_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_64_6F_6E_65_3B_20_20",

-- L0372@0050.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- m_loop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
80 => X"6D_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0373@0051.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
81 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0374@0052.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
82 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0375@0053.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
-- c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
83 => X"63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0378@0054.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
-- m_add_r7: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
84 => X"6D_5F_61_64_64_5F_72_37_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0379@0055.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
-- m_add: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
85 => X"6D_5F_61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0380@0056.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
86 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0381@0057.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
87 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0384@0058.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
-- m_shift0: d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
88 => X"6D_5F_73_68_69_66_74_30_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53",

-- L0385@0059.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- m_shift1: d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
89 => X"6D_5F_73_68_69_66_74_31_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20",

-- L0386@005A.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
-- m_shift: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
90 => X"6D_5F_73_68_69_66_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C",

-- L0387@005B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
91 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0390@005C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
92 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0391@005D.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
93 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0392@005E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then done;
94 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0393@005F.  loopcnt <= dec, if false then next else m_loop;
-- loopcnt <= dec, if false then next else m_loop;
95 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0398@0060.  echo(input);
-- echo(input);
96 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0399@0061.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
97 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0400@0062.  div2(max, set);
-- div2(max, set);
98 => X"64_69_76_32_28_6D_61_78_2C_20_73_65_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0401@0063.  bitcnt <= max, if z_flagtos_is_set then conv_done0;
-- bitcnt <= max, if z_flagtos_is_set then conv_done0;
99 => X"62_69_74_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73",

-- L0402@0064.bitcnt_s0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- bitcnt_s0: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
100 => X"62_69_74_63_6E_74_5F_73_30_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0403@0065.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
101 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0405@0066.  STATUS = busy_using_mt, opr = d2_d2_np;
-- STATUS = busy_using_mt, opr = d2_d2_np;
102 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0406@0067.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
103 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0407@0068.  loopcnt <= max;
-- loopcnt <= max;
104 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0408@0069.  loopcnt <= inc;
-- loopcnt <= inc;
105 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0409@006A.loopcnt_s0:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- loopcnt_s0: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
106 => X"6C_6F_6F_70_63_6E_74_5F_73_30_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0410@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
107 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0413@006C.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
108 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0414@006D.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
109 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0415@006E.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
110 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0416@006F.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column, loopcnt <= dec;
111 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0417@0070.  if d_flag_is_set then next else loopcnt_n0;
-- if d_flag_is_set then next else loopcnt_n0;
112 => X"69_66_20_64_5F_66_6C_61_67_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0418@0071.  bcd_adjust(one);
-- bcd_adjust(one);
113 => X"62_63_64_5F_61_64_6A_75_73_74_28_6F_6E_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0420@0072.loopcnt_n0:  if loopcnt_is_zero then next else loopcnt_s0;
-- loopcnt_n0: if loopcnt_is_zero then next else loopcnt_s0;
114 => X"6C_6F_6F_70_63_6E_74_5F_6E_30_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74",

-- L0421@0073.  if bitcnt_is_zero then conv_done0;
-- if bitcnt_is_zero then conv_done0;
115 => X"69_66_20_62_69_74_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_63_6F_6E_76_5F_64_6F_6E_65",

-- L0422@0074.  bitcnt <= dec, if false then next else bitcnt_s0;
-- bitcnt <= dec, if false then next else bitcnt_s0;
116 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0423@0075.conv_done0:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- conv_done0: STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
117 => X"63_6F_6E_76_5F_64_6F_6E_65_30_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0424@0076.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, if false then next else exec;
118 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0429@0077.  echo(input);
-- echo(input);
119 => X"65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0430@0078.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
120 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0431@0079.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
121 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0432@007A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 7;
122 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0433@007B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, div2(max, set);
123 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0434@007C.  bitcnt <= max, if z_flagtos_is_set then done;
-- bitcnt <= max, if z_flagtos_is_set then done;
124 => X"62_69_74_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73",

-- L0435@007D.bitcnt_s1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- bitcnt_s1: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
125 => X"62_69_74_63_6E_74_5F_73_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0436@007E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
126 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0437@007F.  if true then next else next;
-- if true then next else next;
127 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65_78_74_3B_20_20_20_20",

-- L0438@0080.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
128 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0439@0081.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
129 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0440@0082.  loopcnt <= max;
-- loopcnt <= max;
130 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0441@0083.  loopcnt <= inc;
-- loopcnt <= inc;
131 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0442@0084.loopcnt_s1:  c_flag <= one, opr = np_np_ld, MT_COL = 5;
-- loopcnt_s1: c_flag <= one, opr = np_np_ld, MT_COL = 5;
132 => X"6C_6F_6F_70_63_6E_74_5F_73_31_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_6F_70_72_20_3D",

-- L0443@0085.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
133 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0444@0086.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
134 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0445@0087.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
135 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0446@0088.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD;
136 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0448@0089.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
137 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0449@008A.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
138 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0450@008B.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
139 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0451@008C.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update, loopcnt <= dec;
140 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0452@008D.  if c_flag_is_set then next else loopcnt_n1;
-- if c_flag_is_set then next else loopcnt_n1;
141 => X"69_66_20_63_5F_66_6C_61_67_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0453@008E.  if bitcnt_is_zero then loopcnt_n1 else next;
-- if bitcnt_is_zero then loopcnt_n1 else next;
142 => X"69_66_20_62_69_74_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_6C_6F_6F_70_63_6E_74_5F_6E",

-- L0454@008F.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
143 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0455@0090.  bcd_adjust(zero);
-- bcd_adjust(zero);
144 => X"62_63_64_5F_61_64_6A_75_73_74_28_7A_65_72_6F_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0456@0091.loopcnt_n1:  if loopcnt_is_zero then next else loopcnt_s1;
-- loopcnt_n1: if loopcnt_is_zero then next else loopcnt_s1;
145 => X"6C_6F_6F_70_63_6E_74_5F_6E_31_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74",

-- L0457@0092.  if bitcnt_is_zero then conv_done1;
-- if bitcnt_is_zero then conv_done1;
146 => X"69_66_20_62_69_74_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_63_6F_6E_76_5F_64_6F_6E_65",

-- L0458@0093.  bitcnt <= dec, if false then next else bitcnt_s1;
-- bitcnt <= dec, if false then next else bitcnt_s1;
147 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0459@0094.conv_done1:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- conv_done1: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
148 => X"63_6F_6E_76_5F_64_6F_6E_65_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0460@0095.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
149 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0461@0096.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
150 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0462@0097.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 1, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 1, if false then next else exec;
151 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0475@0098.  opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b0000, if false then next else hexchar;
152 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_30_30_30_30_2C",

-- L0481@0099.  opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b1101, if false then next else hexchar;
153 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_31_30_31_2C",

-- L0485@009A.  opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
-- opr = np_np_ld, MT_COL = 0b1111, if false then next else hexchar;
154 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_31_31_31_2C",

-- L0494@009B.  opr = np_np_ld, MT_COL = 0b1001;
-- opr = np_np_ld, MT_COL = 0b1001;
155 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_30_62_31_30_30_31_3B",

-- L0495@009C.hexchar:  echo(input);
-- hexchar: echo(input);
156 => X"68_65_78_63_68_61_72_3A_20_65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20_20_20_20",

-- L0496@009D.  bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- bitcnt <= load, MT_COL = 3, c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
157 => X"62_69_74_63_6E_74_20_3C_3D_20_6C_6F_61_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_2C_20_63_5F_66_6C",

-- L0497@009E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xC , MT_COL = 0xC;
158 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0498@009F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
159 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0499@00A0.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
160 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0500@00A1.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
-- STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
161 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0501@00A2.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, bitcnt <= max;
162 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0502@00A3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0, bitcnt <= dec;
163 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0503@00A4.  bitcnt <= dec;
-- bitcnt <= dec;
164 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0504@00A5.  bitcnt <= dec;
-- bitcnt <= dec;
165 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0505@00A6.  bitcnt <= dec;
-- bitcnt <= dec;
166 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0506@00A7.  STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
-- STATUS = busy_using_mt, opr = np_d2_d2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
167 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0512@00A8.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- a_pm_m: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
168 => X"61_5F_70_6D_5F_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0513@00A9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2(max, set);
169 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0514@00AA.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
170 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0517@00AB.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- prep_regs: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
171 => X"70_72_65_70_5F_72_65_67_73_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0518@00AC.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
172 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0519@00AD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2(max, set);
173 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0520@00AE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
174 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0521@00AF.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
175 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0524@00B0.prep_shift:  echo(input);
-- prep_shift: echo(input);
176 => X"70_72_65_70_5F_73_68_69_66_74_3A_20_65_63_68_6F_28_69_6E_70_75_74_29_3B_20_20_20_20_20_20_20_20",

-- L0525@00B1.lsr:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- lsr: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
177 => X"6C_73_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0526@00B2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 8;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 8;
178 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0527@00B3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
179 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0528@00B4.  d_flag <= zero, bitcnt <= max, z_flags <= set, if true then return else return;
-- d_flag <= zero, bitcnt <= max, z_flags <= set, if true then return else return;
180 => X"64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_62_69_74_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_7A",

-- L0531@00B5.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
-- div2: STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
181 => X"64_69_76_32_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70",

-- L0532@00B6.  bitcnt <= dec, if false then next else div2;
-- bitcnt <= dec, if false then next else div2;
182 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0535@00B7.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_swap: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
183 => X"6D_61_74_72_69_78_5F_73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0536@00B8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
184 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0539@00B9.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- matrix_nop1: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
185 => X"6D_61_74_72_69_78_5F_6E_6F_70_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0541@00BA.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
-- matrix_nop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
186 => X"6D_61_74_72_69_78_5F_6E_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0542@00BB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
187 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0543@00BC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
188 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0544@00BD.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
189 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0545@00BE.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
190 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0546@00BF.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
191 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0549@00C0.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_push: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
192 => X"6D_61_74_72_69_78_5F_70_75_73_68_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0550@00C1.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
193 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0551@00C2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
194 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0552@00C3.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
195 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0553@00C4.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
196 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0554@00C5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
197 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0555@00C6.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
198 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0558@00C7.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
-- matrix_pop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
199 => X"6D_61_74_72_69_78_5F_70_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0559@00C8.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
200 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0560@00C9.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
201 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0561@00CA.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
202 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0562@00CB.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
203 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0563@00CC.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
204 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0567@00CD.bcd_adjust:  STATUS = busy_using_mt, opr = np_m2_m2;
-- bcd_adjust: STATUS = busy_using_mt, opr = np_m2_m2;
205 => X"62_63_64_5F_61_64_6A_75_73_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0568@00CE.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
206 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0569@00CF.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
207 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0570@00D0.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
208 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0573@00D1.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
209 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0574@00D2.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xC;
210 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0575@00D3.  opr = np_np_ld, MT_COL = 3, if c_flag_is_set then next else bcd_add3;
-- opr = np_np_ld, MT_COL = 3, if c_flag_is_set then next else bcd_add3;
211 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_2C_20_69_66_20_63",

-- L0578@00D4.bcd_sub3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
-- bcd_sub3: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 9;
212 => X"62_63_64_5F_73_75_62_33_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0579@00D5.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else bcd_3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else bcd_3;
213 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0582@00D6.bcd_add3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
-- bcd_add3: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0xD;
214 => X"62_63_64_5F_61_64_64_33_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0584@00D7.bcd_3:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 1;
-- bcd_3: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 1;
215 => X"62_63_64_5F_33_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0585@00D8.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
216 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0586@00D9.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
217 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0587@00DA.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
218 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0588@00DB.  STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
-- STATUS = busy_using_mt, opr = np_d2_d2, c_flag <= adder, z_flags <= update;
219 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0589@00DC.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 1;
220 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0590@00DD.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xD , MT_COL = 0xD, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xD , MT_COL = 0xD, if true then return else return;
221 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0593@00DE.print_st:  loopcnt <= max, if TRACE_RESULT then next else return;
-- print_st: loopcnt <= max, if TRACE_RESULT then next else return;
222 => X"70_72_69_6E_74_5F_73_74_3A_20_6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_69_66_20_54_52_41",

-- L0594@00DF.  loopcnt <= inc, print_crlf();
-- loopcnt <= inc, print_crlf();
223 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20",

-- L0595@00E0.st_loop:  selreg = internal, emit(reg);
-- st_loop: selreg = internal, emit(reg);
224 => X"73_74_5F_6C_6F_6F_70_3A_20_73_65_6C_72_65_67_20_3D_20_69_6E_74_65_72_6E_61_6C_2C_20_65_6D_69_74",

-- L0596@00E1.  loopcnt <= inc;
-- loopcnt <= inc;
225 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0597@00E2.  loopcnt <= inc;
-- loopcnt <= inc;
226 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0598@00E3.  loopcnt <= inc;
-- loopcnt <= inc;
227 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0599@00E4.  loopcnt <= inc;
-- loopcnt <= inc;
228 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0600@00E5.  if loopcnt_is_zero then print_crlf else st_loop;
-- if loopcnt_is_zero then print_crlf else st_loop;
229 => X"69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65_6E_20_70_72_69_6E_74_5F_63_72",

-- L0602@00E6.echo:  if TRACE_INPUT then emit else return;
-- echo: if TRACE_INPUT then emit else return;
230 => X"65_63_68_6F_3A_20_69_66_20_54_52_41_43_45_5F_49_4E_50_55_54_20_74_68_65_6E_20_65_6D_69_74_20_65",

-- L0604@00E7.print_crlf:  emit(char_cr);
-- print_crlf: emit(char_cr);
231 => X"70_72_69_6E_74_5F_63_72_6C_66_3A_20_65_6D_69_74_28_63_68_61_72_5F_63_72_29_3B_20_20_20_20_20_20",

-- L0605@00E8.  TXDCHAR <= char_lf;
-- TXDCHAR <= char_lf;
232 => X"54_58_44_43_48_41_52_20_3C_3D_20_63_68_61_72_5F_6C_66_3B_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0607@00E9.emit:  if TXDSEND then next else repeat;
-- emit: if TXDSEND then next else repeat;
233 => X"65_6D_69_74_3A_20_69_66_20_54_58_44_53_45_4E_44_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0608@00EA.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
234 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0609@00EB.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
235 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0610@00EC.  TXDCHAR <= char_zero, if true then return else return;
-- TXDCHAR <= char_zero, if true then return else return;
236 => X"54_58_44_43_48_41_52_20_3C_3D_20_63_68_61_72_5F_7A_65_72_6F_2C_20_69_66_20_74_72_75_65_20_74_68",

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

