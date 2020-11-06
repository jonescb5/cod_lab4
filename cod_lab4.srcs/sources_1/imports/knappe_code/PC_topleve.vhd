----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2020 07:27:36 PM
-- Design Name: 
-- Module Name: PC_topleve - Behavioral
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
library xil_defaultlib;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC_topleve is
    Port ( clk : std_logic;
           immedate_flag : in STD_LOGIC;
           Zero_flag : in STD_LOGIC;
           Immedate_PC : in STD_LOGIC_Vector(15 downto 0);
           Instruction : out STD_LOGIC_VECTOR(15 downto 0)
           );
end PC_topleve;

architecture Behavioral of PC_topleve is
    --INSTRUCTION MEM
    Signal PC_sig : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    
    --PC ADDER 
    Signal PC_adder_in_sig : std_logic_vector(15 downto 0);
    signal PC_adder_out_sig : std_logic_vector(15 downto 0);
    
    --PC MUX
    signal PC_MUX_OUT : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    signal PC_MUX_IN : std_logic_vector(15 downto 0);
     
begin


Instruction_memory : ENTITY xil_defaultlib.instruction_mem_16(Behavioral)
    port map(
            pc => PC_sig,
            instruction => instruction
            );
        
PC : ENTITY xil_defaultlib.PC(Behavioral)
    port map(
            clk => clk,
            PC_in => PC_MUX_OUT,
            PC_out => PC_sig
            );
            
PC_MUX : ENTITY xil_defaultlib.PC_mux(Behavioral)
    port map(
             zero_flag => Zero_flag,
             branch_flag => immedate_flag,
             immedate_branch => immedate_PC,
             PC_next => PC_MUX_IN,
             PC_out  => PC_MUX_OUT 
            );
            
PC_ADDER : ENTITY xil_defaultlib.PC_adder(Behavioral)
    port map(
            PC_in => PC_sig,
            PC_out => PC_MUX_IN
            );
            
                            
end Behavioral;
