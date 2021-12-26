--------------------------------------------------------
-- mcc V1.0.0926 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'code_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package hex2mem_code is

-- memory block size
constant CODE_DATA_WIDTH: 	positive := 48;
constant CODE_ADDRESS_WIDTH: 	positive := 7;
constant CODE_ADDRESS_LAST: 	positive := 127;
constant CODE_IF_WIDTH: 	positive := 4;


type h2m_code_memory is array(0 to 127) of std_logic_vector(47 downto 0);

signal h2m_uinstruction: std_logic_vector(47 downto 0);

--h2m_uinstruction <= h2m_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0011.nBUSREQ: .valfield 1 values 0, 1 default 1;
--
alias h2m_nBUSREQ: 	std_logic is h2m_uinstruction(47);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nBUSREQ <= h2m_nBUSREQ;
---- End boilerplate code

--
-- L0012.nWR: .valfield 1 values 0, 1 default 1;
--
alias h2m_nWR: 	std_logic is h2m_uinstruction(46);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  nWR <= h2m_nWR;
---- End boilerplate code

--
-- L0019.BUSY: .valfield 1 values 0, 1 default 1;
--
alias h2m_BUSY: 	std_logic is h2m_uinstruction(45);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  BUSY <= h2m_BUSY;
---- End boilerplate code

--
-- L0026.seq_cond: .if 4 values true, nWAIT, nBUSACK, input_is_zero, TXDREADY, TXDSEND, TRACE_ERROR, TRACE_WRITE, TRACE_CHAR, bytecnt_at_colon, hexcnt_is_odd, prev_is_crorlf, prev_is_spaceortab, compa_equals_compb, resetout_done, false default true;
--
alias h2m_seq_cond: 	std_logic_vector(3 downto 0) is h2m_uinstruction(44 downto 41);
constant seq_cond_true: 	integer := 0;
constant seq_cond_nWAIT: 	integer := 1;
constant seq_cond_nBUSACK: 	integer := 2;
constant seq_cond_input_is_zero: 	integer := 3;
constant seq_cond_TXDREADY: 	integer := 4;
constant seq_cond_TXDSEND: 	integer := 5;
constant seq_cond_TRACE_ERROR: 	integer := 6;
constant seq_cond_TRACE_WRITE: 	integer := 7;
constant seq_cond_TRACE_CHAR: 	integer := 8;
constant seq_cond_bytecnt_at_colon: 	integer := 9;
constant seq_cond_hexcnt_is_odd: 	integer := 10;
constant seq_cond_prev_is_crorlf: 	integer := 11;
constant seq_cond_prev_is_spaceortab: 	integer := 12;
constant seq_cond_compa_equals_compb: 	integer := 13;
constant seq_cond_resetout_done: 	integer := 14;
constant seq_cond_false: 	integer := 15;
---- Start boilerplate code (use with utmost caution!)
---- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and feed 'conditions' with:
--  cond(seq_cond_true) => '1',
--  cond(seq_cond_nWAIT) => nWAIT,
--  cond(seq_cond_nBUSACK) => nBUSACK,
--  cond(seq_cond_input_is_zero) => input_is_zero,
--  cond(seq_cond_TXDREADY) => TXDREADY,
--  cond(seq_cond_TXDSEND) => TXDSEND,
--  cond(seq_cond_TRACE_ERROR) => TRACE_ERROR,
--  cond(seq_cond_TRACE_WRITE) => TRACE_WRITE,
--  cond(seq_cond_TRACE_CHAR) => TRACE_CHAR,
--  cond(seq_cond_bytecnt_at_colon) => bytecnt_at_colon,
--  cond(seq_cond_hexcnt_is_odd) => hexcnt_is_odd,
--  cond(seq_cond_prev_is_crorlf) => prev_is_crorlf,
--  cond(seq_cond_prev_is_spaceortab) => prev_is_spaceortab,
--  cond(seq_cond_compa_equals_compb) => compa_equals_compb,
--  cond(seq_cond_resetout_done) => resetout_done,
--  cond(seq_cond_false) => '0',
---- End boilerplate code

--
-- L0044.seq_then: .then 7 values next, repeat, return, fork, @ default next;
--
alias h2m_seq_then: 	std_logic_vector(6 downto 0) is h2m_uinstruction(40 downto 34);
constant seq_then_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_then_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_then_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_then_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'then' to h2m_seq_then

