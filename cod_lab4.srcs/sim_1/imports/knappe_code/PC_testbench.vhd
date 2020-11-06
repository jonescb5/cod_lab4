
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library xil_defaultlib;
entity PC_testbench is
--  Port ( );
end PC_testbench;

architecture Behavioral of PC_testbench is
    constant clock_fre : integer := 100e6;
    constant clock_period : time :=100 ms / clock_fre;

    signal clk_sig : STD_logic := '0';
    signal i_f : std_logic;
    signal z_f : std_logic;
    signal immedate_sig : std_logic_vector(15 downto 0);
    signal instuction_sig : std_logic_vector(15 downto 0);
begin
    clk_sig <= not clk_sig after clock_period / 2; 
    i_f <= '0';
    z_f <= '0';
    immedate_sig <= "0000000000000000";
    
	DUT : 	ENTITY xil_defaultlib.PC_topleve(Behavioral)
			PORT MAP(
					clk => clk_sig,
                    immedate_flag => i_f,
                    Zero_flag => z_f,
                    Immedate_PC => immedate_sig,
                    Instruction => instuction_sig
				);
end Behavioral;
