----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/02/2020 03:04:40 PM
-- Design Name: 
-- Module Name: Mux8to1_16 - Behavioral
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

entity Mux8to1_16 is
	Port (	a	: in std_logic_vector(15 downto 0);
			b	: in std_logic_vector(15 downto 0);
			c	: in std_logic_vector(15 downto 0);
			d	: in std_logic_vector(15 downto 0);
			e	: in std_logic_vector(15 downto 0);
			f	: in std_logic_vector(15 downto 0);
			g	: in std_logic_vector(15 downto 0);
			h	: in std_logic_vector(15 downto 0);
			sel	: in std_logic_vector(2 downto 0);
			pass: out std_logic_vector(15 downto 0)
			);
end Mux8to1_16;

architecture Behavioral of Mux8to1_16 is

begin
	selector : process(a,b,c,d,e,f,g,h,sel)
		begin
			case sel is
				when "000" =>
					pass <= a;
				when "001" =>
					pass <= b;
				when "010" =>
					pass <= c;
				when "011" =>
					pass <= d;
				when "100" =>
					pass <= e;
				when "101" =>
					pass <= f;
				when "110" =>
					pass <= g;
				when "111" =>
					pass <= h;
				when others =>
					pass <= "XXXXXXXXXXXXXXXX";
				end case;
			end process selector;				

end Behavioral;
