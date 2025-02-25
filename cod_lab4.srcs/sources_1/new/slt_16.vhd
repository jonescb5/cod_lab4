----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/15/2020 02:59:04 PM
-- Design Name: 
-- Module Name: slt_16 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity slt_16 is
	Port ( 	a_bus   :   in std_logic_vector(15 downto 0);
            b_bus   :   in std_logic_vector(15 downto 0);
            c_bus   :   out std_logic_vector(15 downto 0) );
end slt_16;

architecture Behavioral of slt_16 is
signal a_int, b_int : integer;
begin
a_int <= to_integer(signed(a_bus));
b_int <= to_integer(signed(b_bus));

process(a_int, b_int)
begin
	if(a_int < b_int) then
		c_bus <= X"0000";
	else
		c_bus <= X"0001";
	end if;
end process;

end Behavioral;
