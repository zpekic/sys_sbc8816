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
use work.sbc8816_package.all;
use work.hexcalc_code.all;

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
				JF1: buffer std_logic;	-- RESET
				--
				BB1: buffer std_logic;	-- AX0
				BB2: buffer std_logic;	-- AX1
				BB3: buffer std_logic;	-- AX2
				BB4: buffer std_logic;	-- AX3
				BB5: buffer std_logic;	-- AY0
				BB6: buffer std_logic;	-- AY1
				BB7: buffer std_logic;	-- AY2
				BB8: buffer std_logic;	-- DATA
				BB9: buffer std_logic;	-- STROBE0
				BB10: buffer std_logic;	-- STROBE1
				--DIP switches
				DIP_B4, DIP_B3, DIP_B2, DIP_B1: in std_logic;
				DIP_A4, DIP_A3, DIP_A2, DIP_A1: in std_logic;
--				-- Hex keypad
				KYPD_COL: out std_logic_vector(3 downto 0);
				KYPD_ROW: in std_logic_vector(3 downto 0);
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
				LDT1G: out std_logic;
				LDT1Y: out std_logic;
				LDT1R: out std_logic;
				LDT2G: out std_logic;
				LDT2Y: out std_logic;
				LDT2R: out std_logic;
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

component hexcalc is
    Port ( -- GENERIC
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  status : out STD_LOGIC_VECTOR(1 downto 0);
			  mode32: in STD_LOGIC;
			  -- DEBUG
   		  dbg: out STD_LOGIC_VECTOR(23 downto 0);
   		  dbg_row: out STD_LOGIC_VECTOR(3 downto 0);
   		  dbg_col: out STD_LOGIC_VECTOR(3 downto 0);
   		  dbg_reg: buffer STD_LOGIC_VECTOR(3 downto 0);
			  button: in STD_LOGIC;
			  -- MATRIX CONTROL
			  mt_ctrl: out STD_LOGIC_VECTOR(9 downto 0);
			  -- MATRIX DATA
			  mt_x: out STD_LOGIC_VECTOR(15 downto 0);
			  mt_y: in STD_LOGIC_VECTOR(15 downto 0);
			  -- INSTRUCTION
			  input: in STD_LOGIC_VECTOR(7 downto 0);
			  -- FLAGS
			  c_flag: buffer STD_LOGIC;
			  d_flag: buffer STD_LOGIC;
			  daa_flag: buffer STD_LOGIC;
			  z_flags: buffer STD_LOGIC_VECTOR(15 downto 0);
			  -- TRACING
			  TRACE_INPUT: in STD_LOGIC;
			  TRACE_RESULT: in STD_LOGIC;
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
			  color_index: in STD_LOGIC_VECTOR(2 downto 0);
           vga_clk : in  STD_LOGIC;
           vga_hsync : out  STD_LOGIC;
           vga_vsync : out  STD_LOGIC;
           vga_color : out  STD_LOGIC_VECTOR (11 downto 0);
			  -- for system hardware window
			  vga_x: out STD_LOGIC_VECTOR(7 downto 0);
			  vga_y: out STD_LOGIC_VECTOR(7 downto 0);
			  win_char: in STD_LOGIC_VECTOR(7 downto 0);
			  -- debug only --
			  debug : out STD_LOGIC_VECTOR(31 downto 0)
			  );
end component;
	
component hardwin is
    Port ( left : in  STD_LOGIC_VECTOR (7 downto 0);
           top : in  STD_LOGIC_VECTOR (7 downto 0);
           vga_x : in  STD_LOGIC_VECTOR (7 downto 0);
           vga_y : in  STD_LOGIC_VECTOR (7 downto 0);
           active : out  STD_LOGIC;
			  matrix : out  STD_LOGIC;
           char : out  STD_LOGIC_VECTOR (7 downto 0);
			  index: out STD_LOGIC_VECTOR(2 downto 0);
           win_x : out  STD_LOGIC_VECTOR (4 downto 0);
           win_y : out  STD_LOGIC_VECTOR (4 downto 0);
  			  switch: in STD_LOGIC_VECTOR (7 downto 0);
           mt_x : in  STD_LOGIC;
           mt_y : in  STD_LOGIC;
           mt_c : in  STD_LOGIC;
           mt_d : in  STD_LOGIC;
			  mt_daa:in  STD_LOGIC;
           mt_z : in  STD_LOGIC;
           mt_hex : in  STD_LOGIC_VECTOR (3 downto 0));
