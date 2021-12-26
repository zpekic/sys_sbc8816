--------------------------------------------------------
-- mcc V1.0.0926 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'symbol_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package hex2mem_sym is

-- memory block size
constant SYMBOL_DATA_WIDTH: 	positive := 256;
constant SYMBOL_ADDRESS_WIDTH: 	positive := 7;
constant SYMBOL_ADDRESS_LAST: 	positive := 127;
constant SYMBOL_BYTE_LAST: 	positive := 31;
constant SYMBOL_BYTE_WIDTH: positive := 5;


type t_h2m_symbol_entry is array(0 to SYMBOL_ADDRESS_LAST) of std_logic_vector(SYMBOL_DATA_WIDTH -1 downto 0);
type t_h2m_symbol_byte is array(0 to(SYMBOL_ADDRESS_LAST + 1) * (SYMBOL_BYTE_LAST + 1) - 1) of std_logic_vector(7 downto 0);


signal h2m_symbol_byte: t_h2m_symbol_byte;
signal h2m_sym_d: std_logic_vector(7 downto 0);
signal h2m_sym_a: std_logic_vector(SYMBOL_ADDRESS_WIDTH + SYMBOL_BYTE_WIDTH - 1 downto 0);
----Start boilerplate code(use with utmost caution!)
-- h2m_sym_a <= -- TODO concatenate microinstruction address and character address
-- h2m_sym_d <= h2m_symbol_byte(to_integer(unsigned(h2m_sym_a)));
----convert symbol entries to byte-oriented ROM
--gen_r: for r in 0 to SYMBOL_ADDRESS_LAST generate
--begin
--    gen_c: for c in 0 to SYMBOL_BYTE_LAST generate
--   begin
--           --assert false report "r = " & integer'image(r) & " c = " & integer'image(c) severity note;
--           h2m_symbol_byte(r * (SYMBOL_BYTE_LAST + 1) + c) <= h2m_symbol_entry(r)(SYMBOL_DATA_WIDTH - 8 * c - 1 downto SYMBOL_DATA_WIDTH - 8 * (c + 1));
--   end generate;
--end generate;
----End boilerplate code






