----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2020 06:23:51 PM
-- Design Name: 
-- Module Name: PC_adder - Behavioral
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
use IEEE.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_adder is
    Port ( PC_in : in STD_LOGIC_VECTOR (15 downto 0);
           PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end PC_adder;

architecture Behavioral of PC_adder is
begin

    PC_out <= STD_LOGIC_VECTOR(unsigned(PC_in) + 2); 

end Behavioral;