end component;
	
component keypad4x4 is
    Port ( clk : in  STD_LOGIC;
           row : in  STD_LOGIC_VECTOR (3 downto 0);
           col : out  STD_LOGIC_VECTOR (3 downto 0);
           hex : out  STD_LOGIC_VECTOR (3 downto 0);
           keypressed : out  STD_LOGIC);
end component;
	
component tracer is
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

constant clk_board: integer := 100000000;

------------------------------------------------------------
--	Display on: LED TTY UART
------------------------------------------------------------
constant mode_st_tr_hc: std_logic_vector(1 downto 0) := "11";
constant mode_st_hc_tr: std_logic_vector(1 downto 0) := "10";
constant mode_ua_lb_lb: std_logic_vector(1 downto 0) := "01";
constant mode_bd_lb_lb: std_logic_vector(1 downto 0) := "00";

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
signal reset, reset_btn: std_logic;

-- debug
signal showdigit, showdot: std_logic_vector(5 downto 0);
signal led_data: std_logic_vector(23 downto 0);
signal led_dot: std_logic_vector(5 downto 0);
signal tr_enable, tr_txdready: std_logic;
--signal digit: std_logic_vector(3 downto 0);

-- VGA
signal vga_x, vga_y: std_logic_vector(7 downto 0);

-- 32*32 matrix on VGA
signal win_x, win_y: std_logic_vector(4 downto 0);
signal win_active, win_matrix: std_logic;
signal win_char, win_char_x: std_logic_vector(7 downto 0);
signal color_index, win_index: std_logic_vector(2 downto 0);

--- frequency signals
signal freq_50M: std_logic_vector(11 downto 0);
alias dot_clk: std_logic is freq_50M(1);
alias debounce_clk: std_logic is freq_50M(9);
signal freq4096: std_logic;		
signal freq_2048: std_logic_vector(11 downto 0);
alias freq1: std_logic is freq_2048(11);
alias freq2: std_logic is freq_2048(10);
alias freq128: std_logic is freq_2048(4);
signal mt_cnt, ss_cnt: std_logic_vector(1 downto 0);
signal phi0, phi1, phi2, phi3: std_logic;
signal prescale_baud, prescale_power: integer range 0 to 65535;
signal counter_value: std_logic_vector(31 downto 0);

-- input by switches and buttons
signal switch: std_logic_vector(7 downto 0);
alias sw_32: std_logic is switch(7);
alias sw_mode: std_logic_vector(1 downto 0) is switch(6 downto 5);
alias sw_traceinput: std_logic is switch(4);
alias sw_traceresult: std_logic is switch(3);
alias sw_clksel: std_logic_vector(2 downto 0) is switch(2 downto 0);

signal button: std_logic_vector(3 downto 0);
signal dip_uart_rate: std_logic_vector(2 downto 0);
signal dip_uart_mode: std_logic_vector(2 downto 0);

-- keypad and input
signal kypd_keypressed, input_clear, key, key_delayed: std_logic;
signal keypad_row, kypd_hex: std_logic_vector(3 downto 0);
alias kypd_shift: std_logic is button(3);
signal input: std_logic_vector(7 downto 0);

-----------------------------------------------------------------
-- Calculator commands, each is a single ASCII char
-----------------------------------------------------------------
type table_32x8 is array(0 to 31) of std_logic_vector(7 downto 0);
constant kypd2ascii: table_32x8 := (
	-- no "shift", entering hex digits into TOS
	c('0'),
	c('1'),
	c('2'),
	c('3'),
	c('4'),
	c('5'),
	c('6'),
	c('7'),
	c('8'),
	c('9'),
	c('A'),
	c('B'),
	c('C'),
	c('D'),
	c('E'),
	c('F'),
	-- with "shift", entering a command
	c('Z'),	-- 0 == zero TOS
	c('U'),	-- 1 == dUp(licate)
	c('$'),	-- 2 == BCD to binary
	c('#'),	-- 3 == binary to BCD
	c('R'),	-- 4 == rotate registers
	X"00",	-- 5 == not used
	X"00",	-- 6 == not used
	c('N'),	-- 7 == nuke all
	X"00",	-- 8 == not used
	X"00",	-- 9 == not used
	c('+'),	-- A == add
	c('-'),	-- B == subtract
	c('*'),	-- C == multiply
	c('/'),	-- D == divide	
	X"0D",	-- E == enter
	c('S')  -- F == swap
);

