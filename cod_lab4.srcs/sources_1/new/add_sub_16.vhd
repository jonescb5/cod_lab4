----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/01/2020 06:55:13 PM
-- Design Name: 
-- Module Name: adder_16 - Structural
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

entity adder_16 is
	Port (	a_bus   : in std_logic_vector(15 downto 0);
            b_bus   : in std_logic_vector(15 downto 0);
            cin     : in std_logic;
            cout    : out std_logic;
            overflow     : out std_logic;
            s_bus   : out std_logic_vector(15 downto 0)
            );
end adder_16;

architecture Structural of adder_16 is
signal carry : std_logic_vector(15 downto 0);
begin
	
	ADDER_0_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(0), b_bus(0), cin, s_bus(0), carry(0));
	ADDER_1_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(1), b_bus(1), carry(0), s_bus(1), carry(1));
	ADDER_2_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(2), b_bus(2), carry(1), s_bus(2), carry(2));
	ADDER_3_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(3), b_bus(3), carry(2), s_bus(3), carry(3));
	ADDER_4_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(4), b_bus(4), carry(3), s_bus(4), carry(4));
	ADDER_5_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(5), b_bus(5), carry(4), s_bus(5), carry(5));
	ADDER_6_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(6), b_bus(6), carry(5), s_bus(6), carry(6));
	ADDER_7_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(7), b_bus(7), carry(6), s_bus(7), carry(7));
	ADDER_8_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(8), b_bus(8), carry(7), s_bus(8), carry(8));
	ADDER_9_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(9), b_bus(9), carry(8), s_bus(9), carry(9));
	ADDER_10_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(10), b_bus(10), carry(9), s_bus(10), carry(10));
	ADDER_11_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(11), b_bus(11), carry(10), s_bus(11), carry(11));
	ADDER_12_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(12), b_bus(12), carry(11), s_bus(12), carry(12));
	ADDER_13_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(13), b_bus(13), carry(12), s_bus(13), carry(13));
	ADDER_14_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(14), b_bus(14), carry(13), s_bus(14), carry(14));
	ADDER_15_B : ENTITY xil_defaultlib.full_adder(Structural)
	PORT MAP(a_bus(15), b_bus(15), carry(14), s_bus(15), carry(15));

	overflow <= carry(14) xor carry(15);
	cout <= carry(15);
	
end Structural;
