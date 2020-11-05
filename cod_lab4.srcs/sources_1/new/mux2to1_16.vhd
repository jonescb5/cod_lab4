----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/05/2020 02:13:25 PM
-- Design Name: 
-- Module Name: mux2to1_16 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2to1_16 is
	Port (	a		: in std_logic_vector(15 downto 0);
			b		: in std_logic_vector(15 downto 0);
			sel		: in std_logic;
			pass	: out std_logic_vector(15 downto 0)
			);
end mux2to1_16;

architecture Behavioral of mux2to1_16 is

begin
process(sel,a,b)
begin
	case sel is
		when '0' =>
			pass <= a;
		when '1' =>
			pass <= b;
		when others =>
			pass <= "XXXXXXXXXXXXXXXX";
		end case;
end process;

end Behavioral;
