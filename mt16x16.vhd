----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:51:26 09/01/2022 
-- Design Name: 
-- Module Name:    mt16x16 - Behavioral 
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

entity mt16x16 is
    Port ( reset : in  STD_LOGIC;
           strobe : in  STD_LOGIC;
           cs : in  STD_LOGIC;
           data : in  STD_LOGIC;
           ax : in  STD_LOGIC_VECTOR (3 downto 0);
           ay : in  STD_LOGIC_VECTOR (3 downto 0);
           x : in  STD_LOGIC_VECTOR (15 downto 0);
           y : out  STD_LOGIC_VECTOR (15 downto 0));
end mt16x16;

architecture Behavioral of mt16x16 is

type mt_field is array (0 to 15, 0 to 15) of std_logic;
signal clk, ff: mt_field;

signal xsel, ysel: std_logic_vector(15 downto 0);

begin

xsel <= decode4to16(to_integer(unsigned(ax))) when ((cs and strobe) = '1') else (others => '0');
ysel <= decode4to16(to_integer(unsigned(ay)));-- when ((cs and strobe) = '1') else (others => '0');

gen_y: for j in 0 to 15 generate
	y(j) <= 	(x(15) and ff(j, 15)) or 
				(x(14) and ff(j, 14)) or
				(x(13) and ff(j, 13)) or
				(x(12) and ff(j, 12)) or
				(x(11) and ff(j, 11)) or
				(x(10) and ff(j, 10)) or
				(x( 9) and ff(j,  9)) or
				(x( 8) and ff(j,  8)) or
				(x( 7) and ff(j,  7)) or
				(x( 6) and ff(j,  6)) or
				(x( 5) and ff(j,  5)) or
				(x( 4) and ff(j,  4)) or
				(x( 3) and ff(j,  3)) or
				(x( 2) and ff(j,  2)) or
				(x( 1) and ff(j,  1)) or
				(x( 0) and ff(j,  0));
	gen_x: for i in 0 to 15 generate
		clk(j, i) <= xsel(i) and ysel(j);
		process(reset, data, clk)
			begin
			if (reset = '1') then
					ff(j, i) <= '0';
			else
				if (rising_edge(clk(j, i))) then
					ff(j, i) <= data;
				end if;
			end if;
		end process;
	end generate;
end generate;

end Behavioral;