-- HC (hexcalc core) connections
signal hc_status: std_logic_vector(1 downto 0);
constant status_ready: std_logic_vector(1 downto 0) := "00";
constant status_done: std_logic_vector(1 downto 0) := "01";
constant status_busy: std_logic_vector(1 downto 0) := "10";
constant status_busy_using_mt: std_logic_vector(1 downto 0) := "11";
signal hc_tos: std_logic_vector(31 downto 0); -- capture value of TOS (R0)
signal hc_txdsend, hc_txdready, hc_error, hc_clk, hc_clk_uart: std_logic := '0';
signal hc_txdchar: std_logic_vector(7 downto 0);
signal hc_mt_x: std_logic_vector(15 downto 0);
signal hc_reg: std_logic_vector(3 downto 0);
signal hc_delay, hc_carry, hc_daa: std_logic;	-- calculator internal flags
signal hc_zero: std_logic_vector(15 downto 0);
signal hc_dbg, hc_led: std_logic_vector(23 downto 0);

-- MT8816 connections
signal mt_mode_seldisplay: std_logic;
signal mt_switch_state: std_logic;
alias mt_mode_selsys: std_logic is button(3);
signal mt_x: std_logic_vector(15 downto 0);
signal mt_y: std_logic_vector(15 downto 0);
signal hc_mt_ctrl, co_mt_ctrl, mt_ctrl: std_logic_vector(9 downto 0);
alias MT_AX0: std_logic is BB1;
alias MT_AX1: std_logic is BB2;
alias MT_AX2: std_logic is BB3;
alias MT_AX3: std_logic is BB4;
alias MT_AY0: std_logic is BB5;
alias MT_AY1: std_logic is BB6;
alias MT_AY2: std_logic is BB7;
alias MT_DATA: std_logic is BB8;
alias MT_STROBE0: std_logic is BB9;
alias MT_STROBE1: std_logic is BB10;
alias MT_RESET: std_logic is JF1;

-- UART common 
signal baudrate_x1, baudrate_x2, baudrate_x4, baudrate_x8: std_logic;
signal hex_clk: std_logic; 

-- UART TX output path
signal tx_send, tx_sent: std_logic;
signal tx_char: std_logic_vector(7 downto 0);

-- UART RX input path
signal rx_ready, rx_valid: std_logic; 
signal rx_char: std_logic_vector(7 downto 0);

-- TTY
signal tty_sent, tty_send: std_logic;
signal tty_char: std_logic_vector(7 downto 0);
alias tty_clk: std_logic is freq_50M(2); --freq_2048(11);

-- Microcode tracer
signal tr_txdsent, tr_txdsend: std_logic;
signal tr_txdchar: std_logic_vector(7 downto 0);

begin

-- no separate reset button
reset		<= '1' when (BTN = "1111") else '0';
--reset_sw	<= '0' when (switch = switch_old) else '1';

-- some configuration
dip_uart_rate <= (DIP_B3 & DIP_B2 & DIP_B1);
dip_uart_mode <= (DIP_A3 & DIP_A2 & DIP_A1);

-- various clock signal generation
clockgen: sn74hc4040 port map (
			clock => CLK,	-- 100MHz crystal on Anvyl board
			reset => RESET,
			q => freq_50M
		);
		
prescale: process(CLK, baudrate_x8, freq4096, dip_uart_rate)
begin
	if (rising_edge(CLK)) then
		if (prescale_baud = 0) then
			baudrate_x8 <= not baudrate_x8;
			prescale_baud <= prescale_value(to_integer(unsigned(dip_uart_rate)));
		else
			prescale_baud <= prescale_baud - 1;
		end if;
		if (prescale_power = 0) then
			freq4096 <= not freq4096;
			prescale_power <= (clk_board / (2 * 4096));
		else
			prescale_power <= prescale_power - 1;
			key_delayed <= key;
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
		signal_raw(7 downto 4) => KYPD_ROW,
		signal_raw(3 downto 0) => BTN,
		signal_debounced(7 downto 4) => keypad_row,
		signal_debounced(3 downto 0) => button
	);
	
counter: freqcounter Port map ( 
		reset => RESET,
      clk => freq1,
      freq => baudrate_x1,
		bcd => '1',
		add => X"00000001",
		cin => '1',
		cout => open,
      value => counter_value
	);
		
