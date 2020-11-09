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
library knappe_lib;
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
           branch_flag : in STD_LOGIC;
           zero_flag : in STD_LOGIC;
           branch_pc : in STD_LOGIC_Vector(15 downto 0);
           Instruction : out STD_LOGIC_VECTOR(15 downto 0);
           pc_init : in STD_LOGIC;
           set_pc : in STD_LOGIC_Vector(15 downto 0)
           );
end PC_topleve;

architecture Behavioral of PC_topleve is
signal pc_current : std_logic_vector(15 downto 0);
signal pc_next : std_logic_vector(15 downto 0);
signal pc_incremented : std_logic_vector(15 downto 0);
signal pc_to_pc : std_logic_vector(15 downto 0);

     
begin


Instruction_memory : ENTITY knappe_lib.instruction_mem_16(Behavioral)
    port map(
            pc => pc_current,
            instruction => instruction
            );
        
PC : ENTITY knappe_lib.PC(Behavioral)
    port map(
            clk => clk,
            PC_in => pc_to_pc,
            PC_out => pc_current
            );
            
PC_MUX : ENTITY knappe_lib.PC_mux(Behavioral)
    port map(
             zero_flag => Zero_flag,
             branch_flag => branch_flag,
             branch_pc => branch_pc,
             inc_pc => pc_incremented,
             output_pc  => PC_next 
            );
            
PC_ADDER : ENTITY knappe_lib.PC_adder(Behavioral)
    port map(
            PC_in => pc_current,
            PC_out => pc_incremented
            );
            
PC_SET : ENTITY xil_defaultlib.mux2to1_16(Behavioral)
	port map(
			a	=>	pc_next,
			b	=> 	set_pc,
			sel =>	pc_init,
			pass=>	pc_to_pc
			);
            
                            
end Behavioral;
