----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:18:17 08/28/2021 
-- Design Name: 
-- Module Name:    tracer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.hexcalc_sym.all;
use work.sbc8816_package.all;

entity tracer is
    Port ( reset : in  STD_LOGIC;
			  clk: in STD_LOGIC;
           uart_data : out  STD_LOGIC_VECTOR (7 downto 0);
           uart_send : out  STD_LOGIC;
           uart_ready : in  STD_LOGIC;
           dev_data : in  STD_LOGIC_VECTOR(7 downto 0);
           dev_send : in  STD_LOGIC;
           dev_ready : out  STD_LOGIC;
			  trigger: in STD_LOGIC;
           enable : in  STD_LOGIC;
           debug : in  STD_LOGIC_VECTOR (15 downto 0);
			  inp_char: in STD_LOGIC_VECTOR(7 downto 0);
			  ext_char: in STD_LOGIC_VECTOR(7 downto 0));
end tracer;

architecture Behavioral of tracer is


signal cnt: std_logic_vector(9 downto 0); 
alias  charpos: std_logic_vector(5 downto 0) is cnt(9 downto 4); -- 64 chars per trace line
alias  bitpos: std_logic_vector(3 downto 0) is cnt(3 downto 0); -- 16 to allow char to be sent
signal sympos: std_logic_vector(5 downto 0); -- symbols are offset by 8 chars
signal debug_data, ascii_hex, ascii_fix, ascii_inp, format_d: std_logic_vector(7 downto 0);
signal debug_send: std_logic;
signal hexout: std_logic_vector(3 downto 0);
alias ui_address: std_logic_vector(7 downto 0) is debug(7 downto 0); -- 256 words microcode
signal tr_enable, tr_done, tr_enable_clk: std_logic;
-- for tracer

begin

-- convert symbol entries to byte-oriented ROM
gen_r: for r in 0 to SYMBOL_ADDRESS_LAST generate
begin
	gen_c: for c in 0 to SYMBOL_BYTE_LAST generate
	begin
			--assert false report "r= " & integer'image(r) & " c= " & integer'image(c) severity note;
			hxc_symbol_byte(r * (SYMBOL_BYTE_LAST + 1) + c) <= hxc_symbol_entry(r)(SYMBOL_DATA_WIDTH - 8 * c - 1 downto SYMBOL_DATA_WIDTH - 8 * (c + 1));
	end generate;
end generate;

uart_data <= dev_data when (enable = '0') else debug_data;
uart_send <= dev_send when (enable = '0') else debug_send;
dev_ready <= uart_ready when (enable = '0') else '1'; 	-- fool the device into not waiting for output
tr_done <= '0' when (charpos = O"77") else '1';

debug_send <= tr_enable when (bitpos = X"1") else '0';
sympos <= std_logic_vector(unsigned(charpos) - 8);

tr_enable_clk <= trigger when (tr_enable = '0') else tr_done;
on_tr_enable_clk: process(reset, tr_enable, tr_enable_clk)
begin
	if (reset = '1') then
		tr_enable <= '0';
	else
		if (rising_edge(tr_enable_clk)) then
			tr_enable <= not tr_enable;
		end if;
	end if;
end process;

on_clk: process(reset, clk, cnt, tr_enable)
begin
	if ((reset = '1') or (tr_enable = '0')) then
		cnt <= (others => '0');
	else
		if (rising_edge(clk)) then
			cnt <= std_logic_vector(unsigned(cnt) + 1);
		end if;
	end if;
end process;

-- output from source ROM or internal format
hxc_sym_a <= ui_address & sympos(4 downto 0);
hxc_sym_d <= hxc_symbol_byte(to_integer(unsigned(hxc_sym_a)));
with charpos(5 downto 3) select debug_data <=
	format_d when O"0",
	hxc_sym_d when O"1",
	hxc_sym_d when O"2",
	hxc_sym_d when O"3",
	hxc_sym_d when O"4",
	format_d when O"7",
	X"20" when others;
	
with charpos(3 downto 0) select format_d <=
	ascii_inp when X"0", -- sanitized input char
	ascii_hex when X"2",	-- debug
	ascii_hex when X"3",	-- debug
	ascii_hex when X"5",	-- debug
	ascii_hex when X"6",	-- debug
	ascii_fix when X"D",	-- sanitized prefix
	X"0D" when X"E",  -- CR
	X"0A" when X"F", 	-- LF
	X"20" when others;
	
-- data from debug port
ascii_hex <= hex2ascii(to_integer(unsigned(hexout)));
with charpos(3 downto 0) select hexout <=
	debug(7 downto 4) when X"5",
	debug(3 downto 0) when X"6",
	debug(15 downto 12) when X"2",
	debug(11 downto 8) when X"3",
	X"0" when others;

-- sanitize ascii code coming through prefix port to make it displayable
with ext_char(7 downto 5) select ascii_fix <= 
	X"2E" when "000",		-- 00..1F (show dot)
	ext_char when "001",	-- 20..3F
	ext_char when "010",	-- 40..5F
	ext_char when "011",	-- 60..7F
	X"7E" when others;	-- 80..FF (show tilde)

-- sanitize input character and make it displayable
with inp_char(7 downto 5) select ascii_inp <= 
	X"2E" when "000",		-- 00..1F (show dot)
	inp_char when "001",	-- 20..3F
	inp_char when "010",	-- 40..5F
	inp_char when "011",	-- 60..7F
	X"7E" when others;	-- 80..FF (show tilde)
	
end Behavioral;