--
-- L0045.seq_else: .else 7 values next, repeat, return, fork, 0b000000..0b111111, @ default next;
--
alias h2m_seq_else: 	std_logic_vector(6 downto 0) is h2m_uinstruction(33 downto 27);
constant seq_else_next: 	std_logic_vector(6 downto 0) := "0000000";
constant seq_else_repeat: 	std_logic_vector(6 downto 0) := "0000001";
constant seq_else_return: 	std_logic_vector(6 downto 0) := "0000010";
constant seq_else_fork: 	std_logic_vector(6 downto 0) := "0000011";
-- Values from "0000000" to "0111111" allowed
-- Jump targets allowed!
-- include '.controller <filename.vhd>, <stackdepth>;' in .mcc file to generate pre-canned microcode control unit and connect 'else' to h2m_seq_else

--
-- L0048.TXDCHAR: .regfield 5 values same, char_F, char_space, char_cr, char_lf, char_E, char_R, char_I, char_B, char_A, char_C, char_EQU, char_open, char_close, -, zero, pos_ram0, pos_ram1, inp0, inp1, lin_chk0, lin_chk1, lin_chk2, lin_chk3, bytecnt0, bytecnt1, addr0, addr1, addr2, addr3, flags, errcode default same;
--
alias h2m_TXDCHAR: 	std_logic_vector(4 downto 0) is h2m_uinstruction(26 downto 22);
constant TXDCHAR_same: 	std_logic_vector(4 downto 0) := "00000";
constant TXDCHAR_char_F: 	std_logic_vector(4 downto 0) := "00001";
constant TXDCHAR_char_space: 	std_logic_vector(4 downto 0) := "00010";
constant TXDCHAR_char_cr: 	std_logic_vector(4 downto 0) := "00011";
constant TXDCHAR_char_lf: 	std_logic_vector(4 downto 0) := "00100";
constant TXDCHAR_char_E: 	std_logic_vector(4 downto 0) := "00101";
constant TXDCHAR_char_R: 	std_logic_vector(4 downto 0) := "00110";
constant TXDCHAR_char_I: 	std_logic_vector(4 downto 0) := "00111";
constant TXDCHAR_char_B: 	std_logic_vector(4 downto 0) := "01000";
constant TXDCHAR_char_A: 	std_logic_vector(4 downto 0) := "01001";
constant TXDCHAR_char_C: 	std_logic_vector(4 downto 0) := "01010";
constant TXDCHAR_char_EQU: 	std_logic_vector(4 downto 0) := "01011";
constant TXDCHAR_char_open: 	std_logic_vector(4 downto 0) := "01100";
constant TXDCHAR_char_close: 	std_logic_vector(4 downto 0) := "01101";
-- Value "01110" not allowed (name '-' is not assignable)
constant TXDCHAR_zero: 	std_logic_vector(4 downto 0) := "01111";
constant TXDCHAR_pos_ram0: 	std_logic_vector(4 downto 0) := "10000";
constant TXDCHAR_pos_ram1: 	std_logic_vector(4 downto 0) := "10001";
constant TXDCHAR_inp0: 	std_logic_vector(4 downto 0) := "10010";
constant TXDCHAR_inp1: 	std_logic_vector(4 downto 0) := "10011";
constant TXDCHAR_lin_chk0: 	std_logic_vector(4 downto 0) := "10100";
constant TXDCHAR_lin_chk1: 	std_logic_vector(4 downto 0) := "10101";
constant TXDCHAR_lin_chk2: 	std_logic_vector(4 downto 0) := "10110";
constant TXDCHAR_lin_chk3: 	std_logic_vector(4 downto 0) := "10111";
constant TXDCHAR_bytecnt0: 	std_logic_vector(4 downto 0) := "11000";
constant TXDCHAR_bytecnt1: 	std_logic_vector(4 downto 0) := "11001";
constant TXDCHAR_addr0: 	std_logic_vector(4 downto 0) := "11010";
constant TXDCHAR_addr1: 	std_logic_vector(4 downto 0) := "11011";
constant TXDCHAR_addr2: 	std_logic_vector(4 downto 0) := "11100";
constant TXDCHAR_addr3: 	std_logic_vector(4 downto 0) := "11101";
constant TXDCHAR_flags: 	std_logic_vector(4 downto 0) := "11110";
constant TXDCHAR_errcode: 	std_logic_vector(4 downto 0) := "11111";
---- Start boilerplate code (use with utmost caution!)
-- update_TXDCHAR: process(clk, h2m_TXDCHAR)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_TXDCHAR is
----			when TXDCHAR_same =>
----				TXDCHAR <= TXDCHAR;
--			when TXDCHAR_char_F =>
--				TXDCHAR <= char_F;
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
--			when TXDCHAR_char_I =>
--				TXDCHAR <= char_I;
--			when TXDCHAR_char_B =>
--				TXDCHAR <= char_B;
--			when TXDCHAR_char_A =>
--				TXDCHAR <= char_A;
--			when TXDCHAR_char_C =>
--				TXDCHAR <= char_C;
--			when TXDCHAR_char_EQU =>
--				TXDCHAR <= char_EQU;
--			when TXDCHAR_char_open =>
--				TXDCHAR <= char_open;
--			when TXDCHAR_char_close =>
--				TXDCHAR <= char_close;
--			when TXDCHAR_zero =>
--				TXDCHAR <= (others => '0');
--			when TXDCHAR_pos_ram0 =>
--				TXDCHAR <= pos_ram0;
--			when TXDCHAR_pos_ram1 =>
--				TXDCHAR <= pos_ram1;
--			when TXDCHAR_inp0 =>
--				TXDCHAR <= inp0;
--			when TXDCHAR_inp1 =>
--				TXDCHAR <= inp1;
--			when TXDCHAR_lin_chk0 =>
--				TXDCHAR <= lin_chk0;
--			when TXDCHAR_lin_chk1 =>
--				TXDCHAR <= lin_chk1;
--			when TXDCHAR_lin_chk2 =>
--				TXDCHAR <= lin_chk2;
--			when TXDCHAR_lin_chk3 =>
--				TXDCHAR <= lin_chk3;
--			when TXDCHAR_bytecnt0 =>
--				TXDCHAR <= bytecnt0;
--			when TXDCHAR_bytecnt1 =>
--				TXDCHAR <= bytecnt1;
--			when TXDCHAR_addr0 =>
--				TXDCHAR <= addr0;
--			when TXDCHAR_addr1 =>
--				TXDCHAR <= addr1;
--			when TXDCHAR_addr2 =>
--				TXDCHAR <= addr2;
--			when TXDCHAR_addr3 =>
--				TXDCHAR <= addr3;
--			when TXDCHAR_flags =>
--				TXDCHAR <= flags;
--			when TXDCHAR_errcode =>
--				TXDCHAR <= errcode;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0085.lincnt_a: .valfield 1 values zero, lincnt default lincnt;
--
alias h2m_lincnt_a: 	std_logic is h2m_uinstruction(21);
constant lincnt_a_zero: 	std_logic := '0';
constant lincnt_a_lincnt: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	lincnt_a <= (others => '0') when (h2m_lincnt_a = lincnt_a_zero) else lincnt;
---- End boilerplate code

