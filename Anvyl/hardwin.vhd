----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:24:49 01/28/2022 
-- Design Name: 
-- Module Name:    hardwin - Behavioral 
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
use work.sbc8816_package.all;
entity hardwin is
    Port ( left : in  STD_LOGIC_VECTOR (7 downto 0);
           top : in  STD_LOGIC_VECTOR (7 downto 0);
           vga_x : in  STD_LOGIC_VECTOR (7 downto 0);
           vga_y : in  STD_LOGIC_VECTOR (7 downto 0);
           active : buffer  STD_LOGIC;
			  matrix : out  STD_LOGIC;
           char : out STD_LOGIC_VECTOR (7 downto 0);
			  index: out STD_LOGIC_VECTOR (2 downto 0);
           win_x : buffer  STD_LOGIC_VECTOR (4 downto 0);	-- 32 cols
           win_y : buffer  STD_LOGIC_VECTOR (4 downto 0);	-- 32 rows
			  switch: in STD_LOGIC_VECTOR (7 downto 0);
           mt_x : in  STD_LOGIC;
           mt_y : in  STD_LOGIC;
           mt_c : in  STD_LOGIC;
           mt_d : in  STD_LOGIC;
           mt_z : in  STD_LOGIC;
           mt_hex : in  STD_LOGIC_VECTOR (3 downto 0));
end hardwin;

architecture Behavioral of hardwin is
type table_1kx8 is array (0 to 1023) of std_logic_vector(8 downto 0);
constant winmask: table_1kx8 := (
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040", 	O"040", 	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040", 	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",  O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"040", 	O"040",	O"040",	O"040", 	O"040",	O"040", 	O"040", 	O"144", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"040", 	O"040",	O"040",	O"040", 	O"040",	O"040", 	O"040", 	O"041", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"040", 	O"040",	O"040",	O"040", 	O"040",	O"040", 	O"040", 	O"046", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"040", 	O"040",	O"040",	O"040", 	O"040",	O"040", 	O"040", 	O"053", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"201",	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040",	O"060", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"060", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"345",	O"040",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"040", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"132",	O"040",	O"040",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"040", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"104",	O"335",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"144",	O"041",	O"040",	O"040",	O"053",	O"053",	O"046",	O"046",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"040", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"103",	O"325",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"040", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"040", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"040", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",
	O"040", 	O"040",	O"040",	O"040", 	O"040", 	O"040", 	O"040", 	O"040", 	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",	O"040",
	O"040", 	O"040",	O"040",	O"040", 	O"007", 	O"007", 	O"007", 	O"007", 	O"040",	O"040",	O"040",	O"040",	O"007",	O"007",	O"007",	O"007",	O"040",	O"040",	O"040",	O"040",	O"007",	O"007",	O"007",	O"007",	O"040",	O"040",	O"040",	O"040",	O"007",	O"007",	O"007",	O"007",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", 	O"000", 	O"000", 	O"000", 	O"000", 	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000"
);

constant bin2ascii: lookup := (
	ascii('0'),	
	ascii('1'),	
	ascii('-'), 	
	ascii('X'),	
	ascii('?'),	
	ascii('?'),	
	ascii('?'),	
	ascii('?'),
	ascii('?'),	
	ascii('?'),	
	ascii('?'),	
	ascii('?'),	
	ascii('?'),	
	ascii('?'),	
	ascii('?'),	
	ascii('?')
);

type table_32x32 is array (0 to 31) of std_logic_vector(31 downto 0);
constant sw_lookup: table_32x32 := (
-- switch 7
	ascii(' ') & ascii(' ') & ascii('1') & ascii('6'),
	ascii(' ') & ascii(' ') & ascii('3') & ascii('2'),
-- switch 6 downto 5
	ascii('b') & ascii('a') & ascii('u') & ascii('d'),
	ascii('u') & ascii('a') & ascii('r') & ascii('t'),
	ascii('r') & ascii('u') & ascii('n') & ascii('0'),
	ascii('r') & ascii('u') & ascii('n') & ascii('1'),
-- switch 4	downto 3
	ascii('p') & ascii('0') & ascii('e') & ascii('0'),
	ascii('p') & ascii('0') & ascii('e') & ascii('1'),
	ascii('p') & ascii('1') & ascii('e') & ascii('0'),
	ascii('p') & ascii('1') & ascii('e') & ascii('1'),
-- not used
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
-- switch 2 downto 0
	ascii('b') & ascii('t') & ascii('n') & ascii('3'),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii('1'),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii('4'),
	ascii(' ') & ascii(' ') & ascii('3') & ascii('2'),
	ascii('1') & ascii('9') & ascii('5') & ascii('k'),
	ascii('3') & ascii('9') & ascii('0') & ascii('k'),
	ascii('7') & ascii('8') & ascii('1') & ascii('k'),
	ascii('1') & ascii('.') & ascii('6') & ascii('M'),
-- not used
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' '),
	ascii(' ') & ascii(' ') & ascii(' ') & ascii(' ')
);

