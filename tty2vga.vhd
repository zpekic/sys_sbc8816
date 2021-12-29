----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:25:29 11/20/2021 
-- Design Name: 
-- Module Name:    tty2vga - Behavioral 
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

entity tty2vga is
    Port ( reset : in  STD_LOGIC;
           tty_clk : in  STD_LOGIC;
           ascii : in  STD_LOGIC_VECTOR (7 downto 0);
			  ascii_send: in STD_LOGIC;
			  ascii_sent: out STD_LOGIC;
			  cur_clk : in  STD_LOGIC;
           vga_clk : in  STD_LOGIC;
           vga_hsync : out  STD_LOGIC;
           vga_vsync : out  STD_LOGIC;
           vga_r : out  STD_LOGIC_VECTOR (3 downto 0);
           vga_g : out  STD_LOGIC_VECTOR (3 downto 0);
           vga_b : out  STD_LOGIC_VECTOR (3 downto 0);
			  -- for MT8816
			  vga_col: out STD_LOGIC_VECTOR(7 downto 0);
			  vga_row: out STD_LOGIC_VECTOR(7 downto 0);
			  switch_display: in STD_LOGIC;
			  switch_data: in STD_LOGIC;
			  -- debug --
			  debug : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
end tty2vga;

architecture Behavioral of tty2vga is

component tty_screen is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  enable: in STD_LOGIC;
			  ---
           char : in  STD_LOGIC_VECTOR (7 downto 0);
			  char_sent: out STD_LOGIC;
			  ---
			  maxRow: in STD_LOGIC_VECTOR (7 downto 0);
			  maxCol: in STD_LOGIC_VECTOR (7 downto 0);
           mrd : out  STD_LOGIC;
           mwr : out  STD_LOGIC;
           x : out  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0);
			  mready: in STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0);
			  
			  -- not part of real device, used for debugging
           debug : out  STD_LOGIC_VECTOR (31 downto 0)
          );
end component;

component mwvga is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  din: in STD_LOGIC_VECTOR (7 downto 0);
           hactive : buffer  STD_LOGIC;
           vactive : buffer  STD_LOGIC;
           x : out  STD_LOGIC_VECTOR (7 downto 0);
           y : out  STD_LOGIC_VECTOR (7 downto 0);
			  cursor_enable : in  STD_LOGIC;
			  cursor_type : in  STD_LOGIC;
			  color_index: in STD_LOGIC_VECTOR(1 downto 0);
			  -- VGA connections
           rgb : out  STD_LOGIC_VECTOR (11 downto 0);
           hsync : out  STD_LOGIC;
           vsync : out  STD_LOGIC);
end component;

component xyram is
	 generic (maxram: integer;
				 maxrow: integer;
				 maxcol: integer);
    Port ( clk : in  STD_LOGIC;
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           rw_wr : in  STD_LOGIC;
			  rw_rd : in STD_LOGIC;
			  rw_x : in  STD_LOGIC_VECTOR (7 downto 0);
           rw_y : in  STD_LOGIC_VECTOR (7 downto 0);
			  ro_rd: in STD_LOGIC;
           ro_x : in  STD_LOGIC_VECTOR (7 downto 0);
           ro_y : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

signal tty_rd, tty_wr, char_sent, char_sent_delayed: std_logic;
signal tty_memaddr: std_logic_vector(15 downto 0);
signal tty_char, char: std_logic_vector(7 downto 0);

signal vga_hactive, vga_vactive: std_logic;
signal vga_memaddr: std_logic_vector(15 downto 0);
signal vga_char, mem_char: std_logic_vector(7 downto 0);
signal cursor_enable: std_logic;

begin

on_ascii_send: process(ascii_send, ascii, char_sent, char_sent_delayed)
begin
	if ((reset or (char_sent and (not char_sent_delayed))) = '1') then
		char <= X"00";	-- to stop VGA to echo forever
	else
		if (rising_edge(ascii_send)) then
			char <= ascii;
		end if;
	end if;
end process;

on_tty_clk: process(tty_clk, char_sent)
begin
	if (rising_edge(tty_clk)) then
		char_sent_delayed <= char_sent;
	end if;
end process;

ascii_sent <= '1' when (char = X"00") else '0';

--------------------------------------------------------------
-- VGA output, 60 rows * 80 columns
---------------------------------------------------------------
	vga_tty: tty_screen Port map ( 
			reset => reset,
			clk => tty_clk,
			enable => '1',
			char => char,
			char_sent => char_sent,
			---
			maxRow => X"3C", -- 60 rowns
			maxCol => X"50", -- 80 columns
			mrd => tty_rd,
			mwr => tty_wr,
			x => tty_memaddr(7 downto 0),
			y => tty_memaddr(15 downto 8),
			din => vga_char,
			mready => not vga_vactive,
			dout => tty_char,
			-- not part of real device, used for debugging
			debug => debug
		);

-- Allow MT8816 switch matrix to be displayed in 16*16 char block
	vga_char <= mem_char when (switch_display = '0') else ("0011000" & switch_data); -- from v-ram or 0/1
	vga_row <= vga_memaddr(15 downto 8);
	vga_col <= vga_memaddr(7 downto 0);
	
	vga_controller: mwvga 
	port map ( 
		reset => reset,
		clk => vga_clk, 
		din => vga_char,
		hactive => vga_hactive,
		vactive => vga_vactive,
		x => vga_memaddr(7 downto 0),
		y => vga_memaddr(15 downto 8),
		cursor_enable => cursor_enable, 
		cursor_type => '1',	-- just for test
		color_index(1) => '0',
		color_index(0) => not switch_display,
		-- VGA connections
		rgb(3 downto 0) => vga_r,
		rgb(7 downto 4) => vga_g,
		rgb(11 downto 8) => vga_b,
		hsync => vga_hsync,
		vsync => vga_vsync
	);

	cursor_enable <= cur_clk when (tty_memaddr = vga_memaddr) else '0';
	
	vga_ram: xyram 
	generic map (
		maxram => 8192, -- must be >= than maxrow * maxcol
		maxrow => 60,
		maxcol => 80	 
	)
	port map (
		clk => vga_clk,
		din => tty_char,
		rw_wr => tty_wr,
		rw_rd => tty_rd,
		rw_x => tty_memaddr(7 downto 0),	
		rw_y => tty_memaddr(15 downto 8),	
		ro_rd => vga_hactive or vga_vactive,
		ro_x => vga_memaddr(7 downto 0),
		ro_y => vga_memaddr(15 downto 8),
		dout => mem_char
	);


end Behavioral;

