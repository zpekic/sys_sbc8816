----------------------------------------------------------------------------------
-- Company: @Home
-- Engineer: zpekic@hotmail.com
-- 
-- Create Date: 12/26/2021 11:13:02 PM
-- Design Name: Switch-based-computer using MT8816
-- Module Name: 
-- Project Name: 
-- Target Devices: https://store.digilentinc.com/anvyl-spartan-6-fpga-trainer-board/
-- Input devices: 
--
-- Tool Versions: ISE 14.7 (nt)
-- Description: https://hackaday.io/projects/hacker/233652
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.99 - Kinda works...
-- Additional Comments:
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sys_sbc8816 is
    Port ( 
	 			-- 100MHz on the Anvyl board
				CLK: in std_logic;
				-- Switches
				-- SW(2 downto 0) -- 
				-- SW(5 downto 3) -- 
				-- SW(7 downto 6) --  
				SW: in std_logic_vector(7 downto 0); 
				-- Push buttons 
				-- BTN0 - 
				-- BTN1 - 
				-- BTN2 - 
				-- BTN3 - 
				BTN: in std_logic_vector(3 downto 0); 
				-- 6 7seg LED digits
				SEG: out std_logic_vector(6 downto 0); 
				AN: out std_logic_vector(5 downto 0); 
				DP: out std_logic; 
				-- 8 single LEDs
				LED: out std_logic_vector(7 downto 0);
				--PMOD interface
				JA1: inout std_logic;	-- Connected to USB2UART
				JA2: inout std_logic;	-- Connected to USB2UART
				JA3: inout std_logic;	-- Connected to USB2UART
				JA4: inout std_logic;	-- Connected to USB2UART
				-- MT8816 OUTPUT ROWS 
				JB1: out std_logic;	-- X0
				JB2: out std_logic;	-- 1
				JB3: out std_logic;	-- 2
				JB4: out std_logic;	-- 3
				JB7: out std_logic;	-- 4
				JB8: out std_logic;	-- 5
				JB9: out std_logic;	-- 6
				JB10: out std_logic;	-- 7
				JC1: out std_logic;	-- 8
				JC2: out std_logic;	-- 9
				JC3: out std_logic;	-- 10
				JC4: out std_logic;	-- 11
				JC7: out std_logic;	-- 12
				JC8: out std_logic;	-- 13
				JC9: out std_logic;	-- 14
				JC10: out std_logic;	-- X15
				-- MT8816 INPUT COLUMNS
				JD1: in std_logic;	-- Y0
				JD2: in std_logic;	-- 1
				JD3: in std_logic;	-- 2
				JD4: in std_logic;	-- 3
				JD7: in std_logic;	-- 4
				JD8: in std_logic;	-- 5
				JD9: in std_logic;	-- 6
				JD10: in std_logic;	-- 7
				JE1: in std_logic;	-- 8
				JE2: in std_logic;	-- 9
				JE3: in std_logic;	-- 10
				JE4: in std_logic;	-- 11
				JE7: in std_logic;	-- 12
				JE8: in std_logic;	-- 13
				JE9: in std_logic;	-- 14
				JE10: in std_logic;	-- Y15
				-- MT8816 control
				BB1: out std_logic;	-- AX0
				BB2: out std_logic;	-- AX1
				BB3: out std_logic;	-- AX2
				BB4: out std_logic;	-- AX3
				BB5: out std_logic;	-- AY0
				BB6: out std_logic;	-- AY1
				BB7: out std_logic;	-- AY2
				BB8: out std_logic;	-- AY3
				BB9: out std_logic;		-- S0
				BB10: out std_logic;		-- S1
				--DIP switches
				DIP_B4, DIP_B3, DIP_B2, DIP_B1: in std_logic;
				DIP_A4, DIP_A3, DIP_A2, DIP_A1: in std_logic;
--				-- Hex keypad
				--KYPD_COL: out std_logic_vector(3 downto 0);
				--KYPD_ROW: in std_logic_vector(3 downto 0);
				-- SRAM --
				--SRAM_CS1: out std_logic;
				--SRAM_CS2: out std_logic;
				--SRAM_OE: out std_logic;
				--SRAM_WE: out std_logic;
				--SRAM_UPPER_B: out std_logic;
				--SRAM_LOWER_B: out std_logic;
				--Memory_address: out std_logic_vector(18 downto 0);
				--Memory_data: inout std_logic_vector(15 downto 0);
				-- Red / Yellow / Green LEDs
				--LDT1G: out std_logic;
				--LDT1Y: out std_logic;
				--LDT1R: out std_logic;
				--LDT2G: out std_logic;
				--LDT2Y: out std_logic;
				--LDT2R: out std_logic;
				-- VGA
				HSYNC_O: out std_logic;
				VSYNC_O: out std_logic;
				RED_O: out std_logic_vector(3 downto 0);
				GREEN_O: out std_logic_vector(3 downto 0);
				BLUE_O: out std_logic_vector(3 downto 0)
				-- TFT
--				TFT_R_O: out std_logic_vector(7 downto 0);
--				TFT_G_O: out std_logic_vector(7 downto 0);
--				TFT_B_O: out std_logic_vector(7 downto 0);
--				TFT_CLK_O: out std_logic;
--				TFT_DE_O: out std_logic;
--				TFT_DISP_O: out std_logic;
--				TFT_BKLT_O: out std_logic;
--				TFT_VDDEN_O: out std_logic;
          );