--
-- L0086.lincnt_cin: .valfield 1 values 0, 1 default 0;
--
alias h2m_lincnt_cin: 	std_logic is h2m_uinstruction(20);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  lincnt_cin <= h2m_lincnt_cin;
---- End boilerplate code

--
-- L0089.poscnt_a: .valfield 1 values zero, poscnt default poscnt;
--
alias h2m_poscnt_a: 	std_logic is h2m_uinstruction(19);
constant poscnt_a_zero: 	std_logic := '0';
constant poscnt_a_poscnt: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	poscnt_a <= (others => '0') when (h2m_poscnt_a = poscnt_a_zero) else poscnt;
---- End boilerplate code

--
-- L0090.poscnt_cin: .valfield 1 values 0, 1 default 0;
--
alias h2m_poscnt_cin: 	std_logic is h2m_uinstruction(18);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  poscnt_cin <= h2m_poscnt_cin;
---- End boilerplate code

--
-- L0093.address: .regfield 2 values same, inc, shift8ram, - default same;
--
alias h2m_address: 	std_logic_vector(1 downto 0) is h2m_uinstruction(17 downto 16);
constant address_same: 	std_logic_vector(1 downto 0) := "00";
constant address_inc: 	std_logic_vector(1 downto 0) := "01";
constant address_shift8ram: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_address: process(clk, h2m_address)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_address is
----			when address_same =>
----				address <= address;
--			when address_inc =>
--				address <= std_logic_vector(unsigned(address) + 1);
--			when address_shift8ram =>
--				address <= shift8ram;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0109.ram_write: .valfield 1 values 0, 1 default 0;
--
alias h2m_ram_write: 	std_logic is h2m_uinstruction(15);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  ram_write <= h2m_ram_write;
---- End boilerplate code

