----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2020 06:03:55 PM
-- Design Name: 
-- Module Name: PC_mux - Behavioral
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
entity PC_mux is
    Port ( zero_flag : in STD_LOGIC;
           branch_flag : in STD_LOGIC;
           immedate_branch : in STD_LOGIC_VECTOR (15 downto 0);
           PC_next : in STD_LOGIC_VECTOR (15 downto 0);
           PC_out : out STD_LOGIC_VECTOR (15 downto 0));
end PC_mux;

architecture Behavioral of PC_mux is
    Signal branch_en : std_logic := '0';
begin

branch_en <= zero_flag AND branch_flag; 


process(PC_next, immedate_branch, branch_en)
begin 
    if (branch_en = '1') then 
        PC_out <= immedate_branch;
    else 
        PC_out <= PC_next;
    end if;
end process;

end Behavioral;
