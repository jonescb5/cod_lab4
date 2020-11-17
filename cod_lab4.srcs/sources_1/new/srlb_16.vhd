----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/17/2020 12:54:48 PM
-- Design Name: 
-- Module Name: srlb_16 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Shift right logical by one byte
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity srlb_16 is
	Port (	a_bus   :   in std_logic_vector(15 downto 0);
			c_bus   :   out std_logic_vector(15 downto 0) );
end srlb_16;

architecture Structural of srlb_16 is

begin
	c_bus(0) <= a_bus(8);
	c_bus(1) <= a_bus(9);
	c_bus(2) <= a_bus(10);
	c_bus(3) <= a_bus(11);
	c_bus(4) <= a_bus(12);
	c_bus(5) <= a_bus(13);
	c_bus(6) <= a_bus(14);
	c_bus(7) <= a_bus(15);
	c_bus(8 to 15) <= x"00";

end Structural;