--
-- L0112.ram_addr: .valfield 3 values bytecnt, ptr_len, ptr_addr_hi, ptr_addr_lo, ptr_type, - - - default bytecnt;
--
alias h2m_ram_addr: 	std_logic_vector(2 downto 0) is h2m_uinstruction(14 downto 12);
constant ram_addr_bytecnt: 	std_logic_vector(2 downto 0) := "000";
constant ram_addr_ptr_len: 	std_logic_vector(2 downto 0) := "001";
constant ram_addr_ptr_addr_hi: 	std_logic_vector(2 downto 0) := "010";
constant ram_addr_ptr_addr_lo: 	std_logic_vector(2 downto 0) := "011";
constant ram_addr_ptr_type: 	std_logic_vector(2 downto 0) := "100";
-- Value "101" not allowed (name '- - -' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- with h2m_ram_addr select ram_addr <=
--      bytecnt when ram_addr_bytecnt, -- default value
--      ptr_len when ram_addr_ptr_len,
--      ptr_addr_hi when ram_addr_ptr_addr_hi,
--      ptr_addr_lo when ram_addr_ptr_addr_lo,
--      ptr_type when ram_addr_ptr_type,
--      bytecnt when others;
---- End boilerplate code

--
-- L0124.hexcnt: .regfield 3 values same, inc, ptr_colon, ptr_len, ptr_type, -, -, zero default same;
--
alias h2m_hexcnt: 	std_logic_vector(2 downto 0) is h2m_uinstruction(11 downto 9);
constant hexcnt_same: 	std_logic_vector(2 downto 0) := "000";
constant hexcnt_inc: 	std_logic_vector(2 downto 0) := "001";
constant hexcnt_ptr_colon: 	std_logic_vector(2 downto 0) := "010";
constant hexcnt_ptr_len: 	std_logic_vector(2 downto 0) := "011";
constant hexcnt_ptr_type: 	std_logic_vector(2 downto 0) := "100";
-- Value "101" not allowed (name '-' is not assignable)
-- Value "110" not allowed (name '-' is not assignable)
constant hexcnt_zero: 	std_logic_vector(2 downto 0) := "111";
---- Start boilerplate code (use with utmost caution!)
-- update_hexcnt: process(clk, h2m_hexcnt)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_hexcnt is
----			when hexcnt_same =>
----				hexcnt <= hexcnt;
--			when hexcnt_inc =>
--				hexcnt <= std_logic_vector(unsigned(hexcnt) + 1);
--			when hexcnt_ptr_colon =>
--				hexcnt <= ptr_colon;
--			when hexcnt_ptr_len =>
--				hexcnt <= ptr_len;
--			when hexcnt_ptr_type =>
--				hexcnt <= ptr_type;
--			when hexcnt_zero =>
--				hexcnt <= (others => '0');
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0136.checksum: .regfield 2 values same, zero, add_ram, - default same;
--
alias h2m_checksum: 	std_logic_vector(1 downto 0) is h2m_uinstruction(8 downto 7);
constant checksum_same: 	std_logic_vector(1 downto 0) := "00";
constant checksum_zero: 	std_logic_vector(1 downto 0) := "01";
constant checksum_add_ram: 	std_logic_vector(1 downto 0) := "10";
-- Value "11" not allowed (name '-' is not assignable)
---- Start boilerplate code (use with utmost caution!)
-- update_checksum: process(clk, h2m_checksum)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_checksum is
----			when checksum_same =>
----				checksum <= checksum;
--			when checksum_zero =>
--				checksum <= (others => '0');
--			when checksum_add_ram =>
--				checksum <= add_ram;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0143.input_reset: .valfield 1 values 0, 1 default 0;
--
alias h2m_input_reset: 	std_logic is h2m_uinstruction(6);
-- Value '0' allowed
-- Value '1' allowed
---- Start boilerplate code (use with utmost caution!)
--  input_reset <= h2m_input_reset;
---- End boilerplate code

--
-- L0146.errcode: .regfield 3 values ok, err_badchar, err_unexpected, err_badchecksum, err_badrecordtype, err_badrecordlength, same default same;
--
alias h2m_errcode: 	std_logic_vector(2 downto 0) is h2m_uinstruction(5 downto 3);
constant errcode_ok: 	std_logic_vector(2 downto 0) := "000";
constant errcode_err_badchar: 	std_logic_vector(2 downto 0) := "001";
constant errcode_err_unexpected: 	std_logic_vector(2 downto 0) := "010";
constant errcode_err_badchecksum: 	std_logic_vector(2 downto 0) := "011";
constant errcode_err_badrecordtype: 	std_logic_vector(2 downto 0) := "100";
constant errcode_err_badrecordlength: 	std_logic_vector(2 downto 0) := "101";
constant errcode_same: 	std_logic_vector(2 downto 0) := "110";
---- Start boilerplate code (use with utmost caution!)
-- update_errcode: process(clk, h2m_errcode)
-- begin
--	if (rising_edge(clk)) then
--		case h2m_errcode is
--			when errcode_ok =>
--				errcode <= ok;
--			when errcode_err_badchar =>
--				errcode <= err_badchar;
--			when errcode_err_unexpected =>
--				errcode <= err_unexpected;
--			when errcode_err_badchecksum =>
--				errcode <= err_badchecksum;
--			when errcode_err_badrecordtype =>
--				errcode <= err_badrecordtype;
--			when errcode_err_badrecordlength =>
--				errcode <= err_badrecordlength;
----			when errcode_same =>
----				errcode <= errcode;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0157.compa: .valfield 1 values ram, checksum_lsb default ram;
--
alias h2m_compa: 	std_logic is h2m_uinstruction(2);
constant compa_ram: 	std_logic := '0';
constant compa_checksum_lsb: 	std_logic := '1';
---- Start boilerplate code (use with utmost caution!)
--	compa <= checksum_lsb when (h2m_compa = compa_checksum_lsb) else ram;
---- End boilerplate code

--
-- L0163.compb: .valfield 2 values zero, one, bytecnt, bytecnt_dec default zero;
--
alias h2m_compb: 	std_logic_vector(1 downto 0) is h2m_uinstruction(1 downto 0);
constant compb_zero: 	std_logic_vector(1 downto 0) := "00";
constant compb_one: 	std_logic_vector(1 downto 0) := "01";
constant compb_bytecnt: 	std_logic_vector(1 downto 0) := "10";
constant compb_bytecnt_dec: 	std_logic_vector(1 downto 0) := "11";
---- Start boilerplate code (use with utmost caution!)
-- with h2m_compb select compb <=
--      (others => '0') when compb_zero, -- default value
--      one when compb_one,
--      bytecnt when compb_bytecnt,
--      bytecnt_dec when compb_bytecnt_dec;
---- End boilerplate code



constant h2m_microcode: h2m_code_memory := (

-- L0195@0000._reset:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 010, checksum <= 01, input_reset = 0, errcode <= 000, compa = 0, compb = 00;
0 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & O"2" & "01" & '0' & O"0" & '0' & "00",

-- L0197@0001._reset1:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 010, checksum <= 01, input_reset = 0, errcode <= 000, compa = 0, compb = 00;
1 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & O"2" & "01" & '0' & O"0" & '0' & "00",

-- L0199@0002._reset2:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 010, checksum <= 01, input_reset = 0, errcode <= 000, compa = 0, compb = 00;
2 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & O"2" & "01" & '0' & O"0" & '0' & "00",

-- L0201@0003._reset3:  TXDCHAR <= zero, errcode <= ok, checksum <= zero, poscnt_a = zero, lincnt_a = zero, hexcnt <= ptr_colon;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 01111, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 010, checksum <= 01, input_reset = 0, errcode <= 000, compa = 0, compb = 00;
3 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "01111" & '0' & '0' & '0' & '0' & "00" & '0' & O"0" & O"2" & "01" & '0' & O"0" & '0' & "00",

-- L0205@0004.deadloop:  BUSY = 0, if input_is_zero then repeat else next;
--  nBUSREQ = 1, nWR = 1, BUSY = 0, if (0011) then 0000001 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
4 => '1' & '1' & '0' & X"3" & "0000001" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0206@0005.  trace();
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1100010 else 1100010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
5 => '1' & '1' & '1' & X"0" & "1100010" & "1100010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0207@0006.  poscnt_cin = 1, if true then fork else fork;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000011 else 0000011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 1, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
6 => '1' & '1' & '1' & X"0" & "0000011" & "0000011" & "00000" & '1' & '0' & '1' & '1' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0210@0007.badchar:  errcode <= err_badchar, if TRACE_ERROR then printerror else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0110) then 0001101 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 001, compa = 0, compb = 00;
7 => '1' & '1' & '1' & X"6" & "0001101" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"1" & '0' & "00",

-- L0211@0008.badcolon:  errcode <= err_unexpected, if TRACE_ERROR then printerror else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0110) then 0001101 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 010, compa = 0, compb = 00;
8 => '1' & '1' & '1' & X"6" & "0001101" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"2" & '0' & "00",

