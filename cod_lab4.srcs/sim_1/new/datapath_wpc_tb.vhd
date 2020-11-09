----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/09/2020 04:42:07 PM
-- Design Name: 
-- Module Name: datapath_wpc_tb - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath_wpc_tb is
--  Port ( );
end datapath_wpc_tb;

architecture Behavioral of datapath_wpc_tb is
constant clock_period : time := 1 ns;
constant NO_OPS : integer := 16;

signal SIM_clk_in 			:  	STD_logic := '1';
signal SIM_set_pc 			:  	std_logic_vector(15 downto 0) := "0000000000000000";
signal SIM_pc_init 			:  	std_logic := '1';
    
signal SIM_RegDst			:  	std_logic:= '0';
signal SIM_MemRead			:  	std_logic:='0';
signal SIM_ALUsrc			:  	std_logic:='0';
signal SIM_RegWriteEn		:  	std_logic:='0';
signal SIM_MemtoReg			:  	std_logic:='0';
signal SIM_ALUctr			:  	std_logic_vector(3 downto 0);
signal SIM_MemWrite			:  	std_logic:='0';
signal SIM_Branch			:	std_logic:='0';

		
signal SIM_OpCode			:  	std_logic_vector(2 downto 0);
signal SIM_Func				:  	std_logic_vector(3 downto 0);
signal SIM_Overflow			:  	std_logic;
signal SIM_Carry_Out		:  	std_logic;

signal SIM_pc : std_logic_vector(15 downto 0);


type fourbitctr_array is array(0 to NO_OPS-1) of std_logic_vector(3 downto 0);
type binaryctr_array is array(0 to NO_OPS-1) of std_logic;

constant ALUctr_values : fourbitctr_array := ( 	"0000",	--	0
												"0000",	--	1
												"0000",	--	2
												"0000",	--	3
												"1000",	--	4
												"1000",	--	5
												"0000",	--	6
												"0000",	--	7
												"0000",	--	8
												"0000",	--	9
												"0000",	--	a
												"0000",	--	b
												"0000",	--	c
												"0000",	--	d
												"0000",	--	e
												"0000"	--	f
												);
												
										
												--    0   1   2   3   4   5   6   7   8   9   a   b   c   d   e   f
constant RegDst_values : binaryctr_array := 		('0','0','0','1','0','1','0','0','0','0','0','0','0','0','0','0');
constant MemRead_values : binaryctr_array := 		('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
constant ALUsrc_values : binaryctr_array := 		('0','1','1','0','1','0','0','0','0','0','0','0','0','0','0','0');
constant RegWriteEn_values : binaryctr_array := 	('0','1','1','1','1','1','0','0','0','0','0','0','0','0','0','0');
constant MemtoReg_values : binaryctr_array := 		('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
constant MemWrite_values : binaryctr_array := 		('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
constant Branch_values : binaryctr_array := 		('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');	

signal i : integer := 0;
signal i_next : std_logic_vector(4 downto 1);								
    
begin

clock : process(SIM_clk_in)
begin
	SIM_clk_in <= not SIM_clk_in after clock_period / 2;
end process clock;

i_next <= SIM_pc(4 downto 1);
i <= to_integer(unsigned(i_next));

SIM_pc_init <= '0' after 2 ns;

stimulus : process(i)
	
	begin

			
		SIM_ALUctr 		<= 	ALUctr_values(i);
							
		SIM_RegDst 		<= 	RegDst_values(i);
							
		SIM_MemRead 	<= 	MemRead_values(i);
		
		SIM_ALUsrc 		<= 	ALUsrc_values(i);
		
		SIM_RegWriteEn 	<= 	RegWriteEn_values(i);
							
		SIM_MemtoReg 	<= 	MemtoReg_values(i);
		SIM_MemWrite 	<=	MemWrite_values(i);
		SIM_Branch		<=	Branch_values(i);

	
end process stimulus;
	
	
	DUT : entity xil_defaultlib.data_path_wpc(Structural)
		Port map(	
				clk				=>	SIM_clk_in,
				pc_init			=>	SIM_pc_init,
				set_pc			=>	SIM_set_pc,
				RegDst			=>	SIM_RegDst,
				MemRead			=>	SIM_MemRead,
				ALUsrc			=>	SIM_ALUsrc,
				RegWriteEn		=>	SIM_RegWriteEn,
				MemtoReg		=>	SIM_MemtoReg,
				ALUctr			=>	SIM_ALUctr,
				MemWrite		=>	SIM_MemWrite,
				Branch			=>	SIM_Branch,
				OpCode			=>	SIM_OpCode,
				Func			=>	SIM_Func,
				Overflow		=>	SIM_Overflow,
				Carry_Out		=>	SIM_Carry_Out,
				pc_pass			=> 	SIM_pc
	
			);
	

end Behavioral;
