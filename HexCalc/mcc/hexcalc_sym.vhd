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

-- L0203@0000._reset:  MT_CTRL = clear, errcode <= ok;
-- _reset: MT_CTRL = clear, errcode <= ok;
0 => X"5F_72_65_73_65_74_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64_65",

-- L0205@0001._reset1:  MT_CTRL = clear, errcode <= ok;
-- _reset1: MT_CTRL = clear, errcode <= ok;
1 => X"5F_72_65_73_65_74_31_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0207@0002._reset2:  MT_CTRL = clear, errcode <= ok;
-- _reset2: MT_CTRL = clear, errcode <= ok;
2 => X"5F_72_65_73_65_74_32_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0209@0003._reset3:  MT_CTRL = clear, errcode <= ok;
-- _reset3: MT_CTRL = clear, errcode <= ok;
3 => X"5F_72_65_73_65_74_33_3A_20_4D_54_5F_43_54_52_4C_20_3D_20_63_6C_65_61_72_2C_20_65_72_72_63_6F_64",

-- L0213@0004.deadloop:  STATUS = ready, if input_is_zero then repeat else next;
-- deadloop: STATUS = ready, if input_is_zero then repeat else next;
4 => X"64_65_61_64_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_72_65_61_64_79_2C_20_69_66_20_69_6E_70",

-- L0214@0005.  trace();
-- trace();
5 => X"74_72_61_63_65_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0215@0006.  if true then fork else fork;
-- if true then fork else fork;
6 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_66_6F_72_6B_20_65_6C_73_65_20_66_6F_72_6B_3B_20_20_20_20",

-- L0218@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
-- badchar: errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
7 => X"62_61_64_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63_68_61_72_2C",

-- L0219@0008.printerror:  emit(char_E);
-- printerror: emit(char_E);
8 => X"70_72_69_6E_74_65_72_72_6F_72_3A_20_65_6D_69_74_28_63_68_61_72_5F_45_29_3B_20_20_20_20_20_20_20",

-- L0220@0009.  emit(char_R);
-- emit(char_R);
9 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0221@000A.  emit(char_R);
-- emit(char_R);
10 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0222@000B.  emit(errcode);
-- emit(errcode);
11 => X"65_6D_69_74_28_65_72_72_63_6F_64_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0223@000C.  emit(char_space);
-- emit(char_space);
12 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0224@000D.  emit(inp1);
-- emit(inp1);
13 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0225@000E.  emit(inp0);
-- emit(inp0);
14 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0226@000F.  print_crlf();
-- print_crlf();
15 => X"70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0231@0010.nextchar:  STATUS = done, if false then next else deadloop;
-- nextchar: STATUS = done, if false then next else deadloop;
16 => X"6E_65_78_74_63_68_61_72_3A_20_53_54_41_54_55_53_20_3D_20_64_6F_6E_65_2C_20_69_66_20_66_61_6C_73",

-- L0236@0011.  STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
-- STATUS = busy_using_mt, MT_CTRL = clear, matrix_swap();
17 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0237@0012.  if false then next else exec;
-- if false then next else exec;
18 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0242@0013.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, if false then next else exec;
19 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0247@0014.  errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- errcode <= ok, STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
20 => X"65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0248@0015.exec:  z_flags <= set, bitcnt <= max, div2();
-- exec: z_flags <= set, bitcnt <= max, div2();
21 => X"65_78_65_63_3A_20_7A_5F_66_6C_61_67_73_20_3C_3D_20_73_65_74_2C_20_62_69_74_63_6E_74_20_3C_3D_20",

-- L0249@0016.  if false then next else nextchar;
-- if false then next else nextchar;
22 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65_78_74_63_68_61_72",

-- L0253@0017.plus:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- plus: STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
23 => X"70_6C_75_73_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54",

-- L0254@0018.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
24 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0255@0019.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
25 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0256@001A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD, c_flag <= zero, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0xD, c_flag <= zero, if false then next else exec;
26 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0260@001B.minus:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
-- minus: STATUS = busy_using_mt, MT_CTRL = clear, matrix_pop();
27 => X"6D_69_6E_75_73_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0261@001C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0;
28 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0262@001D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xC;
29 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0263@001E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 9;
30 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0264@001F.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, c_flag <= one, if false then next else exec;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 9 , MT_COL = 0xD, c_flag <= one, if false then next else exec;
31 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0268@0020.mul:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- mul: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
32 => X"6D_75_6C_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F",

-- L0271@0021.  loopcnt <= max, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
-- loopcnt <= max, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 7 , MT_COL = 7;
33 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0272@0022.  bitcnt <= max, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2();
-- bitcnt <= max, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 7, div2();
34 => X"62_69_74_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0273@0023.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7;
35 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0274@0024.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 7;
36 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0277@0025.m_loop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
-- m_loop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 8;
37 => X"6D_5F_6C_6F_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20",