-- L0212@0009.badchecksum:  errcode <= err_badchecksum, if TRACE_ERROR then printerror else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0110) then 0001101 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 011, compa = 0, compb = 00;
9 => '1' & '1' & '1' & X"6" & "0001101" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"3" & '0' & "00",

-- L0213@000A.badtype:  errcode <= err_badrecordtype, if TRACE_ERROR then printerror else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0110) then 0001101 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 100, compa = 0, compb = 00;
10 => '1' & '1' & '1' & X"6" & "0001101" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"4" & '0' & "00",

-- L0214@000B.badlength:  errcode <= err_badrecordlength,if TRACE_ERROR then printerror else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0110) then 0001101 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 101, compa = 0, compb = 00;
11 => '1' & '1' & '1' & X"6" & "0001101" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"5" & '0' & "00",

-- L0215@000C.badhex:  errcode <= err_unexpected, if TRACE_ERROR then next else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0110) then 0000000 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 010, compa = 0, compb = 00;
12 => '1' & '1' & '1' & X"6" & "0000000" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"2" & '0' & "00",

-- L0216@000D.printerror:  emit(char_E);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
13 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0217@000E.  emit(char_R);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
14 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0218@000F.  emit(char_R);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
15 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0219@0010.  emit(errcode);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 11111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
16 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "11111" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0220@0011.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
17 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0221@0012.  emit(lin_chk3);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
18 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10111" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0222@0013.  emit(lin_chk2);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
19 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0223@0014.  emit(lin_chk1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
20 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0224@0015.  emit(lin_chk0);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
21 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0225@0016.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
22 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0226@0017.  emit(pos_ram1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
23 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0227@0018.  emit(pos_ram0);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
24 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0228@0019.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
25 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0229@001A.  emit(inp1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
26 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0230@001B.  hexcnt <= ptr_colon, emit(inp0);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 010, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
27 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"2" & "00" & '0' & O"6" & '0' & "00",

-- L0231@001C.  print_crlf();
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0100010 else 0100010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
28 => '1' & '1' & '1' & X"0" & "0100010" & "0100010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0233@001D.nextchar:  errcode <= ok, input_reset = 1, if false then next else deadloop;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0000100, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 1, errcode <= 000, compa = 0, compb = 00;
29 => '1' & '1' & '1' & X"F" & "0000000" & "0000100" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '1' & O"0" & '0' & "00",

-- L0235@001E.printramR:  emit(char_R);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
30 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0237@001F.printram:  emit(char_EQU);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
31 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0238@0020.  emit(pos_ram1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
32 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0239@0021.  emit(pos_ram0);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
33 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0241@0022.print_crlf:  emit(char_cr);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
34 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0242@0023.  TXDCHAR <= char_lf, if false then next else emit;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1111011, TXDCHAR <= 00100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
35 => '1' & '1' & '1' & X"F" & "0000000" & "1111011" & "00100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0244@0024.printaddr:  emit(addr3);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 11101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
36 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "11101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0245@0025.  emit(addr2);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 11100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
37 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "11100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0246@0026.  emit(addr1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 11011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
38 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "11011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0247@0027.  TXDCHAR <= addr0, if false then next else emit;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1111011, TXDCHAR <= 11010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
39 => '1' & '1' & '1' & X"F" & "0000000" & "1111011" & "11010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0252@0030.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
48 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0256@0031.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
49 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0260@0032.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
50 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0264@0033.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
51 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0268@0034.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
52 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0272@0035.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
53 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0276@0036.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
54 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0280@0037.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
55 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0284@0038.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
56 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0288@0039.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
57 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0293@003A.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
58 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0298@003B.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
59 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0303@003C.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
60 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0308@003D.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
61 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0313@003E.  ram_write = 1, ram_addr = bytecnt, if false then next else hexchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
62 => '1' & '1' & '1' & X"F" & "0000000" & "1000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0318@003F.  ram_write = 1, ram_addr = bytecnt;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 1, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
63 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '1' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0319@0040.hexchar:  if bytecnt_at_colon then badhex;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1001) then 0001100 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
64 => '1' & '1' & '1' & X"9" & "0001100" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0320@0041.  if hexcnt_is_odd then next else dontadd;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1010) then 0000000 else 1000011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
65 => '1' & '1' & '1' & X"A" & "0000000" & "1000011" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0321@0042.  ram_addr = bytecnt, checksum <= add_ram;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 10, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
66 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "10" & '0' & O"6" & '0' & "00",

-- L0322@0043.dontadd:  hexcnt <= inc, if false then next else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 001, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
67 => '1' & '1' & '1' & X"F" & "0000000" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"1" & "00" & '0' & O"6" & '0' & "00",

-- L0325@0044.  if prev_is_crorlf then nextchar else newline;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1011) then 0011101 else 1000110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
68 => '1' & '1' & '1' & X"B" & "0011101" & "1000110" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0328@0045.  if prev_is_crorlf then nextchar else next;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1011) then 0011101 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
69 => '1' & '1' & '1' & X"B" & "0011101" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0329@0046.newline:  compa = checksum_lsb, compb = zero, if compa_equals_compb then next else badchecksum;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1101) then 0000000 else 0001001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 1, compb = 00;
70 => '1' & '1' & '1' & X"D" & "0000000" & "0001001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '1' & "00",

