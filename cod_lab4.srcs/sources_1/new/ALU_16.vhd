----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/02/2020 03:25:38 PM
-- Design Name: 
-- Module Name: ALU_16 - Structural
-- Project Name: 
-- Target Devices: Digilent Basys3
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

entity ALU_16 is
	Port (	A			:	in std_logic_vector(15 downto 0);
			B			:	in std_logic_vector(15 downto 0);
			ctr			:	in std_logic_vector(3 downto 0);
			result		:	out std_logic_vector(15 downto 0);
			overflow	:	out std_logic;
			carry_out	:	out std_logic;
			zero		:	out std_logic
			);
end ALU_16;



architecture Structural of ALU_16 is

signal res_add_sub_block : std_logic_vector(15 downto 0);
signal res_and_block : std_logic_vector(15 downto 0);
signal res_not_block : std_logic_vector(15 downto 0);
signal res_or_block : std_logic_vector(15 downto 0);
signal res_xor_block : std_logic_vector(15 downto 0);
signal res_sll_block : std_logic_vector(15 downto 0);
signal res_srl_block : std_logic_vector(15 downto 0);
signal res_sra_block : std_logic_vector(15 downto 0);
signal res_mux_block : std_logic_vector(15 downto 0);

begin

	ADDER_SUBTRACTOR_BLOCK	:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									sel			=>	ctr(3),
									cout		=>	carry_out,
									overflow	=>	overflow,
									d_bus		=>	res_add_sub_block
									);
									
	AND_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_and_block
									);
									
	NOT_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_not_block
									);
									
	OR_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_or_block
									);
									
	XOR_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_xor_block
									);
									
	SLL_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_sll_block
									);
									
	SRL_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_srl_block
									);
									
	SRA_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_sra_block
									);	
									
	MUX_BLOCK				:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a			=>	res_add_sub_block,
									b			=>	res_and_block,
									c			=>	res_not_block,
									d			=>	res_or_block,
									e			=>	res_xor_block,
									f			=>	res_sll_block,
									g			=>	res_srl_block,
									h			=>	res_sra_block,
									sel			=>	ctr(2 downto 0),
									pass		=>	res_mux_block
									);		
									
	ZERO_CHECK_BLOCK		:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									input 		=>	res_mux_block,
									output		=>	zero
									);																																																																					
									
	result <= res_mux_block;
	


end Structural;
