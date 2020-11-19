----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/05/2020 02:50:25 PM
-- Design Name: 
-- Module Name: data_path - Structural
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

entity data_path is
	Port (	
			instruction_in	: in std_logic_vector(15 downto 0);
			clk_in			: in std_logic;
	
			RegDst			: in std_logic_vector(1 downto 0);
			MemRead			: in std_logic;
			ALUsrc			: in std_logic;
			RegWriteEn		: in std_logic;
			MemtoReg		: in std_logic;
			ALUctr			: in std_logic_vector(4 downto 0);
			MemWrite		: in std_logic;
			SEsel			: in std_logic;
			
			OpCode			: out std_logic_vector(3 downto 0);
			Func			: out std_logic_vector(2 downto 0);
			extimm6			: out std_logic_vector(15 downto 0);
			Zero			: out std_logic
			);
end data_path;

architecture Structural of data_path is
signal alu_input_b_sig : std_logic_vector(15 downto 0);
signal alu_output_sig : std_logic_vector(15 downto 0);

signal reg_addr_b_sig : std_logic_vector(2 downto 0);
signal reg_addr_write_sig : std_logic_vector(2 downto 0);
signal reg_data_a_sig : std_logic_vector(15 downto 0);
signal reg_data_b_sig : std_logic_vector(15 downto 0);
signal reg_data_write_sig : std_logic_vector(15 downto 0);



signal mem_read_data_sig : std_logic_vector(15 downto 0);

signal sign_extend_sig : std_logic_vector(15 downto 0);

signal MemtoReg_data_sig : std_logic_vector(15 downto 0);
signal instruction_sig : std_logic_vector(15 downto 0);
--signal program_counter_sig : std_logic_vector(15 downto 0);

signal rs_addr_sig : std_logic_vector(2 downto 0);
signal rt_addr_sig : std_logic_vector(2 downto 0);
signal rd_addr_sig : std_logic_vector(2 downto 0);
signal imm6_sig : std_logic_vector(5 downto 0);
signal imm9_sig : std_logic_vector(8 downto 0);



begin
	instruction_sig <= instruction_in;
	OpCode <= instruction_sig(15 downto 12);
	rs_addr_sig <= instruction_sig(11 downto 9);
	rt_addr_sig <= instruction_sig(8 downto 6);
	rd_addr_sig <= instruction_sig(5 downto 3);
	Func <= instruction_sig(2 downto 0);
	imm6_sig <= instruction_sig(5 downto 0);
	imm9_sig <= instruction_sig(8 downto 0);
	
	extimm6(15 downto 6) <= (others => '0');
	extimm6(5 downto 0) <= imm6_sig(5 downto 0);
	
	
	ALU : ENTITY xil_defaultlib.ALU16_16(Structural)
		port map(
				A			=>	reg_data_a_sig,	
				B			=>	alu_input_b_sig,
				ctr			=>	ALUctr,
				result		=>	alu_output_sig,
				zero		=>	Zero
				);
				
	REGISTER_FILE : entity xil_defaultlib.registerfile_16by8(Behavioral)
		port map(
				clk				=>	clk_in,
				reg_addr_a		=>	rs_addr_sig,
				reg_addr_b		=>	rt_addr_sig,
				reg_addr_c		=>	reg_addr_write_sig,
				reg_data_a		=>	reg_data_a_sig,
				reg_data_b		=>	reg_data_b_sig,
				reg_data_write	=>	reg_data_write_sig,
				reg_write_enable=>	RegWriteEn
				);
				
				
	DATA_MEMORY : entity xil_defaultlib.mem_16(Behavioral)
		port map(
				clk 				=> clk_in,
           		mem_access_addr 	=> alu_output_sig,
           		mem_write_data		=> reg_data_b_sig,
           		mem_read_data 		=> mem_read_data_sig,
           		mem_read			=> MemRead, 
           		mem_write			=> MemWrite
           		);
           		
	ALU_INPUT_SEL : entity xil_defaultlib.mux2to1_16(Behavioral)
		port map(
				a		=> reg_data_b_sig,
				b		=> sign_extend_sig,
				sel		=> ALUsrc,
				pass	=> alu_input_b_sig
				);
				
	MEM_TO_REG_SEL : entity xil_defaultlib.mux2to1_16(Behavioral)
		port map(
				a		=> alu_output_sig,
				b		=> mem_read_data_sig,
				sel		=> memtoReg,
				pass	=> reg_data_write_sig
				);
	
	

	SIGN_EXTEND : entity xil_defaultlib.dual_sign_extend(Structural)
		port map(
				imm6	=> imm6_sig,
				imm9	=> imm9_sig,
				SEsel	=> SEsel,
				seimm16	=> sign_extend_sig
		);

			
	REG_WRITE_ADDR_SEL : entity xil_defaultlib.mux3to1_3(Behavioral)
		port map(
				a		=> rd_addr_sig,
				b		=> rt_addr_sig,
				c		=> rs_addr_sig,
				sel		=> RegDst,
				pass	=> reg_addr_write_sig
				);
	

end Structural;