-- L0330@0047.  poscnt_a = zero, lincnt_cin = 1, if hexcnt_is_odd then badhex else next;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1010) then 0001100 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 1, poscnt_a = 0, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
71 => '1' & '1' & '1' & X"A" & "0001100" & "0000000" & "00000" & '1' & '1' & '0' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0331@0048.  ram_addr = ptr_type, compa = ram, compb = one, if compa_equals_compb then lastrec;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1101) then 1011010 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 100, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 01;
72 => '1' & '1' & '1' & X"D" & "1011010" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"4" & O"0" & "00" & '0' & O"6" & '0' & "01",

-- L0332@0049.  ram_addr = ptr_type, compa = ram, compb = zero, if compa_equals_compb then next else badtype;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1101) then 0000000 else 0001010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 100, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
73 => '1' & '1' & '1' & X"D" & "0000000" & "0001010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"4" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0333@004A.  ram_addr = ptr_len, compa = ram, compb = bytecnt_dec, if compa_equals_compb then next else badlength;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1101) then 0000000 else 0001011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 001, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 11;
74 => '1' & '1' & '1' & X"D" & "0000000" & "0001011" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"1" & O"0" & "00" & '0' & O"6" & '0' & "11",

-- L0335@004B.  ram_addr = ptr_addr_hi, address <= shift8ram, hexcnt <= zero;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 10, ram_write = 0, ram_addr = 010, hexcnt <= 111, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
75 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "10" & '0' & O"2" & O"7" & "00" & '0' & O"6" & '0' & "00",

