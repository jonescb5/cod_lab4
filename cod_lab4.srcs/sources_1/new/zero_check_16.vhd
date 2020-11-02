----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/01/2020 08:16:39 PM
-- Design Name: 
-- Module Name: zero_check_16 - structural
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

entity zero_check_16 is
	Port (	input	: in std_logic_vector(15 downto 0);
			output	: out std_logic );
end zero_check_16;

architecture structural of zero_check_16 is

signal checksig : std_logic_vector(15 downto 0);

begin
	checksig(14) <= input(15) or input(14);
	checksig(13) <= checksig(14) or input(13);
	checksig(12) <= checksig(13) or input(12);
	checksig(11) <= checksig(12) or input(11);
	checksig(10) <= checksig(11) or input(10);
	checksig(9) <= checksig(10) or input(9);
	checksig(8) <= checksig(9) or input(8);
	checksig(7) <= checksig(8) or input(7);
	checksig(6) <= checksig(7) or input(6);
	checksig(5) <= checksig(6) or input(5);
	checksig(4) <= checksig(5) or input(4);
	checksig(3) <= checksig(4) or input(3);
	checksig(2) <= checksig(3) or input(2);
	checksig(1) <= checksig(2) or input(1);
	checksig(0) <= checksig(1) or input(0);
	
	output <= not checksig(0);

end structural;
