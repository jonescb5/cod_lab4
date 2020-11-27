----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/26/2020 07:41:15 PM
-- Design Name: 
-- Module Name: processor_board_implementation - Behavioral
-- Project Name: 
-- Target Devices: Digilent Basys3
-- Tool Versions: 
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
library xil_defaultlib;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity processor_board_implementation is
	generic(
     	DISP_CLK_DIV	: 	integer := 100_000;
	   	SYS_CLK_DIV		: 	integer := 40_000_000
	   	);
	Port (		
		clk_in			: 	in 	std_logic;
		seg				:	out	std_logic_vector(0 to 6);
		dp				:	out	STD_LOGIC;
		an				:	out	STD_LOGIC_VECTOR(3 downto 0);
		btnC			:	in std_logic;
		sw15			:	in std_logic;
		man_clk			:	in std_logic;
		sw				:	in std_logic_vector(8 downto 0);
		disp_mode_a		:	in std_logic;
		disp_mode_b		:	in std_logic;
		led				:	out std_logic_vector(15 downto 0)
		);
end processor_board_implementation;

architecture Behavioral of processor_board_implementation is
signal sys_clk : std_logic;
signal disp_data : std_logic_vector(15 downto 0);
signal disp_clk : std_logic;
signal processor_clk : std_logic;
signal reg_contents : std_logic_vector(127 downto 0);
signal pc_to_disp : std_logic_vector(15 downto 0);
signal reg_to_disp : std_logic_vector(15 downto 0);
signal mem_data_to_disp : std_logic_vector(15 downto 0);
signal regormemdata : std_logic_vector(15 downto 0);

begin

PROCESSOR : entity xil_defaultlib.processor_toplevel(Structural)
	port map(
		clk_in 	=> 	processor_clk,
		reset	=>	btnC,
		PC		=>	pc_to_disp,
		reg_contents	=>	reg_contents,
		mem_disp_access_addr => sw(8 downto 1),
        mem_disp_data => mem_data_to_disp,
        instruction => led
		);

DISPLAY : entity xil_defaultlib.display_driver(Behavioral)
	port map(
		dat_in	=>	disp_data,
		clk_in	=>	disp_clk,
		seg		=>	seg,
		dp		=>	dp,
		an		=>	an
		);
		
SYS_CLK_GEN : entity xil_defaultlib.clock_divider(Behavioral)
	generic map(
		DIVISOR =>	SYS_CLK_DIV
		)
	port map(
		mclk	=>	clk_in,
		sclk	=>	sys_clk
		);
		
DISP_CLK_GEN : entity xil_defaultlib.clock_divider(Behavioral)
	generic map(
		DIVISOR =>	DISP_CLK_DIV
		)
	port map(
		mclk	=>	clk_in,
		sclk	=>	disp_clk
		);
		
CLK_SEL : entity xil_defaultlib.mux2to1_std_logic(Behavioral)
	port map(
		a		=>	sys_clk,
		b		=>	man_clk,
		sel		=>	sw15,
		pass	=>	processor_clk
		);
		
REG_DISP_SEL : entity xil_defaultlib.Mux8to1_16(Behavioral)
	port map(
		a		=>	reg_contents(15 downto 0),
		b		=>	reg_contents(31 downto 16),
		c		=>	reg_contents(47 downto 32),
		d		=>	reg_contents(63 downto 48),
		e		=>	reg_contents(79 downto 64),
		f		=>	reg_contents(95 downto 80),
		g		=>	reg_contents(111 downto 96),
		h		=>	reg_contents(127 downto 112),
		sel		=>	sw(2 downto 0),
		pass	=>	reg_to_disp
		);
		
DISP_DATA_SEL : entity xil_defaultlib.Mux2to1_16(Behavioral)
	port map(
		a		=>	pc_to_disp,
		b		=>	regormemdata,
		sel		=>	disp_mode_a,
		pass	=>	disp_data
		);
		
REG_OR_MEM : entity xil_defaultlib.Mux2to1_16(Behavioral)
	port map(
		a		=>	reg_to_disp,
		b		=>	mem_data_to_disp,
		sel		=>	disp_mode_b,
		pass	=>	regormemdata
		);
end Behavioral;