----------------------------------------
-- MT8816
----------------------------------------
JB1 <= 	mt_x(0);	-- X0
JB2 <= 	mt_x(1);	-- 1
JB3 <= 	mt_x(2);	-- 2
JB4 <= 	mt_x(3);	-- 3
JB7 <= 	mt_x(4);	-- 4
JB8 <= 	mt_x(5);	-- 5
JB9 <= 	mt_x(6);	-- 6
JB10 <=	mt_x(7);	-- 7
JC1 <= 	mt_x(8);	-- 8
JC2 <= 	mt_x(9);	-- 9
JC3 <= 	mt_x(10);	-- 10
JC4 <= 	mt_x(11);	-- 11
JC7 <= 	mt_x(12);	-- 12
JC8 <= 	mt_x(13);	-- 13
JC9 <= 	mt_x(14);	-- 14
JC10 <= 	mt_x(15);	-- X15

-- Drive X 
-- for screen, one row active at a time
mt_x <= hc_mt_x when ((hc_status = STATUS_busy_using_mt) or (win_matrix = '0')) else decode4to16(to_integer(unsigned(win_y(3 downto 0))));

-- Pick up Y
mt_y <= (JE10 & JE9 & JE8 & JE7 & JE4 & JE3 & JE2 & JE1 & JD10 & JD9 & JD8 & JD7 & JD4 & JD3 & JD2 & JD1);

-- control bus ('Z' with external 4k7 resistor and pull-up mode give 0.26V low and 5.0V hi)
MT_AX0 <= 'Z' when (mt_ctrl(0) = '1') else '0';
MT_AX1 <= 'Z' when (mt_ctrl(1) = '1') else '0';
MT_AX2 <= 'Z' when (mt_ctrl(2) = '1') else '0';	
MT_AX3 <= 'Z' when (mt_ctrl(3) = '1') else '0';
MT_AY0 <= 'Z' when (mt_ctrl(4) = '1') else '0';	
MT_AY1 <= 'Z' when (mt_ctrl(5) = '1') else '0';
MT_AY2 <= 'Z' when (mt_ctrl(6) = '1') else '0';
MT_DATA <= 'Z' when (mt_ctrl(8) = '1') else '0';
MT_STROBE0 <= 'Z' when ((phi1 and (mt_ctrl(8) or mt_ctrl(9)) and (not mt_ctrl(7))) = '1') else '0'; 
MT_STROBE1 <= 'Z' when ((phi1 and (mt_ctrl(8) or mt_ctrl(9)) and mt_ctrl(7)) = '1') else '0'; 
MT_RESET <= 'Z' when ((mt_ctrl(8) and mt_ctrl(9)) = '1') else '0'; 

with sw_mode select mt_ctrl <= 
		hc_mt_ctrl when mode_st_tr_hc,		-- from hexcalc
		hc_mt_ctrl when mode_st_hc_tr,		-- from hexcalc
		co_mt_ctrl when others;					-- from console

---- console command 
co_mt_ctrl(7 downto 0) <= input;	
with BTN(2 downto 0) select co_mt_ctrl(9 downto 8) <=
	"11" when "100",
	"11" when "101",
	"11" when "110",
	"11" when "111",	-- ALL OFF
	"10" when "010",	-- SWITCH OFF
	"01" when "001",	--	SWITCH ON
	"00" when others;	-- NOP

-- select the clock
with sw_clksel select mt_cnt <= 
	ss_cnt	when "000",	-- single step
	freq_2048(9 downto 8) when "001",	-- 4Hz
	freq_2048(7 downto 6) when "010",	-- 16Hz
	freq_2048(5 downto 4) when "011",	-- 64Hz
	freq_50M(8 downto 7) when "100",		-- 0.195312
	freq_50M(7 downto 6) when "101",		-- 0.390625
	freq_50M(6 downto 5) when "110",		-- 0.781250
	freq_50M(5 downto 4) when others;	-- 1.5625MHz
	
-- 4 phase clock to activate strobe at right time
phi0 <= '1' when (mt_cnt = "00") else '0';
phi1 <= '1' when (mt_cnt = "01") else '0';
phi2 <= '1' when (mt_cnt = "10") else '0';
phi3 <= '1' when (mt_cnt = "11") else '0';

-- single step cnt
on_button3: process(button(3), ss_cnt)
begin
	if (rising_edge(button(3))) then
		ss_cnt <= std_logic_vector(unsigned(ss_cnt) + 1);
	end if;
end process;

-- lame attempt at clock sync
hc_clk <= '1' when (hc_clk_uart = '1') else phi0;

on_phi0: process(phi0, hc_txdsend, hc_txdready)
begin
	if (rising_edge(phi0)) then
		hc_clk_uart <= hc_txdsend and (not hc_txdready);
	end if;
