----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/02/2020 06:58:17 PM
-- Design Name: 
-- Module Name: ALU_16_controller - 
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

entity ALU_16_controller is
	Port (	ALUOp	:	in std_logic_vector(3 downto 0);
			Funct	:	in std_logic_vector(3 downto 0);
			ALUctr	:	out std_logic_vector(3 downto 0)
			);
end ALU_16_controller;


architecture Behavioral of ALU_16_controller is
signal combined : std_logic_vector(7 downto 0);
begin
	combined(7 downto 4) <= ALUOp;
	combined(3 downto 0) <= Funct;
	controller : process(combined)
		begin
			case combined is 
				when "00000000" =>
					ALUctr <= "0000";
				when "00000001" =>
					ALUctr <= "1000";
					
					
				when others =>
					ALUctr <= "XXXX";
				end case;
		end process controller;

end ;
