----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/10/2020 01:58:39 PM
-- Design Name: 
-- Module Name: processor_toplevel_testbench - Behavioral
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

entity processor_toplevel_testbench is
--  Port ( );
end processor_toplevel_testbench;

architecture Behavioral of processor_toplevel_testbench is
constant clock_period : time := 1 ns;
signal SIM_clk_in 			:  	STD_logic := '1';

--signal SIM_set_pc 			:  	std_logic_vector(15 downto 0) := "0000000000000000";
--signal SIM_pc_init 			:  	std_logic := '0';
--signal SIM_pc 				:	 std_logic_vector(15 downto 0);
signal SIM_Overflow			:  	std_logic;
signal SIM_Carry_Out		:  	std_logic;
signal clk_count	: integer := 0;
signal SIM_reset	: std_logic:='0';
signal SIM_PC	: std_logic_vector(15 downto 0);
--
--signal SIM_RegRst			:	std_logic:= '0';


begin
SIM_reset <= '1' after 10 ns, '0' after 11 ns;

clock_counter : process(SIM_clk_in)
begin
	if(rising_edge(sim_clk_in)) then
		clk_count <= clk_count + 1;
	end if;
end process clock_counter;

clock : process(SIM_clk_in)
begin
	SIM_clk_in <= not SIM_clk_in after clock_period / 2;
end process clock;

--SIM_pc_init <= '0' after 1 ns;
--SIM_RegRst	<= '1' after 1 ns, '0' after 1.5 ns;

DUT : ENTITY xil_defaultlib.processor_toplevel(Structural)
	PORT MAP(
			clk_in		=>	SIM_clk_in,
--			pc_init_in	=>	SIM_pc_init,
--			set_pc_in	=>	SIM_set_pc
			reset		=>	SIM_reset,
			PC			=>	SIM_PC
			);

end Behavioral;
