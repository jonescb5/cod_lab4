----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/15/2020 03:18:11 PM
-- Design Name: 
-- Module Name: slt_16_testbench - Behavioral
-- Project Name: 
-- Target Devices: 
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

entity slt_16_testbench is
--  Port ( );
end slt_16_testbench;

architecture Behavioral of slt_16_testbench is
signal SIM_a_bus : std_logic_vector(15 downto 0);
signal SIM_b_bus : std_logic_vector(15 downto 0);
signal SIM_c_bus : std_logic_vector(15 downto 0);
begin

SIM_a_bus <= X"0000", X"00F0" after 10 ns, X"00E0" after 20 ns;
SIM_b_bus <= X"0000", X"00E0" after 10 ns, X"00F0" after 20 ns;

DUT : entity xil_defaultlib.slt_16(Behavioral)
	port map(
			a_bus => SIM_a_bus,
			b_bus => SIM_b_bus,
			c_bus => SIM_c_bus);

end Behavioral;