end sys_sbc8816;

architecture Structural of sys_sbc8816 is

-- Core components
component uart_ser2par is
    Port ( reset : in  STD_LOGIC;
           rxd_clk : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (2 downto 0);
           char : out  STD_LOGIC_VECTOR (7 downto 0);
           ready : buffer  STD_LOGIC;
           valid : out  STD_LOGIC;
           rxd : in  STD_LOGIC);
end component;

component uart_par2ser is
    Port ( reset : in  STD_LOGIC;
			  txd_clk: in STD_LOGIC;
			  send: in STD_LOGIC;
			  mode: in STD_LOGIC_VECTOR(2 downto 0);
			  data: in STD_LOGIC_VECTOR(7 downto 0);
           ready : buffer STD_LOGIC;
           txd : out  STD_LOGIC);
end component;

component mem2hex is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  --
   		  debug: out STD_LOGIC_VECTOR(15 downto 0);
			  --
           nRD : out  STD_LOGIC;
           nBUSREQ : out  STD_LOGIC;
           nBUSACK : in  STD_LOGIC;
           nWAIT : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : in  STD_LOGIC_VECTOR (7 downto 0);
           START : in  STD_LOGIC;
			  BUSY: out STD_LOGIC;
           PAGE : in  STD_LOGIC_VECTOR (7 downto 0);
           COUNTSEL : in  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           CHAR : buffer  STD_LOGIC_VECTOR (7 downto 0));
end component;

component hex2mem is
    Port ( clk : in  STD_LOGIC;
           reset_in : in  STD_LOGIC;
			  reset_out: buffer STD_LOGIC;
			  reset_page: in STD_LOGIC_VECTOR(7 downto 0);
			  --
   		  debug: out STD_LOGIC_VECTOR(15 downto 0);
			  --
           nWR : out  STD_LOGIC;
           nBUSREQ : out  STD_LOGIC;
           nBUSACK : in  STD_LOGIC;
           nWAIT : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : out  STD_LOGIC_VECTOR (7 downto 0);
			  BUSY: out STD_LOGIC;
			  --
			  HEXIN_READY: in STD_LOGIC;
			  HEXIN_CHAR: in STD_LOGIC_VECTOR (7 downto 0);
			  HEXIN_ZERO: buffer STD_LOGIC;
			  --
			  TRACE_ERROR: in STD_LOGIC;
			  TRACE_WRITE: in STD_LOGIC;
			  TRACE_CHAR: in STD_LOGIC;
           ERROR : buffer  STD_LOGIC;
           TXDREADY : in  STD_LOGIC;
			  TXDSEND: out STD_LOGIC;
           TXDCHAR : buffer  STD_LOGIC_VECTOR (7 downto 0));
end component;

-- Misc components
component sn74hc4040 is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(11 downto 0));
end component;

component freqcounter is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           freq : in  STD_LOGIC;
           bcd : in  STD_LOGIC;
			  add: in STD_LOGIC_VECTOR(31 downto 0);
			  cin: in STD_LOGIC;
			  cout: out STD_LOGIC;
           value : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component debouncer8channel is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           signal_raw : in STD_LOGIC_VECTOR (7 downto 0);
           signal_debounced : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component sixdigitsevensegled is
    Port ( -- inputs
			  hexdata : in  STD_LOGIC_VECTOR (23 downto 0);
           digsel : in  STD_LOGIC_VECTOR (2 downto 0);
           showdigit : in  STD_LOGIC_VECTOR (5 downto 0);
           showdot : in  STD_LOGIC_VECTOR (5 downto 0);
           showsegments : in  STD_LOGIC;
			  -- outputs
           anode : out  STD_LOGIC_VECTOR (5 downto 0);
           segment : out  STD_LOGIC_VECTOR (7 downto 0)
			 );
