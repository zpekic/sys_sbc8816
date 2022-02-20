----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:40 02/13/2022 
-- Design Name: 
-- Module Name:    shiftreg - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
--use work.hexcalc_code.all;

entity shiftregp is
    Port ( clk : in  STD_LOGIC;
           opr : in  STD_LOGIC_VECTOR (2 downto 0);
           so : out  STD_LOGIC;
           si : in  STD_LOGIC;
			  pi : in  STD_LOGIC_VECTOR(31 downto 0);
           hexsel : in  STD_LOGIC_VECTOR (2 downto 0);
           hexout : out  STD_LOGIC_VECTOR (3 downto 0));
end shiftregp;

architecture Behavioral of shiftregp is

signal r: std_logic_vector(31 downto 0) := X"BEEFDEAD";

begin

-- serial outputs
with opr select so <=
	r(31) when "110",
	r(15) when "010",
	r(0) when others;			-- usually LSB is projected out which makes sense to display
		
-- shift and load
on_clk: process(clk, opr, r, si)
begin
	if (rising_edge(clk)) then
		case opr is
			-- load parallel
			when "011" =>
				r(15 downto 0) <= pi(15 downto 0);
			when "111" =>	
				r <= pi;
			-- shift down /2
			when "101" =>	
				r <= si & r(31 downto 1);	
			when "001" =>	
				r(15 downto 0) <= si & r(15 downto 1);	
			-- shift up *2
			when "110" =>
				r <= r(30 downto 0) & si;
			when "010" =>
				r(15 downto 0) <= r(14 downto 0) & si;	
			-- nop
			when others =>
				null;
		end case;
	end if;
end process;

-- hooked up this way as VGA window is going 0 .. 31 left to right
with hexsel select hexout <= 
	r(31 downto 28)	when "000",
	r(27 downto 24)	when "001",
	r(23 downto 20)	when "010",
	r(19 downto 16)	when "011",
	r(15 downto 12)	when "100",
	r(11 downto 8)		when "101",
	r(7 downto 4)		when "110",
	r(3 downto 0)		when "111";

end Behavioral;

