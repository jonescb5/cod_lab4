
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library knappe_lib;
entity PC_testbench is
--  Port ( );
end PC_testbench;

architecture Behavioral of PC_testbench is
    constant clock_period : time := 1 ns;

    signal SIM_clk_in : STD_logic := '1';
    signal SIM_branch_flag : std_logic := '0';
    signal SIM_zero_flag : std_logic := '0';
    signal SIM_branch_pc : std_logic_vector(15 downto 0) := "0000000000000110";
    signal SIM_instuction : std_logic_vector(15 downto 0);
    signal SIM_set_pc : std_logic_vector(15 downto 0) := "0000000000000000";
    signal SIM_pc_init : std_logic := '1';
begin
    clock : process(SIM_clk_in)
		begin
		SIM_clk_in <= not SIM_clk_in after clock_period / 2;
	end process clock;
	
	stimulus : process
		begin
		SIM_pc_init <= '0' after 5 ns;
		SIM_zero_flag <= '1' after 16 ns, '0' after 17 ns;
		SIM_branch_flag <= '1' after 16 ns, '0' after 17 ns;
		
		
		wait;
	end process stimulus;
    
	DUT : 	ENTITY knappe_lib.PC_topleve(Behavioral)
			PORT MAP(
					clk => SIM_clk_in,
                    branch_flag => SIM_branch_flag,
                    zero_flag => SIM_zero_flag,
                    branch_pc => SIM_branch_pc,
                    Instruction => SIM_instuction,
                    pc_init		=> SIM_pc_init,
                    set_pc		=> SIM_set_pc
                    
				);
end Behavioral;
