----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/26/2020 09:29:17 PM
-- Design Name: 
-- Module Name: mux2to1_std_logic - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2to1_std_logic is
	Port (	a		: in std_logic;
			b		: in std_logic;
			sel		: in std_logic;
			pass	: out std_logic);
end mux2to1_std_logic;

architecture Behavioral of mux2to1_std_logic is

begin
process(sel,a,b)
begin
	case sel is
		when '0' =>
			pass <= a;
		when '1' =>
			pass <= b;
		when others =>
			pass <= 'X';
		end case;
end process;

end Behavioral;