end process;

hc: hexcalc Port map (
			clk => hc_clk,
			reset => reset,
			status => hc_status,
			mode32 => sw_32,
			--
			dbg => hc_dbg,
			dbg_row => win_y(3 downto 0),
			dbg_col => win_x(3 downto 0),
			dbg_reg => hc_reg,
			button => btn(0),
			--
			mt_ctrl => hc_mt_ctrl,
			mt_x => hc_mt_x,
			mt_y => mt_y,
			--
			input => input,
			--
			c_flag => hc_carry,
			d_flag => hc_delay,
			daa_flag => hc_daa,
			z_flags => hc_zero,
			--
			TRACE_INPUT => sw_traceinput,
			TRACE_RESULT  => sw_traceresult,
			ERROR => hc_error,
			TXDREADY => hc_txdready,
			TXDSEND => hc_txdsend,
			TXDCHAR => hc_txdchar
		);

tr: tracer Port map ( 
			reset => reset,
			clk => baudrate_x1,
			uart_data => tr_txdchar,
			uart_send => tr_txdsend,
			uart_ready => tr_txdready,
			dev_data => hc_txdchar,
			dev_send => hc_txdsend,
			dev_ready => open, --hc_txdready,
			trigger => phi0,
			enable => tr_enable,
--			debug(15 downto 8) => hc_dbg(23 downto 16),	-- instruction register (== input char)
			debug(15 downto 8) => hc_dbg(15 downto 8),	-- loop and bit counters
			debug(7 downto 0) => hc_dbg(7 downto 0),		-- microinstruction address
			inp_char => input,		-- character to process (== instruction register)
			ext_char => hc_txdchar	-- what CPU would output
		);
		
tr_enable <= '0' when (hc_status = STATUS_READY) else (not sw_clksel(2));

-- catch stacktop appearing to display it on the 7seg LED
on_dot_clk: process(dot_clk, win_x, win_y, hc_reg)	-- TODO - improve this mess!
begin
	if (rising_edge(dot_clk)) then
		if (win_y = "00000") then
			case win_x is
				when "00010" =>
					hc_tos(23 downto 20) <= hc_reg;
				when "00011" =>
					hc_tos(19 downto 16) <= hc_reg;
				when "00100" =>
					hc_tos(15 downto 12) <= hc_reg;
				when "00101" =>
					hc_tos(11 downto 8) <= hc_reg;
				when "00110" =>
					hc_tos(7 downto 4) <= hc_reg;
				when "00111" =>
					hc_tos(3 downto 0) <= hc_reg;
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

-----------------------------------------
-- UART output
-----------------------------------------	
with sw_mode select hc_txdready <= 
		tx_sent when mode_st_tr_hc,		
		tty_sent when mode_st_hc_tr,
		'1' when others;

with sw_mode select tr_txdready <= 
		tty_sent when mode_st_tr_hc,		
		tx_sent when mode_st_hc_tr,
		'1' when others;

uart_tx: uart_par2ser Port map (
		reset => reset,
		txd_clk => baudrate_x1,
		send => tx_send,
		mode => dip_uart_mode,
		data => tx_char,
		ready => tx_sent,
		txd => PMOD_RXD
		);

with sw_mode select tx_char <= 
		hc_txdchar when mode_st_tr_hc,		
		tr_txdchar when mode_st_hc_tr,
		input when mode_ua_lb_lb,
		input when mode_bd_lb_lb;

with sw_mode select tx_send <= 
		hc_txdsend when mode_st_tr_hc,		
		tr_txdsend when mode_st_hc_tr,
		key_delayed when mode_ua_lb_lb,
		key_delayed when mode_bd_lb_lb;
		
---------------------------------------
-- TTY output (writes to VGA)
---------------------------------------
tty: tty2vga Port map(
		reset => reset,
		tty_clk => tty_clk,
		ascii => tty_char,
		ascii_send => tty_send,
		ascii_sent => tty_sent,
		cur_clk => freq2,		-- 2Hz
		color_index => color_index,
		vga_clk => dot_clk,	-- 25MHz
		vga_hsync => HSYNC_O,
		vga_vsync => VSYNC_O,
		vga_color(11 downto 8) => BLUE_O,
		vga_color(7 downto 4) => GREEN_O,
		vga_color(3 downto 0) => RED_O,
		-- for system hardware window
		vga_x => vga_x,
		vga_y => vga_y,
		win_char => win_char_x,
		-- debug
		debug => open
		);
		
