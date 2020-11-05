----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/04/2020 06:52:48 PM
-- Design Name: 
-- Module Name: mux3to1_3 - Behavioral
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

entity mux3to1_3 is
	Port (	a		:	in std_logic_vector(2 downto 0);
			b		:	in std_logic_vector(2 downto 0);
			c		:	in std_logic_vector(2 downto 0);
			sel		:	in std_logic_vector(1 downto 0);
			pass	:	out std_logic_vector(2 downto 0) );
end mux3to1_3;

architecture Behavioral of mux3to1_3 is

begin
process(sel)
begin
	case sel is
		when "00" =>
			pass <= a;
		when "01" =>
			pass <= b;
		when "10" =>
			pass <= c;
		when others =>
			pass <= "000";
		end case;
end process;
end Behavioral;
