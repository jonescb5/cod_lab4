----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/01/2020 07:10:15 PM
-- Design Name: 
-- Module Name: adder_subtractor_16 - Structural
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
library xil_defaultlib;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_subtractor_16 is
	Port (	a_bus   : in std_logic_vector(15 downto 0);
            b_bus   : in std_logic_vector(15 downto 0);
            sel     : in std_logic;
            cout    : out std_logic;
            ovr     : out std_logic;
            d_bus   : out std_logic_vector(15 downto 0) );
end adder_subtractor_16;

architecture Structural of adder_subtractor_16 is
signal b_bus_mod : std_logic_vector(15 downto 0);

begin
	-- generate the xor switch for the input of the adder
	-- this creates a selectable parrallel adder-subtractor
	GEN_MOD : for n in 0 to 15 generate
		b_bus_mod(n) <= b_bus xor sel;
	end generate GEN_MOD;
	
	--now use the 16 bit adder with sel as the cin
	INTERNAL_ADDER :	ENTITY xil_defaultlib.adder_16(Structural)
						PORT MAP( 	a_bus => a_bus,
									b_bus => b_bus_mod,
									cin => sel,
									cout => cout,
									ovr => ovr,
									s_bus => d_bus
									);

end Structural;
