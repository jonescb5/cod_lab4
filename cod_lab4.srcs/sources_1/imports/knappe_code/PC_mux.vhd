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
           branch_pc : in STD_LOGIC_VECTOR (15 downto 0);
           inc_pc : in STD_LOGIC_VECTOR (15 downto 0);
           output_pc : out STD_LOGIC_VECTOR (15 downto 0));
end PC_mux;

architecture Behavioral of PC_mux is
    Signal branch_en : std_logic;
begin

branch_en <= zero_flag AND branch_flag; 


process(inc_pc, branch_pc, branch_en)
begin 
    if (branch_en = '1') then 
        output_pc <= branch_pc;
    else 
        output_pc <= inc_pc;
    end if;
end process;

end Behavioral;
