----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:42 05/11/2019 
-- Design Name: 
-- Module Name:    mwvga - Behavioral 
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
--use work.tms0800_package.all;

entity mwvga is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  din: in STD_LOGIC_VECTOR (7 downto 0);
           hactive : buffer  STD_LOGIC;
           vactive : buffer  STD_LOGIC;
           x : out  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0);
			  cursor_enable : in  STD_LOGIC;
			  cursor_type : in  STD_LOGIC;
			  color_index: in STD_LOGIC_VECTOR(2 downto 0);
			  -- VGA connections
			  color: out STD_LOGIC_VECTOR(11 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC);
end mwvga;

architecture Behavioral of mwvga is

component chargen_rom is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           d : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

-- basic colors (BBBBGGGGRRRR)
constant color8_black : std_logic_vector(11 downto 0) := X"000"; 
constant color8_red	 : std_logic_vector(11 downto 0) := X"00F"; 
constant color8_green : std_logic_vector(11 downto 0) := X"0F0"; 
constant color8_yellow: std_logic_vector(11 downto 0) := X"0FF"; 
constant color8_blue	 : std_logic_vector(11 downto 0) := X"F00"; 
constant color8_purple: std_logic_vector(11 downto 0) := X"F0F"; 
constant color8_cyan	 : std_logic_vector(11 downto 0) := X"FF0"; 
constant color8_white : std_logic_vector(11 downto 0) := X"FFF"; 

type table8x12 is array(0 to 7) of std_logic_vector(11 downto 0);
constant palette0: table8x12 :=(
-- pixel off
	color8_blue,
	color8_blue,
	color8_black,
	color8_black,
	color8_black,
	color8_black,
	color8_black,
	color8_black
	);
constant palette1: table8x12 := (
-- pixel on
	color8_cyan,
	color8_green,
	color8_red,
	color8_green,
	color8_cyan,
	color8_yellow,
	color8_white,
	color8_purple
	);

signal pattern: std_logic_vector(7 downto 0);
signal hpulse, h, hfp: std_logic_vector(11 downto 0);
signal vpulse, v, vfp: std_logic_vector(11 downto 0);
signal h_clk, v_clk: std_logic;
signal pixel: std_logic;
signal reverse: std_logic;
signal index: STD_LOGIC_VECTOR(2 downto 0);

begin

hsync <= not hpulse(11);
hactive <= hfp(11) and (not h(11));
x <= h(10 downto 3);

vsync <= not vpulse(11);
vactive <= vfp(11) and (not v(11));
y <= v(10 downto 3);

--active <= hactive and vactive;
--rgb <= X"000" when (active = '0') else color;
--color <= palette(to_integer(unsigned(pixel & color_index)));

h_clk <= clk;
h_drive: process(reset, h_clk)
begin
	if (reset = '1') then
		hfp <= X"00F";
	else
		if (rising_edge(h_clk)) then
			--index <= color_index;
			if (hfp = X"00F") then
				hpulse <= X"FA0"; -- -96
				h <= X"F70";		-- -(96 + 48)
				hfp <= X"CF0";		-- 16 - 800
			else
				hpulse <= std_logic_vector(unsigned(hpulse) + 1);
				h <= std_logic_vector(unsigned(h) + 1);
				hfp <= std_logic_vector(unsigned(hfp) + 1);
			end if;
		end if;
		-- prevent any change outside of pixel periods
		if (falling_edge(h_clk)) then
			if (pixel = '1') then
				color <= palette1(to_integer(unsigned(color_index)));
			else
				color <= palette0(to_integer(unsigned(color_index)));
			end if;
			--color <= palette(to_integer(unsigned(pixel & color_index)));
		end if;
	end if;
end process;

v_clk <= hfp(11); -- generate pulse at the end of horizontal line
v_drive: process(reset, v_clk)
begin
	if (reset = '1') then
		vfp <= X"009";
	else
		if (rising_edge(v_clk)) then
			if (vfp = X"009") then
				vpulse <= X"FFE"; 	-- -2
				v <= X"FDD";			-- -(2 + 33)
				vfp <= X"DFD";			-- 10 - 525
			else
				vpulse <= std_logic_vector(unsigned(vpulse) + 1);
				v <= std_logic_vector(unsigned(v) + 1);
				vfp <= std_logic_vector(unsigned(vfp) + 1);
			end if;
		end if;
	end if;
end process;

reverse <= cursor_enable and ((cursor_type and v(2) and v(1)) or (not cursor_type));

chargen: chargen_rom port map (
		a(10) => (din(7) xor reverse),		-- invert the pattern based on cursor / char code 128-255
		a(9 downto 3) => din(6 downto 0),	-- 128 chars
		a(2 downto 0) => v(2 downto 0),		-- 8 rows per char
		d => pattern
	);
	
with h(2 downto 0) select
	pixel <= pattern(7) when "000",
				pattern(6) when "001",
				pattern(5) when "010",
				pattern(4) when "011",
				pattern(3) when "100",
				pattern(2) when "101",
				pattern(1) when "110",
				pattern(0) when "111";

end Behavioral;

