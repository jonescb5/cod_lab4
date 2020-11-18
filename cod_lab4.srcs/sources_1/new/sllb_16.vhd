----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/17/2020 01:13:25 PM
-- Design Name: 
-- Module Name: sllb_16 - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Shift left logical by one byte
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

entity sllb_16 is
	Port (	a_bus   :   in std_logic_vector(15 downto 0);
			c_bus   :   out std_logic_vector(15 downto 0) );
end sllb_16;

architecture Structural of sllb_16 is

begin
	c_bus(7 downto 0) <= x"00";
	c_bus(15 downto 8) <= a_bus(7 downto 0);

end Structural;