-- L0336@004C.  ram_addr = ptr_addr_lo, address <= shift8ram, hexcnt <= zero;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 10, ram_write = 0, ram_addr = 011, hexcnt <= 111, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
76 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "10" & '0' & O"3" & O"7" & "00" & '0' & O"6" & '0' & "00",

-- L0338@004D.writeloop:  ram_addr = ptr_len, compa = ram, compb = bytecnt, if compa_equals_compb then nextrec;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1101) then 1011100 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 001, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 10;
77 => '1' & '1' & '1' & X"D" & "1011100" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"1" & O"0" & "00" & '0' & O"6" & '0' & "10",

-- L0341@004E.writemem:  ram_addr = bytecnt, nBUSREQ = 0;
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
78 => '0' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0342@004F.  ram_addr = bytecnt, nBUSREQ = 0, if nBUSACK then repeat else next;
--  nBUSREQ = 0, nWR = 1, BUSY = 1, if (0010) then 0000001 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
79 => '0' & '1' & '1' & X"2" & "0000001" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0343@0050.  ram_addr = bytecnt, nBUSREQ = 0, nWR = 0;
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
80 => '0' & '0' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0344@0051.  ram_addr = bytecnt, nBUSREQ = 0, nWR = 0, if nWAIT then next else repeat;
--  nBUSREQ = 0, nWR = 0, BUSY = 1, if (0001) then 0000000 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
81 => '0' & '0' & '1' & X"1" & "0000000" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0346@0052.  if TRACE_WRITE then next else nextaddr;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0111) then 0000000 else 1011000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
82 => '1' & '1' & '1' & X"7" & "0000000" & "1011000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0347@0053.  emit(char_A);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
83 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0348@0054.  emit(char_open);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
84 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0349@0055.  printaddr();
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0100100 else 0100100, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
85 => '1' & '1' & '1' & X"0" & "0100100" & "0100100" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0350@0056.  emit(char_close);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
86 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0351@0057.  printram();
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0011111 else 0011111, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
87 => '1' & '1' & '1' & X"0" & "0011111" & "0011111" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0353@0058.nextaddr:  hexcnt <= inc;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 001, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
88 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"1" & "00" & '0' & O"6" & '0' & "00",

-- L0354@0059.  hexcnt <= inc, address <= inc, if false then next else writeloop;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 1001101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 01, ram_write = 0, ram_addr = 000, hexcnt <= 001, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
89 => '1' & '1' & '1' & X"F" & "0000000" & "1001101" & "00000" & '1' & '0' & '1' & '0' & "01" & '0' & O"0" & O"1" & "00" & '0' & O"6" & '0' & "00",

-- L0356@005A.lastrec:  lincnt_a = zero, if resetout_done then next else next;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1110) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 0, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
90 => '1' & '1' & '1' & X"E" & "0000000" & "0000000" & "00000" & '0' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0357@005B.  ram_addr = ptr_len, compa = ram, compb = zero, if compa_equals_compb then next else badlength;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1101) then 0000000 else 0001011, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 001, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
91 => '1' & '1' & '1' & X"D" & "0000000" & "0001011" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"1" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0358@005C.nextrec:  hexcnt <= ptr_colon, if false then next else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 010, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
92 => '1' & '1' & '1' & X"F" & "0000000" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"2" & "00" & '0' & O"6" & '0' & "00",