-- L0278@0026.  STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
-- STATUS = busy_using_mt, opr = np_d2_d2, d_flag <= column;
38 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0279@0027.  STATUS = busy_using_mt, opr = np_m2_m2;
-- STATUS = busy_using_mt, opr = np_m2_m2;
39 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0280@0028.  c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
-- c_flag <= zero, STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 8, if d_flag_is_set then m_add_r7 else m_shift0;
40 => X"63_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73",

-- L0283@0029.m_add_r7:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
-- m_add_r7: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 0xC;
41 => X"6D_5F_61_64_64_5F_72_37_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74",

-- L0284@002A.m_add:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
-- m_add: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 0xD;
42 => X"6D_5F_61_64_64_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0285@002B.  bitcnt <= max, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2();
-- bitcnt <= max, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xB , MT_COL = 0, div2();
43 => X"62_69_74_63_6E_74_20_3C_3D_20_6D_61_78_2C_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69",

-- L0286@002C.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0xB , MT_COL = 0, if c_flag_is_set then m_shift1;
44 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0289@002D.m_shift0:  d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
-- m_shift0: d_flag <= zero, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1, if false then next else m_shift;
45 => X"6D_5F_73_68_69_66_74_30_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_7A_65_72_6F_2C_20_53_54_41_54_55_53",

-- L0290@002E.m_shift1:  d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- m_shift1: d_flag <= one, STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
46 => X"6D_5F_73_68_69_66_74_31_3A_20_64_5F_66_6C_61_67_20_3C_3D_20_6F_6E_65_2C_20_53_54_41_54_55_53_20",

-- L0291@002F.m_shift:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
-- m_shift: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 8 , MT_COL = 0;
47 => X"6D_5F_73_68_69_66_74_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C",

-- L0292@0030.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 1 , MT_COL = 1, opr = d2_d2_np;
48 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0295@0031.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 0 , MT_COL = 1;
49 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0296@0032.  STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = off, MT_ROW = 8 , MT_COL = 0;
50 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0297@0033.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then nextchar;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1, if loopcnt_is_zero then nextchar;
51 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0298@0034.  loopcnt <= dec, if false then next else m_loop;
-- loopcnt <= dec, if false then next else m_loop;
52 => X"6C_6F_6F_70_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65",

-- L0302@0035.enter:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
-- enter: STATUS = busy_using_mt, MT_CTRL = clear, matrix_push();
53 => X"65_6E_74_65_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D",

-- L0303@0036.  if false then next else exec;
-- if false then next else exec;
54 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_65_78_65_63_3B_20_20_20",

-- L0307@0037.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0000, if false then next else hexchar;
55 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0310@0038.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1000, if false then next else hexchar;
56 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0313@0039.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0100, if false then next else hexchar;
57 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0316@003A.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1100, if false then next else hexchar;
58 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0319@003B.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0010, if false then next else hexchar;
59 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0322@003C.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1010, if false then next else hexchar;
60 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0325@003D.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0110, if false then next else hexchar;
61 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0328@003E.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1110, if false then next else hexchar;
62 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0331@003F.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0001, if false then next else hexchar;
63 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0334@0040.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1001, if false then next else hexchar;
64 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0338@0041.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0101, if false then next else hexchar;
65 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0342@0042.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1101, if false then next else hexchar;
66 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0346@0043.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0011, if false then next else hexchar;
67 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0350@0044.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1011, if false then next else hexchar;
68 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0354@0045.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b0111, if false then next else hexchar;
69 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0358@0046.  opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
-- opr = np_np_ld, MT_ROW = 0b0000, MT_COL = 0b1111;
70 => X"6F_70_72_20_3D_20_6E_70_5F_6E_70_5F_6C_64_2C_20_4D_54_5F_52_4F_57_20_3D_20_30_62_30_30_30_30_2C",

-- L0359@0047.hexchar:  STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
-- hexchar: STATUS = busy_using_mt, MT_CTRL = clear, matrix_nop1();
71 => X"68_65_78_63_68_61_72_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C",

-- L0360@0048.  bitcnt <= load, MT_COL = 3;
-- bitcnt <= load, MT_COL = 3;
72 => X"62_69_74_63_6E_74_20_3C_3D_20_6C_6F_61_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_3B_20_20_20_20_20",

-- L0361@0049.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0xD , MT_COL = 0;
73 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0362@004A.  STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
-- STATUS = busy_using_mt, opr = m2_d2_d2, bitcnt <= dec, if bitcnt_is_zero then next else repeat;
74 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6D_32",