-- if in 16-bit mode, simply chop off first four columns from hardware window (register bits 31..16)
win_char_x <= X"00" when ((sw_32 = '0') and (win_x(4 downto 2) = "000")) else win_char;
color_index <= O"0" when (win_char_x = X"00") else win_index;
--color_index <= win_index when (win_active = '1') else O"0";

with sw_mode select tty_char <= 
		tr_txdchar when mode_st_tr_hc,		
		hc_txdchar when mode_st_hc_tr,
		input when mode_ua_lb_lb,
		input when mode_bd_lb_lb;

with sw_mode select tty_send <= 
		tr_txdsend when mode_st_tr_hc,		
		hc_txdsend when mode_st_hc_tr,
		key_delayed when mode_ua_lb_lb,
		key_delayed when mode_bd_lb_lb;

-- hardware window that shows the system state
win: hardwin Port map( 
		left => X"20", -- col 32, TODO make it dynamic
		top  => X"10",	-- row 16, TODO make it dynamic
		vga_x => vga_x,
		vga_y => vga_y,
		active => win_active,
		matrix => win_matrix,
		char	 => win_char,
		index	 => win_index,
		win_x  => win_x,
		win_y  => win_y,
		switch => switch, -- display the modes in the last row of the window
		mt_x   => hc_mt_x(to_integer(unsigned(win_y(3 downto 0)))),
		mt_y   => mt_y(to_integer(unsigned(win_x(3 downto 0)))),
		mt_c	 => hc_carry,
		mt_d	 => hc_delay, 
		mt_daa => hc_daa,
		mt_z	 => hc_zero(to_integer(unsigned(win_y(3 downto 0)))),
		mt_hex => hc_reg
		);

-- 8 single LEDs
--LED <= mt_ctrl(7 downto 0);
LED <= hc_zero(7 downto 0);
--LED <= kypd_keypressed & "000" & kypd_hex;

-- traffic light LEDs
LDT1G <= hc_status(1);
LDT1Y <= mt_cnt(1);
LDT1R <= mt_ctrl(9);
LDT2G <= hc_status(0);
LDT2Y <= mt_cnt(0);
LDT2R <= mt_ctrl(8);

-- 7 seg LED debug display	
showdigit <= "000000" when ((hc_error and freq2) = '1') else "111111"; -- flash LEDs on error!		
led6: sixdigitsevensegled Port map ( 
		-- inputs
		hexdata => led_data,
		digsel => freq_2048(3 downto 1),
		showdigit => showdigit,
		showdot => led_dot,
		showsegments => '1',
		-- outputs
		anode => AN,
		segment(6 downto 0) => SEG,
		segment(7) => DP
		);

hc_led <= hc_dbg when (sw_clksel(2) = '0') else hc_tos(23 downto 0);  -- in "slow" clock mode, display microcode debug on LED

with sw_mode select led_data <= 
		X"00" & uartmode_debug(to_integer(unsigned(dip_uart_mode))) when mode_ua_lb_lb,
		counter_value(23 downto 0) when mode_bd_lb_lb,
		hc_led when others;

with sw_mode select led_dot <= 
		"001111" when mode_ua_lb_lb,
		"000001" when mode_bd_lb_lb,
		"000000" when others;

--------------------------------------------
-- input either from hex keypad or from UART
--------------------------------------------
uart_rx: uart_ser2par Port map ( 
		reset => reset, 
		rxd_clk => baudrate_x4,
		mode => dip_uart_mode,
		char => rx_char,
		ready => rx_ready,
		valid => rx_valid,
		rxd => PMOD_TXD
		);

kypd: keypad4x4 Port map ( 
		clk => freq128,
		row => keypad_row, --KYPD_ROW,
		col => KYPD_COL,
		hex => kypd_hex,
		keypressed => kypd_keypressed
		);
		
key <= rx_ready or kypd_keypressed;
input_clear <= '1' when (hc_status = status_done) else reset;

on_key: process(key, kypd_hex, kypd_shift, rx_char, input_clear)
begin
	if (input_clear = '1') then
		input <= X"00";
	else
		if (rising_edge(key)) then
			if (kypd_keypressed = '1') then
				input <= kypd2ascii(to_integer(unsigned(kypd_shift & kypd_hex)));
				--input <= kypd_shift & "000" & kypd_hex;
			else
				input <= rx_char;
			end if;
		end if;
	end if;
end process;


end;
