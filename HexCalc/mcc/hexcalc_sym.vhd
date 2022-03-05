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
constant SYMBOL_ADDRESS_WIDTH: 	positive := 7;
constant SYMBOL_ADDRESS_LAST: 	positive := 127;
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

-- L0211@0000._reset:  MT_CTRL = clear, errcode <= ok;
-- _reset: MT_CTRL = clear, errcode <= ok;
0 => X"5F_72_65_73_65_74_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64_65",

-- L0213@0001._reset1:  MT_CTRL = clear, errcode <= ok;
-- _reset1: MT_CTRL = clear, errcode <= ok;
1 => X"5F_72_65_73_65_74_31_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0215@0002._reset2:  MT_CTRL = clear, errcode <= ok;
-- _reset2: MT_CTRL = clear, errcode <= ok;
2 => X"5F_72_65_73_65_74_32_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0217@0003._reset3:  MT_CTRL = clear, errcode <= ok;
-- _reset3: MT_CTRL = clear, errcode <= ok;
3 => X"5F_72_65_73_65_74_33_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0221@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
-- deadloop: STATUS = ready, if input_is_zero then repeat else next;
4 => X"64_65_61_64_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_72_65_61_64_79_2C_20_69_66_20_69_6E_70",

-- L0222@0005.  trace();
-- trace();
5 => X"74_72_61_63_65_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0223@0006.  if true then fork else fork;
-- if true then fork else fork;
6 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_66_6F_72_6B_20_65_6C_73_65_20_66_6F_72_6B_3B_20_20_20_20",

-- L0226@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
-- badchar: errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
7 => X"62_61_64_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63_68_61_72_2C",

-- L0227@0008.divzero:  errcode <= err_divzero, if TRACE_ERROR then printerror else nextchar;
-- divzero: errcode <= err_divzero, if TRACE_ERROR then printerror else nextchar;
8 => X"64_69_76_7A_65_72_6F_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_64_69_76_7A_65_72_6F_2C",

-- L0228@0009.printerror:  emit(char_E);
-- printerror: emit(char_E);
9 => X"70_72_69_6E_74_65_72_72_6F_72_3A_20_65_6D_69_74_28_63_68_61_72_5F_45_29_3B_20_20_20_20_20_20_20",

-- L0229@000A.  emit(char_R);
-- emit(char_R);
10 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0230@000B.  emit(char_R);
-- emit(char_R);
11 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0231@000C.  emit(errcode);
-- emit(errcode);
12 => X"65_6D_69_74_28_65_72_72_63_6F_64_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0232@000D.  emit(char_space);
-- emit(char_space);
13 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0233@000E.  emit(inp1);
-- emit(inp1);
14 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0234@000F.  emit(inp0);
-- emit(inp0);
15 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0235@0010.  print_crlf();
-- print_crlf();
16 => X"70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0240@0011.nextchar:  STATUS = done, if false then next else deadloop;
-- nextchar: STATUS = done, if false then next else deadloop;
17 => X"6E_65_78_74_63_68_61_72_3A_20_53_54_41_54_55_53_20_3D_20_64_6F_6E_65_2C_20_69_66_20_66_61_6C_73",

-- L0245@0012.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
18 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0246@0013.  if false then next else exec;
-- if false then next else exec;
19 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0251@0014.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
20 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0256@0015.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
21 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0257@0016.exec:  z_flags <= set, div2(max);
-- exec: z_flags <= set, div2(max);
22 => X"65_78_65_63_3A_20_7A_5F_66_6C_61_67_73_20_3C_3D_20_73_65_74_2C_20_64_69_76_32_28_6D_61_78_29_3B",

-- L0258@0017.  if false then next else nextchar;
-- if false then next else nextchar;
23 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65_78_74_63_68_61_72",

-- L0262@0018.plus:  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- plus: c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
24 => X"70_6C_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0263@0019.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD;
25 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0264@001A.pm:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- pm: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
26 => X"70_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43",

-- L0265@001B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC, if false then next else exec;
27 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0269@001C.minus:  c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- minus: c_flag <= one, STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
28 => X"6D_69_6E_75_73_3A_20_63_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20_3D_20_62",

-- L0270@001D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
29 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0271@001E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, if false then next else pm;
30 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0275@001F.div:  prep_regs(max);
-- div: prep_regs(max);
31 => X"64_69_76_3A_20_70_72_65_70_5F_72_65_67_73_28_6D_61_78_29_3B_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0276@0020.  if z_flagtos_is_set then divzero;
-- if z_flagtos_is_set then divzero;
32 => X"69_66_20_7A_5F_66_6C_61_67_74_6F_73_5F_69_73_5F_73_65_74_20_74_68_65_6E_20_64_69_76_7A_65_72_6F",

-- L0278@0021.div_loop:  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- div_loop: STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
33 => X"64_69_76_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0279@0022.  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
34 => X"64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0280@0023.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0;
35 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0281@0024.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
36 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0282@0025.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 1;
37 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0283@0026.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 0;
38 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0284@0027.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
39 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0288@0028.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 9;
40 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0289@0029.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, a_pm_m(one);
41 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0290@002A.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 9 , MT_COL = 0xD;
42 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0292@002B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if c_flag_is_set then next else restore_a;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if c_flag_is_set then next else restore_a;
43 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0305@002C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
44 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0306@002D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 1;
45 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0308@002E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0;
46 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0309@002F.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1;
47 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0310@0030.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
48 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0311@0031.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 1;
49 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0312@0032.  STATUS = busy_using_mt, opr = d2_d2_np;
-- STATUS = busy_using_mt, opr = d2_d2_np;
50 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_64_32",

