----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/17/2020 01:29:34 PM
-- Design Name: 
-- Module Name: llb_16 - Structural
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
library xil_defaultlib;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity llb_16 is
	Port (	input	: in std_logic_vector(15 downto 0);
			output	: out std_logic_vector(15 downto 0) );
end llb_16;

architecture Structural of llb_16 is
signal constandsig :  std_logic_vector(15 downto 0);
begin

constandsig <= x"00FF";

ANDY_BOI		:	ENTITY xil_defaultlib.and_16(Structural)
							PORT MAP(
									a_bus		=>	input,
									b_bus		=>	constandsig,
									c_bus		=>	output
									);

end Structural;
