----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/01/2020 07:31:06 PM
-- Design Name: 
-- Module Name: sll_16 - Structural
-- Project Name: 
-- Target Devices: Digilent Basys3
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sll_16 is
	Port (	a_bus   :   in std_logic_vector(15 downto 0);
			c_bus   :   out std_logic_vector(15 downto 0) );
end sll_16;

architecture Structural of sll_16 is

begin
	GEN_SLL :	for n in 15 downto 1 generate
				c_bus(n) <= a_bus(n-1);
	end generate GEN_SLL;

	c_bus(0) <= '0';
end Structural;
