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

entity hardwin is
    Port ( left : in  STD_LOGIC_VECTOR (7 downto 0);
           top : in  STD_LOGIC_VECTOR (7 downto 0);
           vga_x : in  STD_LOGIC_VECTOR (7 downto 0);
           vga_y : in  STD_LOGIC_VECTOR (7 downto 0);
           active : buffer  STD_LOGIC;
			  matrix : out  STD_LOGIC;
           char : out  STD_LOGIC_VECTOR (7 downto 0);
           index : out  STD_LOGIC_VECTOR (2 downto 0);
           win_x : buffer  STD_LOGIC_VECTOR (4 downto 0);	-- 32 cols
           win_y : buffer  STD_LOGIC_VECTOR (4 downto 0);	-- 32 rows
           mt_x : in  STD_LOGIC;
           mt_y : in  STD_LOGIC;
           mt_hex : in  STD_LOGIC_VECTOR (3 downto 0));
end hardwin;

architecture Behavioral of hardwin is

-- TODO: move to a package
type lookup is array(0 to 15) of std_logic_vector(7 downto 0);
constant hex2ascii: lookup := (
	std_logic_vector(to_unsigned(natural(character'pos('0')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('1')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('2')), 8)), 	
	std_logic_vector(to_unsigned(natural(character'pos('3')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('4')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('5')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('6')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('7')), 8)),
	std_logic_vector(to_unsigned(natural(character'pos('8')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('9')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('A')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('B')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('C')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('D')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('E')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('F')), 8))
);

constant bin2ascii: lookup := (
	std_logic_vector(to_unsigned(natural(character'pos('0')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('1')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('-')), 8)), 	
	std_logic_vector(to_unsigned(natural(character'pos('X')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8)),	
	std_logic_vector(to_unsigned(natural(character'pos('?')), 8))
);

type table_32x32 is array (0 to 1023) of std_logic_vector(8 downto 0);
constant winmask: table_32x32 := (
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"201",	O"201",	O"201",	O"201",	O"000",	O"000",	O"000",	O"302",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",	O"377",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",	O"316",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",
	O"000", 	O"000",	O"000",	O"000", O"000", O"000", O"000", O"000", O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000",	O"000"
);

signal winaddr: std_logic_vector(9 downto 0);
signal mask: std_logic_vector(8 downto 0);
signal dx, dy: std_logic_vector(7 downto 0);
signal x_active, y_active: std_logic;
signal h,b: std_logic_vector(3 downto 0);

begin

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

-- color index
index <= mask(2 downto 0);

-- data selection
with mask(5 downto 3) select h <=
	mt_hex when O"0",
	X"F" when others;
	
with mask(5 downto 3) select b <=
	("000" & mt_x) when O"0",
	("000" & mt_y) when O"1",
	("001" & mt_y) when O"7",
	X"F" when others;

-- char out
with (active & mask(7 downto 6)) select char <=
	mask(7 downto 0) when "100",	-- direct ASCII
	mask(7 downto 0) when "101",	-- direct ASCII
	hex2ascii(to_integer(unsigned(h))) when "110",					-- hex lookup
	bin2ascii(to_integer(unsigned(b))) when "111",					-- binary lookup
	X"00" when others;

end Behavioral;

