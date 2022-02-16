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
use work.hexcalc_code.all;

entity shiftregp is
    Port ( clk : in  STD_LOGIC;
           opr : in  STD_LOGIC_VECTOR (1 downto 0);
           so : out  STD_LOGIC;
           si : in  STD_LOGIC;
			  pi : in  STD_LOGIC_VECTOR(15 downto 0);
           hexsel : in  STD_LOGIC_VECTOR (1 downto 0);
           hexout : out  STD_LOGIC_VECTOR (3 downto 0));
end shiftregp;

architecture Behavioral of shiftregp is

signal r: std_logic_vector(15 downto 0) := X"BEEF";

begin

-- serial outputs
with opr select so <=
	r(15) when regs_mul2,
	r(0) when others;			-- usually LSB is projected out which makes sense to display
		
-- shift and load
on_clk: process(clk, opr, r, si)
begin
	if (rising_edge(clk)) then
		case opr is
			when regs_load =>
				r <= pi;
			when regs_div2 =>
				r <= si & r(15 downto 1);
			when regs_mul2 =>
				r <= r(14 downto 0) & si;
			when others =>
				null;
		end case;
	end if;
end process;

-- hooked up this way as VGA window is going 0 .. 31 left to right
with hexsel select hexout <= 
	r(15 downto 12)	when "00",
	r(11 downto 8)		when "01",
	r(7 downto 4)		when "10",
	r(3 downto 0)		when "11";

end Behavioral;