end component;

component tty2vga is
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
			  -- debug only --
			  debug : out STD_LOGIC_VECTOR(31 downto 0)
			  );
end component;
	
type table_8x16 is array (0 to 7) of std_logic_vector(15 downto 0);
constant uartmode_debug: table_8x16 := (
	X"8001",	-- 8N1
	X"8001",
	X"8001",
	X"8001",
	X"8111",	-- 8, parity space, 1 stop
	X"8002",	-- 8, parity mark, 1 == 8, no parity, 2 stop
	X"8101",	-- 8, parity even, 1 stop
	X"8011"	-- 8, parity odd, 1 stop
);

type table_16x16 is array (0 to 15) of std_logic_vector(15 downto 0);
constant decode4to16: table_16x16 := (
	"1111111111111110",
	"1111111111111101",
	"1111111111111011",
	"1111111111110111",
	"1111111111101111",
	"1111111111011111",
	"1111111110111111",
	"1111111101111111",
	"1111111011111111",
	"1111110111111111",
	"1111101111111111",
	"1111011111111111",
	"1110111111111111",
	"1101111111111111",
	"1011111111111111",
	"0111111111111111"
);

constant clk_board: integer := 100000000;

constant sel_hexout: std_logic_vector(1 downto 0) := "00";
constant sel_hexin: std_logic_vector(1 downto 0) := "01";
constant sel_loopback0: std_logic_vector(1 downto 0) := "10";
constant sel_loopback1: std_logic_vector(1 downto 0) := "11";

type prescale_lookup is array (0 to 7) of integer range 0 to 65535;
constant prescale_value: prescale_lookup := (
		(clk_board / (16 * 600)),
		(clk_board / (16 * 1200)),
		(clk_board / (16 * 2400)),
		(clk_board / (16 * 4800)),
		(clk_board / (16 * 9600)),
		(clk_board / (16 * 19200)),
		(clk_board / (16 * 38400)),
		(clk_board / (16 * 57600))
	);

-- Connect to PmodUSBUART 
-- https://digilent.com/reference/pmod/pmodusbuart/reference-manual
alias PMOD_RTS: std_logic is JA1;	
alias PMOD_RXD: std_logic is JA2;
alias PMOD_TXD: std_logic is JA3;
alias PMOD_CTS: std_logic is JA4;	

-- 
signal reset, reset_btn, reset_sw: std_logic;

-- debug
signal showdigit, showdot: std_logic_vector(3 downto 0);
signal led_debug, led_sys, hexin_debug, hexout_debug, baudrate_debug, tty_debug: std_logic_vector(31 downto 0);
signal loopback_char, loopback_src: std_logic_vector(7 downto 0);
signal loopback_send: std_logic;
-- 16*16 matrix on VGA
signal vga_row, vga_col: std_logic_vector(7 downto 0);
signal switch_display: std_logic;
signal switch_data: std_logic;
signal block_row, block_col: std_logic;

--- frequency signals
signal freq_50M: std_logic_vector(11 downto 0);
alias debounce_clk: std_logic is freq_50M(9);
signal freq4096: std_logic;		
signal freq_2048: std_logic_vector(11 downto 0);
signal prescale_baud, prescale_power: integer range 0 to 65535;

-- input by switches and buttons
signal switch_old: std_logic_vector(7 downto 0);
signal switch, button: std_logic_vector(7 downto 0);
alias btn_con is button(0);	-- console
signal switch_sel:	std_logic_vector(1 downto 0);
signal switch_uart_rate: std_logic_vector(2 downto 0);
signal switch_uart_mode: std_logic_vector(2 downto 0);
--signal btn_command, btn_window: std_logic_vector(3 downto 0);
--signal page_sel: std_logic_vector(7 downto 0);
--alias dip_iom: std_logic is DIP_B4; 
--alias dip_traceerror: std_logic is DIP_B3; 
--alias dip_tracewrite: std_logic is DIP_B2; 
--alias dip_tracechar: std_logic is DIP_B1; 
--alias dip_page16k3: std_logic is DIP_A4; 
--alias dip_page16k2: std_logic is DIP_A3; 
--alias dip_page16k1: std_logic is DIP_A2; 
--alias dip_page16k0: std_logic is DIP_A1;

