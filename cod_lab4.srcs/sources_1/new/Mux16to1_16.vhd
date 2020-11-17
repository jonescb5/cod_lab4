----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/17/2020 01:35:48 PM
-- Design Name: 
-- Module Name: Mux16to1_16 - Behavioral
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

entity Mux16to1_16 is
	Port (	a	: in std_logic_vector(15 downto 0);
			b	: in std_logic_vector(15 downto 0);
			c	: in std_logic_vector(15 downto 0);
			d	: in std_logic_vector(15 downto 0);
			e	: in std_logic_vector(15 downto 0);
			f	: in std_logic_vector(15 downto 0);
			g	: in std_logic_vector(15 downto 0);
			h	: in std_logic_vector(15 downto 0);
			i	: in std_logic_vector(15 downto 0);
			j	: in std_logic_vector(15 downto 0);
			k	: in std_logic_vector(15 downto 0);
			l	: in std_logic_vector(15 downto 0);
			m	: in std_logic_vector(15 downto 0);
			n	: in std_logic_vector(15 downto 0);
			o	: in std_logic_vector(15 downto 0);
			p	: in std_logic_vector(15 downto 0);
			sel	: in std_logic_vector(3 downto 0);
			pass: out std_logic_vector(15 downto 0)
			);
end Mux16to1_16;

architecture Behavioral of Mux16to1_16 is

begin
	selector : process(sel)
		begin
			case sel is
				when "0000" =>
					pass <= a;
				when "0001" =>
					pass <= b;
				when "0010" =>
					pass <= c;
				when "0011" =>
					pass <= d;
				when "0100" =>
					pass <= e;
				when "0101" =>
					pass <= f;
				when "0110" =>
					pass <= g;
				when "0111" =>
					pass <= h;
				when "1000" =>
					pass <= i;
				when "1001" =>
					pass <= j;
				when "1010" =>
					pass <= k;
				when "1011" =>
					pass <= l;
				when "1100" =>
					pass <= m;
				when "1101" =>
					pass <= n;
				when "1110" =>
					pass <= o;
				when "1111" =>
					pass <= p;
				when others =>
					pass <= "XXXXXXXXXXXXXXXX";
				end case;
			end process selector;


end Behavioral;
