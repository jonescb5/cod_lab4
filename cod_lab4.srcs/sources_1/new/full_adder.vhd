----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/01/2020 06:43:05 PM
-- Design Name: 
-- Module Name: full_adder - Structural
-- Project Name: Lab 4 EGRE 426 Computer Organization and Design
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

entity full_adder is
	Port (	a	: in std_logic;
			b	: in std_logic;
			cin	: in std_logic;
			s	: out std_logic;
			cout: out std_logic
			 );
end full_adder;

architecture Structural of full_adder is
signal sig1,sig2,sig3:std_logic;
begin
	sig1 <= a xor b;
    s <= cin xor sig1;
    sig2 <= sig1 and cin;
    sig3 <= a and b;
    cout <= sig2 or sig3;

end Structural;