-- MT8816 connections
signal x, x_sys, x_con: std_logic_vector(15 downto 0);
signal y: std_logic_vector(15 downto 0);
signal ctrl, ctrl_sys, ctrl_con: std_logic_vector(9 downto 0);

-- HEX common 
signal baudrate_x1, baudrate_x2, baudrate_x4, baudrate_x8: std_logic;
signal hex_clk: std_logic; 

-- HEX output path
signal tx_send, tx_ready: std_logic;
signal tx_char: std_logic_vector(7 downto 0);
signal hexout_char: std_logic_vector(7 downto 0);
signal hexout_busreq, hexout_busack: std_logic;
signal hexout_ready, hexout_send: std_logic;

-- HEX input path
signal rx_ready, rx_valid: std_logic; 
signal rx_char: std_logic_vector(7 downto 0);
signal hexin_ready, hexin_busy: std_logic;
signal hexin_char: std_logic_vector(7 downto 0);
signal hexin_debug_ready, hexin_debug_send: std_logic;
signal hexin_debug_char: std_logic_vector(7 downto 0);
signal hexin_busreq, hexin_busack: std_logic;


-- TTY
signal tty_sent, tty_send: std_logic;
signal tty_char: std_logic_vector(7 downto 0);
alias tty_clk: std_logic is freq_50M(2); --freq_2048(11);


begin

-- no separate reset button
reset		<= '1' when (BTN = "1111") else '0';
reset_sw	<= '0' when (switch = switch_old) else '1';

-- some configuration
switch_sel <= (DIP_B4 & DIP_A4);
switch_uart_rate <= (DIP_B3 & DIP_B2 & DIP_B1);
switch_uart_mode <= (DIP_A3 & DIP_A2 & DIP_A1);

on_freq4096: process(freq4096, switch)
begin
	if (rising_edge(freq4096)) then
		switch_old <= switch;
	end if;
end process;

-- various clock signal generation
clockgen: sn74hc4040 port map (
			clock => CLK,	-- 100MHz crystal on Anvyl board
			reset => RESET,
			q => freq_50M
		);
		
prescale: process(CLK, baudrate_x8, freq4096, switch_uart_rate)
begin
	if (rising_edge(CLK)) then
		if (prescale_baud = 0) then
			baudrate_x8 <= not baudrate_x8;
			prescale_baud <= prescale_value(to_integer(unsigned(switch_uart_rate)));
		else
			prescale_baud <= prescale_baud - 1;
		end if;
		if (prescale_power = 0) then
			freq4096 <= not freq4096;
			prescale_power <= (clk_board / (2 * 4096));
		else
			prescale_power <= prescale_power - 1;
		end if;
	end if;
end process;

powergen: sn74hc4040 port map (
			clock => freq4096,
			reset => RESET,
			q => freq_2048
		);
	
baudgen: sn74hc4040 port map (
			clock => baudrate_x8,
			reset => RESET,
			q(0) => baudrate_x4, 
			q(1) => baudrate_x2,
			q(2) => baudrate_x1,
			q(11 downto 3) => open		
		);	

	debounce_sw: debouncer8channel Port map ( 
		clock => debounce_clk, 
		reset => RESET,
		signal_raw => SW,
		signal_debounced => switch
	);

	debounce_btn: debouncer8channel Port map ( 
		clock => debounce_clk, 
		reset => RESET,
		signal_raw(7 downto 4) => "0000",
		signal_raw(3 downto 0) => BTN,
		signal_debounced => button
	);
	
counter: freqcounter Port map ( 
		reset => RESET,
      clk => freq_2048(11),
      freq => baudrate_x1,
		bcd => '1',
		add => X"00000001",
		cin => '1',
		cout => open,
      value => baudrate_debug
	);
		
----------------------------------------
-- MT8816
----------------------------------------
JB1 <= x(0);	-- X0
JB2 <= x(1);	-- 1
JB3 <= x(2);	-- 2
JB4 <= x(3);	-- 3
JB7 <= x(4);	-- 4
JB8 <= x(5);	-- 5
JB9 <= x(6);	-- 6
JB10 <= x(7);	-- 7
JC1 <= x(8);	-- 8
JC2 <= x(9);	-- 9
JC3 <= x(10);	-- 10
JC4 <= x(11);	-- 11
JC7 <= x(12);	-- 12
JC8 <= x(13);	-- 13
JC9 <= x(14);	-- 14
JC10 <= x(15);	-- X15

--x <= x_sys when (btn_con = '0') else x_con;

