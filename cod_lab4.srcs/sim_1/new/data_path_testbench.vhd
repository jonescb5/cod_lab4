----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/05/2020 06:51:13 PM
-- Design Name: 
-- Module Name: data_path_testbench - Behavioral
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

entity data_path_testbench is
--Port ( );
end data_path_testbench;

architecture Behavioral of data_path_testbench is
signal SIM_instruction	: std_logic_vector(15 downto 0);
signal SIM_clk_in			:  std_logic:='0';
	
signal SIM_RegDst			:  std_logic:= '0';
signal SIM_MemRead			:  std_logic:='0';
signal SIM_ALUsrc			:  std_logic:='0';
signal SIM_RegWriteEn		:  std_logic:='0';
signal SIM_MemtoReg			:  std_logic:='0';
signal SIM_ALUctr			:  std_logic_vector(3 downto 0);
signal SIM_MemWrite			:  std_logic:='0';
 			
signal SIM_OpCode			:  std_logic_vector(2 downto 0);
signal SIM_Func				:  std_logic_vector(3 downto 0);
signal SIM_sign_extend_imm 	:  std_logic_vector(15 downto 0);
signal SIM_Zero				:  std_logic;
signal SIM_Overflow			:  std_logic;
signal SIM_Carry_Out		:  std_logic;

constant clock_period : time := 1 ns;
begin



clock : process(SIM_clk_in)
begin
	SIM_clk_in <= not SIM_clk_in after clock_period / 2;
end process clock;

stimulus : process
	begin
	
	SIM_instruction <= 	"0000000000000000",
						"0010000010000100" after 10ns,		--addi r1,r0, 4
						"0010000100001000" after 20ns,		--addi r2,r0, 8
						"0000010100110000" after 30ns,		--add r3,r1,r2
						"0100101000000011" after 40ns,		--subi r4,r2, 3
						"0000100111010001" after 50ns;		--sub r5,r2,r3
						
	SIM_ALUctr 		<= 	"0000",
						"0000" after 10ns,
						"0000" after 20ns,
						"1000" after 40ns;
						
	SIM_RegDst 		<= 	'0',
						'0' after 10ns,
						'0' after 20ns,
						'1' after 30ns,
						'0' after 40ns,
						'1' after 50ns;
						
	SIM_MemRead 	<= 	'0';
	
	SIM_ALUsrc 		<= 	'0',
						'1' after 10ns,
						'1' after 20ns,
						'0' after 30ns,
						'1' after 40ns,
						'0' after 50ns;
						
	SIM_RegWriteEn 	<= 	'0',
						'1' after 10ns,
						'1' after 20ns,
						'1' after 30ns;
						
	SIM_MemtoReg 	<= 	'0';
	SIM_MemWrite 	<= 	'0';
	
	wait;
	end process stimulus;
	
	DUT : entity xil_defaultlib.data_path(Structural)
		Port map(	
				instruction_in	=>	SIM_instruction,
				clk_in			=>	SIM_clk_in,
		
				RegDst			=>	SIM_RegDst,
				MemRead			=>	SIM_MemRead,
				ALUsrc			=>	SIM_ALUsrc,
				RegWriteEn		=>	SIM_RegWriteEn,
				MemtoReg		=>	SIM_MemtoReg,
				ALUctr			=>	SIM_ALUctr,
				MemWrite		=>	SIM_MemWrite,
				
				OpCode			=>	SIM_OpCode,
				Func			=>	SIM_Func,
				sign_extend_imm =>	SIM_sign_extend_imm,
				Zero			=>	SIM_Zero,
				Overflow		=>	SIM_Overflow,
				Carry_Out		=>	SIM_Carry_Out
	
			);
	
end Behavioral;