-- L0368@005D.space:  if prev_is_spaceortab then nextchar else next;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1100) then 0011101 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
93 => '1' & '1' & '1' & X"C" & "0011101" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0369@005E.  if hexcnt_is_odd then badchar else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1010) then 0000111 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
94 => '1' & '1' & '1' & X"A" & "0000111" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0372@005F.colon:  checksum <= zero, if bytecnt_at_colon then next else badcolon;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1001) then 0000000 else 0001000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 01, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
95 => '1' & '1' & '1' & X"9" & "0000000" & "0001000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "01" & '0' & O"6" & '0' & "00",

-- L0373@0060.  hexcnt <= inc;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0000000 else 0000000, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 001, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
96 => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"1" & "00" & '0' & O"6" & '0' & "00",

-- L0374@0061.  hexcnt <= inc, if false then next else nextchar;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0011101, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 001, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
97 => '1' & '1' & '1' & X"F" & "0000000" & "0011101" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"1" & "00" & '0' & O"6" & '0' & "00",

-- L0376@0062.trace:  if TRACE_CHAR then next else return;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1000) then 0000000 else 0000010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
98 => '1' & '1' & '1' & X"8" & "0000000" & "0000010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0378@0063.  emit(char_I);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
99 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00111" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0379@0064.  emit(char_EQU);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
100 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0380@0065.  emit(inp1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
101 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0381@0066.  emit(inp0);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
102 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0382@0067.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
103 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0384@0068.  emit(char_A);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
104 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0385@0069.  emit(char_EQU);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
105 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0386@006A.  printaddr();
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 0100100 else 0100100, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
106 => '1' & '1' & '1' & X"0" & "0100100" & "0100100" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0387@006B.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
107 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0389@006C.  emit(char_C);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
108 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0390@006D.  emit(char_EQU);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
109 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0391@006E.  emit(lin_chk3);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10111, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
110 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10111" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0392@006F.  emit(lin_chk2);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
111 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0393@0070.  emit(lin_chk1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10101, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
112 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10101" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0394@0071.  emit(lin_chk0);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 10100, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
113 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "10100" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0395@0072.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
114 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0399@0073.  emit(flags);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 11110, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
115 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "11110" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0400@0074.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
116 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0402@0075.  emit(char_B);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
117 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0403@0076.  emit(char_EQU);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 01011, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
118 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "01011" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0404@0077.  emit(bytecnt1);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 11001, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
119 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "11001" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0405@0078.  emit(bytecnt0);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 11000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
120 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "11000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0406@0079.  emit(char_space);
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0000) then 1111011 else 1111011, TXDCHAR <= 00010, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
121 => '1' & '1' & '1' & X"0" & "1111011" & "1111011" & "00010" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0408@007A.  if false then next else printramR;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (1111) then 0000000 else 0011110, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
122 => '1' & '1' & '1' & X"F" & "0000000" & "0011110" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0410@007B.emit:  if TXDREADY then next else repeat;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 0000000 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
123 => '1' & '1' & '1' & X"4" & "0000000" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0411@007C.  if TXDREADY then next else repeat;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 0000000 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
124 => '1' & '1' & '1' & X"4" & "0000000" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0412@007D.  if TXDREADY then next else repeat;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0100) then 0000000 else 0000001, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
125 => '1' & '1' & '1' & X"4" & "0000000" & "0000001" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- L0413@007E.  if TXDSEND then return else return;
--  nBUSREQ = 1, nWR = 1, BUSY = 1, if (0101) then 0000010 else 0000010, TXDCHAR <= 00000, lincnt_a = 1, lincnt_cin = 0, poscnt_a = 1, poscnt_cin = 0, address <= 00, ram_write = 0, ram_addr = 000, hexcnt <= 000, checksum <= 00, input_reset = 0, errcode <= 110, compa = 0, compb = 00;
126 => '1' & '1' & '1' & X"5" & "0000010" & "0000010" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00",

-- 9 location(s) in following ranges will be filled with default value
-- 0028 .. 002F
-- 007F .. 007F

others => '1' & '1' & '1' & X"0" & "0000000" & "0000000" & "00000" & '1' & '0' & '1' & '0' & "00" & '0' & O"0" & O"0" & "00" & '0' & O"6" & '0' & "00"
);

end hex2mem_code;