y <= (JE10 & JE9 & JE8 & JE7 & JE4 & JE3 & JE2 & JE1 & JD10 & JD9 & JD8 & JD7 & JD4 & JD3 & JD2 & JD1);

BB1 <= ctrl(0);	-- A0
BB2 <= ctrl(1);
BB3 <= ctrl(2);
BB4 <= ctrl(3);
BB5 <= ctrl(4);
BB6 <= ctrl(5);
BB7 <= ctrl(6);
BB8 <= ctrl(7);	-- A7
BB9 <= ctrl(8);	-- S0
BB10 <= ctrl(9);	-- S1

ctrl <= ctrl_sys when (btn_con = '0') else ctrl_con;
ctrl_sys <= "00" & X"00"; -- NOP for now
ctrl_con(7 downto 0) <= switch;	-- address from the switches
with button(3 downto 1) select ctrl_con(9 downto 8) <=
	"11" when "100",
	"11" when "101",
	"11" when "110",
	"11" when "111",	-- ALL OFF
	"10" when "010",	-- SWITCH OFF
	"01" when "001",	--	SWITCH ON
	"00" when others;	-- NOP

-- Drive X to low one screen row at a time
x <= decode4to16(to_integer(unsigned(vga_row(3 downto 0))));
-- Pick up Y - if switch is on, it will be low
switch_data <= y(to_integer(unsigned(vga_col(3 downto 0))));
-- care for switch data if in a specific 16*16 block on the screen
block_row <= '1' when (vga_row(7 downto 4) = X"1") else '0';
block_col <= '1' when (vga_col(7 downto 4) = X"3") else '0';
switch_display <= block_row and block_col;

----------------------------------------
-- UART input
----------------------------------------
uart_rx: uart_ser2par Port map ( 
		reset => reset, 
		rxd_clk => baudrate_x4,
		mode => switch_uart_mode,
		char => rx_char,
		ready => rx_ready,
		valid => rx_valid,
		rxd => PMOD_TXD
		);

-----------------------------------------
-- UART output
-----------------------------------------
with switch_sel select tx_send <=
	hexout_send when sel_hexout,
	rx_ready when others;
	
with switch_sel select tx_char <=
	hexout_char when sel_hexout,
	rx_char when others;
	
uart_tx: uart_par2ser Port map (
		reset => reset,
		txd_clk => baudrate_x1,
		send => tx_send,
		mode => switch_uart_mode,
		data => tx_char,
		ready => tx_ready,
		txd => PMOD_RXD
		);
		
-- echo to VGA
with switch_sel select tty_char <=
	hexin_debug_char when sel_hexin,	
	X"00" when sel_hexout,		-- not used
	rx_char when others;			-- echo incoming char

with switch_sel select tty_send <=
	hexin_debug_send when sel_hexin,	
	'0' when sel_hexout,			-- not used
	rx_ready when others;		-- echo incoming char
	
tty: tty2vga Port map(
		reset => reset,
		tty_clk => tty_clk,
		ascii => tty_char,
		ascii_send => tty_send,
		ascii_sent => tty_sent,
		cur_clk => freq_2048(10),	-- 2Hz
		vga_clk => freq_50M(1),		-- 25MHz
		vga_hsync => HSYNC_O,
		vga_vsync => VSYNC_O,
		vga_r => RED_O,
		vga_g => GREEN_O,
		vga_b => BLUE_O,
		-- for MT8816
		vga_col => vga_col,
		vga_row => vga_row,
		switch_display => switch_display,
		switch_data => switch_data,
		-- debug
		debug => tty_debug
		);

-- 8 single LEDs
with switch_sel select LED <= 
	tx_char when sel_hexout,
	rx_char when others;

-- 7 seg LED debug display		
with switch_sel select led_sys <= 
	baudrate_debug when sel_loopback0,
	X"0000" & uartmode_debug(to_integer(unsigned(switch_uart_mode))) when sel_loopback1,
	hexout_debug when sel_hexout,
	hexin_debug when sel_hexin;

led_debug <= ("00000101" & X"00" & "000" & ctrl(9) & "000" & ctrl(8 downto 0)) when (btn_con = '1') else led_sys; 
	
led6: sixdigitsevensegled Port map ( 
		-- inputs
		hexdata => led_debug(23 downto 0),
		digsel => freq_2048(3 downto 1),
		showdigit => "111111",
		showdot => led_debug(29 downto 24),
		showsegments => '1',
		-- outputs
		anode => AN,
		segment(6 downto 0) => SEG,
		segment(7) => DP
		);

end;
