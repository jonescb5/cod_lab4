----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/01/2020 08:38:09 PM
-- Design Name: 
-- Module Name: zero_check_16_testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 2019.2
-- Description: 
-- 
-- Dependencies: zero_check_16
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

entity zero_check_16_testbench is
--  Port ( );
end zero_check_16_testbench;

architecture Behavioral of zero_check_16_testbench is
signal input	: std_logic_vector(15 downto 0);
signal output	: std_logic;
begin
	
	stimulus : process
		begin
			input <=	"0000000000000000" after 10ns,
						"1000000000000000" after 20ns,
						"0000000000000001" after 30ns,
						"1111111111111111" after 40ns,
						"0111111111111111" after 50ns,
						"1111111111111110" after 60ns;
						
			wait;
		end process stimulus;
		
		DUT : entity xil_defaultlib.zero_check_16(Structural)
				PORT MAP ( input => input, output => output);

end Behavioral;
