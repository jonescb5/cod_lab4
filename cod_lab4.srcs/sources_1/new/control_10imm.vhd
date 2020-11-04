----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2020 06:03:44 PM
-- Design Name: 
-- Module Name: control_10imm - Behavioral
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

entity control_10imm is
	Port (		imm_ten		:	in std_logic_vector(9 downto 0);
				imm_top		:	out std_logic_vector(15 downto 0) );
end control_10imm;

architecture Behavioral of control_10imm is

begin

	imm_top(15 downto 6) <= imm_ten;
	imm_top(5 downto 0) <= "000000";

end Behavioral;