-- L0313@0033.  d_flag <= one;
-- d_flag <= one;
51 => X"64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0314@0034.  STATUS = busy_using_mt, opr = m2_m2_np;
-- STATUS = busy_using_mt, opr = m2_m2_np;
52 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0315@0035.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop();
53 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0316@0036.  if button then next else repeat;
-- if button then next else repeat;
54 => X"69_66_20_62_75_74_74_6F_6E_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61_74_3B",

-- L0317@0037.  if false then next else div_next;
-- if false then next else div_next;
55 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_64_69_76_5F_6E_65_78_74",

-- L0320@0038.restore_a:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
-- restore_a: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xD, a_pm_m(zero);
56 => X"72_65_73_74_6F_72_65_5F_61_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0321@0039.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 0xD;
57 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0323@003A.div_next:  if loopcnt_is_zero then nextchar;
-- div_next: if loopcnt_is_zero then nextchar;
58 => X"64_69_76_5F_6E_65_78_74_3A_20_69_66_20_6C_6F_6F_70_63_6E_74_5F_69_73_5F_7A_65_72_6F_20_74_68_65",

-- L0324@003B.  loopcnt <= dec, if false then next else div_loop;
-- loopcnt <= dec, if false then next else div_loop;
59 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0356@003C.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- enter: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
60 => X"65_6E_74_65_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0357@003D.  if false then next else exec;
-- if false then next else exec;
61 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0361@003E.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
62 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0364@003F.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
63 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0367@0040.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
64 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0370@0041.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
65 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0373@0042.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
66 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0376@0043.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
67 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0379@0044.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
68 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0382@0045.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
69 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0385@0046.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
70 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0388@0047.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
71 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0392@0048.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
72 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0396@0049.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
73 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0400@004A.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
74 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0404@004B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
75 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0408@004C.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
76 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0412@004D.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
77 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0413@004E.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- hexchar: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
78 => X"68_65_78_63_68_61_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C",

-- L0414@004F.  bitcnt <= load, MT_COL = 3;
-- bitcnt <= load, MT_COL = 3;
79 => X"62_69_74_63_6E_74_20_3C_3D_20_6C_6F_61_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_3B_20_20_20_20_20",

-- L0415@0050.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
80 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0416@0051.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
-- STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
81 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0417@0052.  bitcnt <= load, MT_COL = 3;
-- bitcnt <= load, MT_COL = 3;
82 => X"62_69_74_63_6E_74_20_3C_3D_20_6C_6F_61_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_3B_20_20_20_20_20",

-- L0418@0053.  STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
-- STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
83 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0421@0054.a_pm_m:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- a_pm_m: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
84 => X"61_5F_70_6D_5F_6D_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0422@0055.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, div2(max);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, z_flags <= set, div2(max);
85 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0423@0056.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if true then return else return;
86 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0427@0057.prep_regs:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- prep_regs: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
87 => X"70_72_65_70_5F_72_65_67_73_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D",

-- L0429@0058.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
88 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0430@0059.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, z_flags <= set, div2(max);
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, z_flags <= set, div2(max);
89 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0431@005A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
90 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0432@005B.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7, if true then return else return;
91 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0435@005C.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
-- div2: STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
92 => X"64_69_76_32_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70",

-- L0436@005D.  bitcnt <= dec, if false then next else div2;
-- bitcnt <= dec, if false then next else div2;
93 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0439@005E.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_swap: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
94 => X"6D_61_74_72_69_78_5F_73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0440@005F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
95 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0443@0060.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- matrix_nop1: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
96 => X"6D_61_74_72_69_78_5F_6E_6F_70_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0444@0061.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
-- matrix_nop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
97 => X"6D_61_74_72_69_78_5F_6E_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0445@0062.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
98 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0446@0063.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
99 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0447@0064.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
100 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0448@0065.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
101 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0449@0066.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
102 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0452@0067.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_push: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
103 => X"6D_61_74_72_69_78_5F_70_75_73_68_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0453@0068.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
104 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0454@0069.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
105 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0455@006A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
106 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0456@006B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
107 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0457@006C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
108 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0458@006D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
109 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0461@006E.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
-- matrix_pop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
110 => X"6D_61_74_72_69_78_5F_70_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0462@006F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
111 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0463@0070.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
112 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0464@0071.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
113 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0465@0072.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
114 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0466@0073.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
115 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0468@0074.trace:  if TRACE_CHAR then next else return;
-- trace: if TRACE_CHAR then next else return;
116 => X"74_72_61_63_65_3A_20_69_66_20_54_52_41_43_45_5F_43_48_41_52_20_74_68_65_6E_20_6E_65_78_74_20_65",

-- L0471@0075.  emit(inp1);
-- emit(inp1);
117 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0472@0076.  emit(inp0);
-- emit(inp0);
118 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0474@0077.print_crlf:  emit(char_cr);
-- print_crlf: emit(char_cr);
119 => X"70_72_69_6E_74_5F_63_72_6C_66_3A_20_65_6D_69_74_28_63_68_61_72_5F_63_72_29_3B_20_20_20_20_20_20",

-- L0475@0078.  TXDCHAR <= char_lf;
-- TXDCHAR <= char_lf;
120 => X"54_58_44_43_48_41_52_20_3C_3D_20_63_68_61_72_5F_6C_66_3B_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0477@0079.emit:  if TXDREADY then next else repeat;
-- emit: if TXDREADY then next else repeat;
121 => X"65_6D_69_74_3A_20_69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65",

-- L0478@007A.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
122 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0479@007B.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
123 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0480@007C.  if TXDSEND then return else return;
-- if TXDSEND then return else return;
124 => X"69_66_20_54_58_44_53_45_4E_44_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75",

125 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

126 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

127 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20");

end hexcalc_sym;