signal winaddr: std_logic_vector(9 downto 0);
signal mask: std_logic_vector(8 downto 0);
signal dx, dy: std_logic_vector(7 downto 0);
signal x_active, y_active: std_logic;
signal h,b: std_logic_vector(3 downto 0);
signal sw_chars: std_logic_vector(31 downto 0);
signal sw_char: std_logic_vector(7 downto 0);
signal sw_off, sw_val: std_logic_vector(4 downto 0);

begin

-- switch status at the bottom 
with win_x(4 downto 3) select sw_off <=
	"00000" when "00",	-- switch 7
	"00010" when "01",	-- switch 6 downto 5
	"00110" when "10",	-- switch 4 downto 3	
	"10000" when others; -- switch 2 downto 0

with win_x(4 downto 3) select sw_val <=
	("0000" & switch(7)) when "00",	-- switch 7
	("000" & switch(6 downto 5)) when "01",	-- switch 6 downto 5
	("000" & switch(4 downto 3)) when "10",	-- switch 4 downto 3	
	("00" & switch(2 downto 0)) when others;  -- switch 2 downto 0

sw_chars <= (X"80808080" xor sw_lookup(to_integer(unsigned(sw_off) + unsigned(sw_val)))) when (mask = O"007") else X"00000000";

with win_x(1 downto 0) select sw_char <=
	sw_chars(31 downto 24) when "00",
	sw_chars(23 downto 16) when "01",
	sw_chars(15 downto 8) when "10",
	sw_chars(7 downto 0) when others;
	
-- window x position on the screen
dx <= std_logic_vector(unsigned(vga_x) - unsigned(left));
win_x <= dx(4 downto 0);
x_active <= '1' when (dx(7 downto 5) = "000") else '0';

-- window y position on the screen
dy <= std_logic_vector(unsigned(vga_y) - unsigned(top));
win_y <= dy(4 downto 0);
y_active <= '1' when (dy(7 downto 5) = "000") else '0';

active <= x_active and y_active;

winaddr <= win_y & win_x;	-- Y:X grid 32*32
mask <= winmask(to_integer(unsigned(winaddr)));
matrix <= '1' when (mask = O"377") else '0';

-- data selection
with mask(5 downto 3) select h <=
	mt_hex when O"0",
	X"F" when others;
	
with mask(5 downto 3) select b <=
	("000" & mt_x) when O"0",	-- display 0/1
	("000" & mt_y) when O"1",	-- display 0/1
	("000" & mt_c) when O"2",	-- display 0/1
	("000" & mt_d) when O"3",	-- display 0/1
	("000" & mt_z) when O"4",	-- display 0/1
	("001" & mt_y) when O"7",	-- display -/X
	X"F" when others;

-- char out
with (active & mask(7 downto 5)) select char <=
	sw_char when "1000",	-- switch status
	mask(7 downto 0) when "1001",	-- direct ASCII
	mask(7 downto 0) when "1010",	-- direct ASCII
	mask(7 downto 0) when "1011",	-- direct ASCII
	hex2ascii(to_integer(unsigned(h))) when "1100",					-- hex lookup
	hex2ascii(to_integer(unsigned(h))) when "1101",					-- hex lookup
	bin2ascii(to_integer(unsigned(b))) when "1110",					-- binary lookup
	bin2ascii(to_integer(unsigned(b))) when "1111",					-- binary lookup
	X"00" when others;

-- color index
with mask(7 downto 4) select index <=
	O"6" when "0010",	-- direct ASCII
	O"6" when "0011",	-- direct ASCII
	O"6" when "0100",	-- direct ASCII
	O"6" when "0101",	-- direct ASCII
	O"6" when "0110",	-- direct ASCII
	O"6" when "0111",	-- direct ASCII
	mask(2 downto 0) when others;
	
end Behavioral;

