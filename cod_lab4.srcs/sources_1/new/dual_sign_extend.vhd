----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/17/2020 03:31:10 PM
-- Design Name: 
-- Module Name: dual_sign_extend - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 2019.2
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

entity dual_sign_extend is
	Port (	imm6	:	in	std_logic_vector(5 downto 0);
			imm9	:	in	std_logic_vector(8 downto 0);
			SESel	:	in	std_logic;
			seimm16	:	out	std_logic_vector(15 downto 0)	 );
end dual_sign_extend;

architecture Structural of dual_sign_extend is
signal seimm6 : std_logic_vector(15 downto 0);
signal seimm9 : std_logic_vector(15 downto 0);

begin

	seimm6(15 downto 6) <= (others => imm6(5));
	seimm6(5 downto 0) <= imm6(5 downto 0);
	
	seimm9(15 downto 9) <= (others => imm9(8));
	seimm9(8 downto 0) <= imm9(8 downto 0);
	
	SE_SELECTOR : ENTITY xil_defaultlib.Mux2to1_16(Behavioral)
		port map(	a 	=> 	seimm6,
					b 	=> 	seimm9,
					sel	=>	SESel,
					pass=>	seimm16
					);
	
end Structural;
