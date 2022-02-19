----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:35:42 01/29/2022 
-- Design Name: 
-- Module Name:    keypad4x4 - Behavioral 
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

entity keypad4x4 is
    Port ( clk : in  STD_LOGIC;
           row : in  STD_LOGIC_VECTOR (3 downto 0);
           col : out  STD_LOGIC_VECTOR (3 downto 0);
           hex : out  STD_LOGIC_VECTOR (3 downto 0);
           keypressed : out  STD_LOGIC);
end keypad4x4;

architecture Behavioral of keypad4x4 is

type table_16x8 is array (0 to 15) of std_logic_vector(7 downto 0);
constant kbdmap: table_16x8 := (
	"11100111", -- 0
	"11101110", -- 1
	"11011110", -- 2
	"10111110", -- 3
	"11101101", -- 4
	"11011101", -- 5
	"10111101", -- 6
	"11101011", -- 7
	"11011011", -- 8
	"10111011", -- 9
	"01111110", -- A
	"01111101", -- B
	"01111011", -- C
	"01110111", -- D
	"10110111", -- E
	"11010111"	-- F
);

signal cnt: std_logic_vector(3 downto 0);
signal matrix: std_logic_vector(7 downto 0);
signal keymatch: std_logic;

begin

matrix <= kbdmap(to_integer(unsigned(cnt)));
col <= matrix(7 downto 4);
keymatch <= '1' when (matrix(3 downto 0) = row) else '0'; 

on_keymatch: process(keymatch, cnt)
begin
	if (rising_edge(keymatch)) then
		hex <= cnt;
	end if;
end process;

on_clk:process(clk, cnt)
begin
	if (rising_edge(clk)) then
		cnt <= std_logic_vector(unsigned(cnt) + 1);
	end if;
	if (falling_edge(clk)) then
		keypressed <= keymatch;
	end if;
end process;


end Behavioral;