-- L0363@004B.  bitcnt <= load, MT_COL = 3;
-- bitcnt <= load, MT_COL = 3;
75 => X"62_69_74_63_6E_74_20_3C_3D_20_6C_6F_61_64_2C_20_4D_54_5F_43_4F_4C_20_3D_20_33_3B_20_20_20_20_20",

-- L0364@004C.  STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
-- STATUS = busy_using_mt, opr = np_m2_m2, bitcnt <= dec, if bitcnt_is_zero then nextchar else repeat;
76 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70_72_20_3D_20_6E_70",

-- L0368@004D.div2:  STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
-- div2: STATUS = busy_using_mt, opr = d2_d2_d2, c_flag <= adder, z_flags <= update, if bitcnt_is_zero then return;
77 => X"64_69_76_32_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_6F_70",

-- L0369@004E.  bitcnt <= dec, if false then next else div2;
-- bitcnt <= dec, if false then next else div2;
78 => X"62_69_74_63_6E_74_20_3C_3D_20_64_65_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0372@004F.matrix_swap:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_swap: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
79 => X"6D_61_74_72_69_78_5F_73_77_61_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0373@0050.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 0, if false then next else matrix_nop;
80 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0376@0051.matrix_nop1:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
-- matrix_nop1: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 1;
81 => X"6D_61_74_72_69_78_5F_6E_6F_70_31_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0377@0052.matrix_nop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
-- matrix_nop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 2;
82 => X"6D_61_74_72_69_78_5F_6E_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0378@0053.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 3;
83 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0379@0054.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 4;
84 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0380@0055.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 5;
85 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0381@0056.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 6;
86 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0382@0057.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 7, if true then return else return;
87 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0385@0058.matrix_push:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
-- matrix_push: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 0 , MT_COL = 1;
88 => X"6D_61_74_72_69_78_5F_70_75_73_68_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67",

-- L0386@0059.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 1 , MT_COL = 2;
89 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0387@005A.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 3;
90 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0388@005B.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 4;
91 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0389@005C.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 5;
92 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0390@005D.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 6;
93 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0391@005E.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 7, if true then return else return;
94 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0394@005F.matrix_pop:  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
-- matrix_pop: STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 2 , MT_COL = 1;
95 => X"6D_61_74_72_69_78_5F_70_6F_70_3A_20_53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F",

-- L0395@0060.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 3 , MT_COL = 2;
96 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0396@0061.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 4 , MT_COL = 3;
97 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0397@0062.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 5 , MT_COL = 4;
98 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0398@0063.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 6 , MT_COL = 5;
99 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0399@0064.  STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
-- STATUS = busy_using_mt, MT_CTRL = on, MT_ROW = 7 , MT_COL = 6, if true then return else return;
100 => X"53_54_41_54_55_53_20_3D_20_62_75_73_79_5F_75_73_69_6E_67_5F_6D_74_2C_20_4D_54_5F_43_54_52_4C_20",

-- L0401@0065.trace:  if TRACE_CHAR then next else return;
-- trace: if TRACE_CHAR then next else return;
101 => X"74_72_61_63_65_3A_20_69_66_20_54_52_41_43_45_5F_43_48_41_52_20_74_68_65_6E_20_6E_65_78_74_20_65",

-- L0402@0066.  emit(char_I);
-- emit(char_I);
102 => X"65_6D_69_74_28_63_68_61_72_5F_49_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0403@0067.  emit(char_EQU);
-- emit(char_EQU);
103 => X"65_6D_69_74_28_63_68_61_72_5F_45_51_55_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0404@0068.  emit(inp1);
-- emit(inp1);
104 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0405@0069.  emit(inp0);
-- emit(inp0);
105 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0407@006A.print_crlf:  emit(char_cr);
-- print_crlf: emit(char_cr);
106 => X"70_72_69_6E_74_5F_63_72_6C_66_3A_20_65_6D_69_74_28_63_68_61_72_5F_63_72_29_3B_20_20_20_20_20_20",

-- L0408@006B.  emit(char_lf);
-- emit(char_lf);
107 => X"65_6D_69_74_28_63_68_61_72_5F_6C_66_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0409@006C.  if true then return else return;
-- if true then return else return;
108 => X"69_66_20_74_72_75_65_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75_72_6E_3B",

-- L0411@006D.emit:  if TXDREADY then next else repeat;
-- emit: if TXDREADY then next else repeat;
109 => X"65_6D_69_74_3A_20_69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65",

-- L0412@006E.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
110 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0413@006F.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
111 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0414@0070.  if TXDSEND then return else return;
-- if TXDSEND then return else return;
112 => X"69_66_20_54_58_44_53_45_4E_44_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75",

113 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

114 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

115 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

116 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

117 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

118 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

119 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

120 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

121 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

122 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

123 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

124 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

125 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

126 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

127 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20");

end hexcalc_sym;

