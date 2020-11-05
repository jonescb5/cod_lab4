----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Knappe
-- 
-- Create Date: 11/04/2020 05:11:32 PM
-- Design Name: 
-- Module Name: sign_extentor - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity sign_extentor is
    Port ( i_in : in STD_LOGIC_VECTOR (6 downto 0);
           i_out : out STD_LOGIC_VECTOR (15 downto 0));
end sign_extentor;

architecture Behavioral of sign_extentor is
    
begin
    i_out(15 downto 7) <= (others => i_in(6)); 
    
    i_out(6 downto 0)  <= i_in(6 downto 0);
end Behavioral;
