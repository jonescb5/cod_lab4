----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/17/2020 01:48:49 PM
-- Design Name: 
-- Module Name: ALU16_16 - Structural
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

entity ALU16_16 is
	Port (	A			:	in std_logic_vector(15 downto 0);
			B			:	in std_logic_vector(15 downto 0);
			ctr			:	in std_logic_vector(4 downto 0);
			result		:	out std_logic_vector(15 downto 0);
			zero		:	out std_logic
			);
end ALU16_16;

architecture Structural of ALU16_16 is

signal res_add_sub_block : std_logic_vector(15 downto 0);
signal res_and_block : std_logic_vector(15 downto 0);
signal res_or_block : std_logic_vector(15 downto 0);
signal res_xor_block : std_logic_vector(15 downto 0);
signal res_slt_block : std_logic_vector(15 downto 0);
signal res_sgt_block : std_logic_vector(15 downto 0);
signal res_seq_block : std_logic_vector(15 downto 0);

signal res_not_block : std_logic_vector(15 downto 0);
signal res_sll_block : std_logic_vector(15 downto 0);
signal res_srl_block : std_logic_vector(15 downto 0);
signal res_sra_block : std_logic_vector(15 downto 0);
signal res_sllb_block : std_logic_vector(15 downto 0);
signal res_srlb_block : std_logic_vector(15 downto 0);
signal res_lub_block : std_logic_vector(15 downto 0);
signal res_llb_block : std_logic_vector(15 downto 0);

signal res_mux_block : std_logic_vector(15 downto 0);

begin

	ADDER_SUBTRACTOR_BLOCK	:	ENTITY xil_defaultlib.adder_subtractor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									sel			=>	ctr(4),
									d_bus		=>	res_add_sub_block
									);
									
	AND_BLOCK				:	ENTITY xil_defaultlib.and_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_and_block
									);								
									
	OR_BLOCK				:	ENTITY xil_defaultlib.or_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_or_block
									);
									
	XOR_BLOCK				:	ENTITY xil_defaultlib.xor_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_xor_block
									);
	SLT_BLOCK				:	ENTITY xil_defaultlib.slt_16(Behavioral)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_slt_block
									);	
									
	SGT_BLOCK				:	ENTITY xil_defaultlib.sgt_16(Behavioral)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_sgt_block
									);	
							
	SEQ_BLOCK				:	ENTITY xil_defaultlib.seq_16(Behavioral)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									c_bus		=>	res_seq_block
									);	
									
									
									
									
									
									
									
									
									
									
	NOT_BLOCK				:	ENTITY xil_defaultlib.not_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_not_block
									);
									
	SLL_BLOCK				:	ENTITY xil_defaultlib.sll_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_sll_block
									);
									
	SRL_BLOCK				:	ENTITY xil_defaultlib.srl_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_srl_block
									);
									
	SRA_BLOCK				:	ENTITY xil_defaultlib.sra_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_sra_block
									);
									
	SLLB_BLOCK				:	ENTITY xil_defaultlib.sllb_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_sllb_block
									);
									
	SRLB_BLOCK				:	ENTITY xil_defaultlib.srlb_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									c_bus		=>	res_srlb_block
									);
									
	LUB_BLOCK				:	ENTITY xil_defaultlib.sllb_16(Structural)
							PORT MAP(
									a_bus		=>	B,
									c_bus		=>	res_lub_block
									);
									
	LLB_BLOCK				:	ENTITY xil_defaultlib.llb_16(Structural)
							PORT MAP(
									a_bus		=>	A,
									b_bus		=>	B,
									output		=>	res_llb_block
									);
									
									
									
	MUX_BLOCK				:	ENTITY xil_defaultlib.Mux16to1_16(Behavioral)
							PORT MAP(
									a			=>	res_add_sub_block,	--0000
									b			=>	res_and_block,		--0001
									c			=>	res_or_block,		--0010
									d			=>	res_xor_block,		--0011
									e			=>	res_slt_block,		--0100
									f			=>	res_sgt_block,		--0101
									g			=>	res_seq_block,		--0110
									h			=>	res_not_block,		--0111
									i			=>	res_sll_block,		--1000
									j			=>	res_srl_block,		--1001
									k			=>	res_sra_block,		--1010
									l			=>	res_sllb_block,		--1011
									m			=>	res_srlb_block,		--1100
									n			=>	res_lub_block,		--1101
									o			=>	res_llb_block,		--1110
									p			=>	A,					--1111
									sel			=>	ctr(3 downto 0),
									pass		=>	res_mux_block
									);								

									
	ZERO_CHECK_BLOCK		:	ENTITY xil_defaultlib.zero_check_16(Structural)
							PORT MAP(
									input 		=>	res_mux_block,
									output		=>	zero
									);																																																																					
									
	result <= res_mux_block;
	


end Structural;