constant h2m_symbol_entry: t_h2m_symbol_entry := (

-- L0195@0000._reset:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
0 => X"5F_72_65_73_65_74_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64_65",

-- L0197@0001._reset1:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset1: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
1 => X"5F_72_65_73_65_74_31_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64",

-- L0199@0002._reset2:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset2: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
2 => X"5F_72_65_73_65_74_32_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64",

-- L0201@0003._reset3:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
-- _reset3: TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
3 => X"5F_72_65_73_65_74_33_3A_20_54_58_44_43_48_41_52_20_3C_3D_20_7A_65_72_6F_2C_20_65_72_72_63_6F_64",

-- L0205@0004.deadloop:  BUSY = 0, if input_is_zero then repeat else next;
-- deadloop: BUSY = 0, if input_is_zero then repeat else next;
4 => X"64_65_61_64_6C_6F_6F_70_3A_20_42_55_53_59_20_3D_20_30_2C_20_69_66_20_69_6E_70_75_74_5F_69_73_5F",

-- L0206@0005.  trace();
-- trace();
5 => X"74_72_61_63_65_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0207@0006.  poscnt_cin = 1, if true then fork else fork;
-- poscnt_cin = 1, if true then fork else fork;
6 => X"70_6F_73_63_6E_74_5F_63_69_6E_20_3D_20_31_2C_20_69_66_20_74_72_75_65_20_74_68_65_6E_20_66_6F_72",

-- L0210@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
-- badchar: errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
7 => X"62_61_64_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63_68_61_72_2C",

-- L0211@0008.badcolon:  errcode <= err_unexpected, if TRACE_ERROR then printerror else nextchar;
-- badcolon: errcode <= err_unexpected, if TRACE_ERROR then printerror else nextchar;
8 => X"62_61_64_63_6F_6C_6F_6E_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_75_6E_65_78_70_65_63",

-- L0212@0009.badchecksum:  errcode <= err_badchecksum, if TRACE_ERROR then printerror else nextchar;
-- badchecksum: errcode <= err_badchecksum, if TRACE_ERROR then printerror else nextchar;
9 => X"62_61_64_63_68_65_63_6B_73_75_6D_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_63",

-- L0213@000A.badtype:  errcode <= err_badrecordtype, if TRACE_ERROR then printerror else nextchar;
-- badtype: errcode <= err_badrecordtype, if TRACE_ERROR then printerror else nextchar;
10 => X"62_61_64_74_79_70_65_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_72_65_63_6F_72",

-- L0214@000B.badlength:  errcode <= err_badrecordlength,if TRACE_ERROR then printerror else nextchar;
-- badlength: errcode <= err_badrecordlength,if TRACE_ERROR then printerror else nextchar;
11 => X"62_61_64_6C_65_6E_67_74_68_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_62_61_64_72_65_63",

-- L0215@000C.badhex:  errcode <= err_unexpected, if TRACE_ERROR then next else nextchar;
-- badhex: errcode <= err_unexpected, if TRACE_ERROR then next else nextchar;
12 => X"62_61_64_68_65_78_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_65_72_72_5F_75_6E_65_78_70_65_63_74_65",

-- L0216@000D.printerror:  emit(char_E);
-- printerror: emit(char_E);
13 => X"70_72_69_6E_74_65_72_72_6F_72_3A_20_65_6D_69_74_28_63_68_61_72_5F_45_29_3B_20_20_20_20_20_20_20",

-- L0217@000E.  emit(char_R);
-- emit(char_R);
14 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0218@000F.  emit(char_R);
-- emit(char_R);
15 => X"65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0219@0010.  emit(errcode);
-- emit(errcode);
16 => X"65_6D_69_74_28_65_72_72_63_6F_64_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0220@0011.  emit(char_space);
-- emit(char_space);
17 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0221@0012.  emit(lin_chk3);
-- emit(lin_chk3);
18 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_33_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0222@0013.  emit(lin_chk2);
-- emit(lin_chk2);
19 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_32_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0223@0014.  emit(lin_chk1);
-- emit(lin_chk1);
20 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0224@0015.  emit(lin_chk0);
-- emit(lin_chk0);
21 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0225@0016.  emit(char_space);
-- emit(char_space);
22 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0226@0017.  emit(pos_ram1);
-- emit(pos_ram1);
23 => X"65_6D_69_74_28_70_6F_73_5F_72_61_6D_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0227@0018.  emit(pos_ram0);
-- emit(pos_ram0);
24 => X"65_6D_69_74_28_70_6F_73_5F_72_61_6D_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0228@0019.  emit(char_space);
-- emit(char_space);
25 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0229@001A.  emit(inp1);
-- emit(inp1);
26 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0230@001B.  hexcnt <= ptr_colon, emit(inp0);
-- hexcnt <= ptr_colon, emit(inp0);
27 => X"68_65_78_63_6E_74_20_3C_3D_20_70_74_72_5F_63_6F_6C_6F_6E_2C_20_65_6D_69_74_28_69_6E_70_30_29_3B",

-- L0231@001C.  print_crlf();
-- print_crlf();
28 => X"70_72_69_6E_74_5F_63_72_6C_66_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0233@001D.nextchar:  errcode <= ok, input_reset = 1, if false then next else deadloop;
-- nextchar: errcode <= ok, input_reset = 1, if false then next else deadloop;
29 => X"6E_65_78_74_63_68_61_72_3A_20_65_72_72_63_6F_64_65_20_3C_3D_20_6F_6B_2C_20_69_6E_70_75_74_5F_72",

-- L0235@001E.printramR:  emit(char_R);
-- printramR: emit(char_R);
30 => X"70_72_69_6E_74_72_61_6D_52_3A_20_65_6D_69_74_28_63_68_61_72_5F_52_29_3B_20_20_20_20_20_20_20_20",

-- L0237@001F.printram:  emit(char_EQU);
-- printram: emit(char_EQU);
31 => X"70_72_69_6E_74_72_61_6D_3A_20_65_6D_69_74_28_63_68_61_72_5F_45_51_55_29_3B_20_20_20_20_20_20_20",

-- L0238@0020.  emit(pos_ram1);
-- emit(pos_ram1);
32 => X"65_6D_69_74_28_70_6F_73_5F_72_61_6D_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0239@0021.  emit(pos_ram0);
-- emit(pos_ram0);
33 => X"65_6D_69_74_28_70_6F_73_5F_72_61_6D_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0241@0022.print_crlf:  emit(char_cr);
-- print_crlf: emit(char_cr);
34 => X"70_72_69_6E_74_5F_63_72_6C_66_3A_20_65_6D_69_74_28_63_68_61_72_5F_63_72_29_3B_20_20_20_20_20_20",

-- L0242@0023.  TXDCHAR <= char_lf, if false then next else emit;
-- TXDCHAR <= char_lf, if false then next else emit;
35 => X"54_58_44_43_48_41_52_20_3C_3D_20_63_68_61_72_5F_6C_66_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65",

-- L0244@0024.printaddr:  emit(addr3);
-- printaddr: emit(addr3);
36 => X"70_72_69_6E_74_61_64_64_72_3A_20_65_6D_69_74_28_61_64_64_72_33_29_3B_20_20_20_20_20_20_20_20_20",

-- L0245@0025.  emit(addr2);
-- emit(addr2);
37 => X"65_6D_69_74_28_61_64_64_72_32_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0246@0026.  emit(addr1);
-- emit(addr1);
38 => X"65_6D_69_74_28_61_64_64_72_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0247@0027.  TXDCHAR <= addr0, if false then next else emit;
-- TXDCHAR <= addr0, if false then next else emit;
39 => X"54_58_44_43_48_41_52_20_3C_3D_20_61_64_64_72_30_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20",

40 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

41 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

42 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

43 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

44 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

45 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

46 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

47 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0252@0030.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
48 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0256@0031.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
49 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0260@0032.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
50 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0264@0033.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
51 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0268@0034.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
52 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0272@0035.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
53 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0276@0036.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
54 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0280@0037.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
55 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0284@0038.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
56 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0288@0039.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
57 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0293@003A.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
58 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0298@003B.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
59 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0303@003C.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
60 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0308@003D.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
61 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0313@003E.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
-- ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
62 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0318@003F.  ram_write = 1, ram_addr = bytecnt;
-- ram_write = 1, ram_addr = bytecnt;
63 => X"72_61_6D_5F_77_72_69_74_65_20_3D_20_31_2C_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E",

-- L0319@0040.hexchar:  if bytecnt_at_colon then badhex;
-- hexchar: if bytecnt_at_colon then badhex;
64 => X"68_65_78_63_68_61_72_3A_20_69_66_20_62_79_74_65_63_6E_74_5F_61_74_5F_63_6F_6C_6F_6E_20_74_68_65",

-- L0320@0041.  if hexcnt_is_odd then next else dontadd;
-- if hexcnt_is_odd then next else dontadd;
65 => X"69_66_20_68_65_78_63_6E_74_5F_69_73_5F_6F_64_64_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20",

-- L0321@0042.  ram_addr = bytecnt, checksum <= add_ram;
-- ram_addr = bytecnt, checksum <= add_ram;
66 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_63_68_65_63_6B_73_75_6D_20_3C_3D_20",

-- L0322@0043.dontadd:  hexcnt <= inc, if false then next else nextchar;
-- dontadd: hexcnt <= inc, if false then next else nextchar;
67 => X"64_6F_6E_74_61_64_64_3A_20_68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_69_66_20_66_61_6C_73_65",

-- L0325@0044.  if prev_is_crorlf then nextchar else newline;
-- if prev_is_crorlf then nextchar else newline;
68 => X"69_66_20_70_72_65_76_5F_69_73_5F_63_72_6F_72_6C_66_20_74_68_65_6E_20_6E_65_78_74_63_68_61_72_20",

-- L0328@0045.  if prev_is_crorlf then nextchar else next;
-- if prev_is_crorlf then nextchar else next;
69 => X"69_66_20_70_72_65_76_5F_69_73_5F_63_72_6F_72_6C_66_20_74_68_65_6E_20_6E_65_78_74_63_68_61_72_20",

-- L0329@0046.newline:  compa = checksum_lsb, compb = zero, if compa_equals_compb then next else badchecksum;
-- newline: compa = checksum_lsb, compb = zero, if compa_equals_compb then next else badchecksum;
70 => X"6E_65_77_6C_69_6E_65_3A_20_63_6F_6D_70_61_20_3D_20_63_68_65_63_6B_73_75_6D_5F_6C_73_62_2C_20_63",

-- L0330@0047.  poscnt_a = zero, lincnt_cin = 1, if hexcnt_is_odd then badhex else next;
-- poscnt_a = zero, lincnt_cin = 1, if hexcnt_is_odd then badhex else next;
71 => X"70_6F_73_63_6E_74_5F_61_20_3D_20_7A_65_72_6F_2C_20_6C_69_6E_63_6E_74_5F_63_69_6E_20_3D_20_31_2C",

-- L0331@0048.  ram_addr = ptr_type, compa = ram, compb = one, if compa_equals_compb then lastrec;
-- ram_addr = ptr_type, compa = ram, compb = one, if compa_equals_compb then lastrec;
72 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_74_79_70_65_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D",

-- L0332@0049.  ram_addr = ptr_type, compa = ram, compb = zero, if compa_equals_compb then next else badtype;
-- ram_addr = ptr_type, compa = ram, compb = zero, if compa_equals_compb then next else badtype;
73 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_74_79_70_65_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D",

-- L0333@004A.  ram_addr = ptr_len, compa = ram, compb = bytecnt_dec, if compa_equals_compb then next else badlength;
-- ram_addr = ptr_len, compa = ram, compb = bytecnt_dec, if compa_equals_compb then next else badlength;
74 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_6C_65_6E_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D_2C",

-- L0335@004B.  ram_addr = ptr_addr_hi, address <= shift8ram, hexcnt <= zero;
-- ram_addr = ptr_addr_hi, address <= shift8ram, hexcnt <= zero;
75 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_61_64_64_72_5F_68_69_2C_20_61_64_64_72_65_73_73_20",

-- L0336@004C.  ram_addr = ptr_addr_lo, address <= shift8ram, hexcnt <= zero;
-- ram_addr = ptr_addr_lo, address <= shift8ram, hexcnt <= zero;
76 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_61_64_64_72_5F_6C_6F_2C_20_61_64_64_72_65_73_73_20",

-- L0338@004D.writeloop:  ram_addr = ptr_len, compa = ram, compb = bytecnt, if compa_equals_compb then nextrec;
-- writeloop: ram_addr = ptr_len, compa = ram, compb = bytecnt, if compa_equals_compb then nextrec;
77 => X"77_72_69_74_65_6C_6F_6F_70_3A_20_72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_6C_65_6E_2C_20_63",

-- L0341@004E.writemem:  ram_addr = bytecnt, nBUSREQ = 0;
-- writemem: ram_addr = bytecnt, nBUSREQ = 0;
78 => X"77_72_69_74_65_6D_65_6D_3A_20_72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42",

-- L0342@004F.  ram_addr = bytecnt, nBUSREQ = 0, if nBUSACK then repeat else next;
-- ram_addr = bytecnt, nBUSREQ = 0, if nBUSACK then repeat else next;
79 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42_55_53_52_45_51_20_3D_20_30_2C",

-- L0343@0050.  ram_addr = bytecnt, nBUSREQ = 0, nWR = 0;
-- ram_addr = bytecnt, nBUSREQ = 0, nWR = 0;
80 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42_55_53_52_45_51_20_3D_20_30_2C",

-- L0344@0051.  ram_addr = bytecnt, nBUSREQ = 0, nWR = 0, if nWAIT then next else repeat;
-- ram_addr = bytecnt, nBUSREQ = 0, nWR = 0, if nWAIT then next else repeat;
81 => X"72_61_6D_5F_61_64_64_72_20_3D_20_62_79_74_65_63_6E_74_2C_20_6E_42_55_53_52_45_51_20_3D_20_30_2C",

-- L0346@0052.  if TRACE_WRITE then next else nextaddr;
-- if TRACE_WRITE then next else nextaddr;
82 => X"69_66_20_54_52_41_43_45_5F_57_52_49_54_45_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_6E_65",

-- L0347@0053.  emit(char_A);
-- emit(char_A);
83 => X"65_6D_69_74_28_63_68_61_72_5F_41_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0348@0054.  emit(char_open);
-- emit(char_open);
84 => X"65_6D_69_74_28_63_68_61_72_5F_6F_70_65_6E_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0349@0055.  printaddr();
-- printaddr();
85 => X"70_72_69_6E_74_61_64_64_72_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0350@0056.  emit(char_close);
-- emit(char_close);
86 => X"65_6D_69_74_28_63_68_61_72_5F_63_6C_6F_73_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0351@0057.  printram();
-- printram();
87 => X"70_72_69_6E_74_72_61_6D_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0353@0058.nextaddr:  hexcnt <= inc;
-- nextaddr: hexcnt <= inc;
88 => X"6E_65_78_74_61_64_64_72_3A_20_68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20",

-- L0354@0059.  hexcnt <= inc, address <= inc, if false then next else writeloop;
-- hexcnt <= inc, address <= inc, if false then next else writeloop;
89 => X"68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_61_64_64_72_65_73_73_20_3C_3D_20_69_6E_63_2C_20_69",

-- L0356@005A.lastrec:  lincnt_a = zero, if resetout_done then next else next;
-- lastrec: lincnt_a = zero, if resetout_done then next else next;
90 => X"6C_61_73_74_72_65_63_3A_20_6C_69_6E_63_6E_74_5F_61_20_3D_20_7A_65_72_6F_2C_20_69_66_20_72_65_73",

-- L0357@005B.  ram_addr = ptr_len, compa = ram, compb = zero, if compa_equals_compb then next else badlength;
-- ram_addr = ptr_len, compa = ram, compb = zero, if compa_equals_compb then next else badlength;
91 => X"72_61_6D_5F_61_64_64_72_20_3D_20_70_74_72_5F_6C_65_6E_2C_20_63_6F_6D_70_61_20_3D_20_72_61_6D_2C",

-- L0358@005C.nextrec:  hexcnt <= ptr_colon, if false then next else nextchar;
-- nextrec: hexcnt <= ptr_colon, if false then next else nextchar;
92 => X"6E_65_78_74_72_65_63_3A_20_68_65_78_63_6E_74_20_3C_3D_20_70_74_72_5F_63_6F_6C_6F_6E_2C_20_69_66",

-- L0368@005D.space:  if prev_is_spaceortab then nextchar else next;
-- space: if prev_is_spaceortab then nextchar else next;
93 => X"73_70_61_63_65_3A_20_69_66_20_70_72_65_76_5F_69_73_5F_73_70_61_63_65_6F_72_74_61_62_20_74_68_65",

-- L0369@005E.  if hexcnt_is_odd then badchar else nextchar;
-- if hexcnt_is_odd then badchar else nextchar;
94 => X"69_66_20_68_65_78_63_6E_74_5F_69_73_5F_6F_64_64_20_74_68_65_6E_20_62_61_64_63_68_61_72_20_65_6C",

-- L0372@005F.colon:  checksum <= zero, if bytecnt_at_colon then next else badcolon;
-- colon: checksum <= zero, if bytecnt_at_colon then next else badcolon;
95 => X"63_6F_6C_6F_6E_3A_20_63_68_65_63_6B_73_75_6D_20_3C_3D_20_7A_65_72_6F_2C_20_69_66_20_62_79_74_65",

-- L0373@0060.  hexcnt <= inc;
-- hexcnt <= inc;
96 => X"68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0374@0061.  hexcnt <= inc, if false then next else nextchar;
-- hexcnt <= inc, if false then next else nextchar;
97 => X"68_65_78_63_6E_74_20_3C_3D_20_69_6E_63_2C_20_69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78",

-- L0376@0062.trace:  if TRACE_CHAR then next else return;
-- trace: if TRACE_CHAR then next else return;
98 => X"74_72_61_63_65_3A_20_69_66_20_54_52_41_43_45_5F_43_48_41_52_20_74_68_65_6E_20_6E_65_78_74_20_65",

-- L0378@0063.  emit(char_I);
-- emit(char_I);
99 => X"65_6D_69_74_28_63_68_61_72_5F_49_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0379@0064.  emit(char_EQU);
-- emit(char_EQU);
100 => X"65_6D_69_74_28_63_68_61_72_5F_45_51_55_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0380@0065.  emit(inp1);
-- emit(inp1);
101 => X"65_6D_69_74_28_69_6E_70_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0381@0066.  emit(inp0);
-- emit(inp0);
102 => X"65_6D_69_74_28_69_6E_70_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0382@0067.  emit(char_space);
-- emit(char_space);
103 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0384@0068.  emit(char_A);
-- emit(char_A);
104 => X"65_6D_69_74_28_63_68_61_72_5F_41_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0385@0069.  emit(char_EQU);
-- emit(char_EQU);
105 => X"65_6D_69_74_28_63_68_61_72_5F_45_51_55_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0386@006A.  printaddr();
-- printaddr();
106 => X"70_72_69_6E_74_61_64_64_72_28_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0387@006B.  emit(char_space);
-- emit(char_space);
107 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0389@006C.  emit(char_C);
-- emit(char_C);
108 => X"65_6D_69_74_28_63_68_61_72_5F_43_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0390@006D.  emit(char_EQU);
-- emit(char_EQU);
109 => X"65_6D_69_74_28_63_68_61_72_5F_45_51_55_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0391@006E.  emit(lin_chk3);
-- emit(lin_chk3);
110 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_33_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0392@006F.  emit(lin_chk2);
-- emit(lin_chk2);
111 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_32_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0393@0070.  emit(lin_chk1);
-- emit(lin_chk1);
112 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0394@0071.  emit(lin_chk0);
-- emit(lin_chk0);
113 => X"65_6D_69_74_28_6C_69_6E_5F_63_68_6B_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0395@0072.  emit(char_space);
-- emit(char_space);
114 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0399@0073.  emit(flags);
-- emit(flags);
115 => X"65_6D_69_74_28_66_6C_61_67_73_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0400@0074.  emit(char_space);
-- emit(char_space);
116 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0402@0075.  emit(char_B);
-- emit(char_B);
117 => X"65_6D_69_74_28_63_68_61_72_5F_42_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0403@0076.  emit(char_EQU);
-- emit(char_EQU);
118 => X"65_6D_69_74_28_63_68_61_72_5F_45_51_55_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0404@0077.  emit(bytecnt1);
-- emit(bytecnt1);
119 => X"65_6D_69_74_28_62_79_74_65_63_6E_74_31_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0405@0078.  emit(bytecnt0);
-- emit(bytecnt0);
120 => X"65_6D_69_74_28_62_79_74_65_63_6E_74_30_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0406@0079.  emit(char_space);
-- emit(char_space);
121 => X"65_6D_69_74_28_63_68_61_72_5F_73_70_61_63_65_29_3B_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20",

-- L0408@007A.  if false then next else printramR;
-- if false then next else printramR;
122 => X"69_66_20_66_61_6C_73_65_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_70_72_69_6E_74_72_61_6D",

-- L0410@007B.emit:  if TXDREADY then next else repeat;
-- emit: if TXDREADY then next else repeat;
123 => X"65_6D_69_74_3A_20_69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65",

-- L0411@007C.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
124 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0412@007D.  if TXDREADY then next else repeat;
-- if TXDREADY then next else repeat;
125 => X"69_66_20_54_58_44_52_45_41_44_59_20_74_68_65_6E_20_6E_65_78_74_20_65_6C_73_65_20_72_65_70_65_61",

-- L0413@007E.  if TXDSEND then return else return;
-- if TXDSEND then return else return;
126 => X"69_66_20_54_58_44_53_45_4E_44_20_74_68_65_6E_20_72_65_74_75_72_6E_20_65_6C_73_65_20_72_65_74_75",

127 => X"20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20_20");

end hex2mem_sym;

