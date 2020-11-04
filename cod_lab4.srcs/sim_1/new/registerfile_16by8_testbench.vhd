----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/04/2020 04:39:17 PM
-- Design Name: 
-- Module Name: registerfile_16by8_testbench - Behavioral
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

entity registerfile_16by8_testbench is
--  Port ( );
end registerfile_16by8_testbench;

architecture Behavioral of registerfile_16by8_testbench is
signal stim_clk : std_logic := '0';
signal stim_write_en : std_logic := '0';
signal stim_addr_a, stim_addr_b, stim_addr_c : std_logic_vector(2 downto 0);
signal stim_data_a, stim_data_b, stim_data_write : std_logic_vector(15 downto 0);

constant clock_period : time := 5 ns;
begin

clock : process(stim_clk)
begin
	stim_clk <= not stim_clk after clock_period / 2;
end process clock;
	

	
	stim_write_en <= '1', '0' after 20 ns;
	stim_addr_c <= "001", "010" after 10 ns;
	stim_data_write <= x"F0F0", x"0F0F" after 10 ns;
	
	stim_addr_a <= "001" after 20 ns, "000" after 30 ns;
	stim_addr_b <= "010" after 20 ns;


DUT : entity xil_defaultlib.registerfile_16by8(Behavioral)
	port map(
				clk					=>	stim_clk,
				reg_addr_a			=>	stim_addr_a,
				reg_addr_b			=>	stim_addr_b,
				reg_addr_c			=>	stim_addr_c,
				reg_data_a			=>	stim_data_a,
				reg_data_b			=>	stim_data_b,
				reg_data_write		=>	stim_data_write,
				reg_write_enable	=>	stim_write_en
			);
				
end Behavioral;
