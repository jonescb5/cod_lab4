----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/09/2020 03:56:13 PM
-- Design Name: 
-- Module Name: data_path_wpc - Structural
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
library knappe_lib;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path_wpc is 
port (	
			clk				:	in std_logic;
  			pc_init 		: 	in STD_LOGIC;
           	set_pc 			: 	in STD_LOGIC_Vector(15 downto 0);
			RegDst			: 	in std_logic_vector(1 downto 0);
			MemRead			: 	in std_logic;
			ALUsrc			: 	in std_logic;
			RegWriteEn		: 	in std_logic;
			MemtoReg		: 	in std_logic;
			ALUctr			: 	in std_logic_vector(4 downto 0);
			MemWrite		: 	in std_logic;
			SEsel			:	in std_logic;
			Branch			:	in std_logic;
			OpCode			: 	out std_logic_vector(3 downto 0);
			Func			: 	out std_logic_vector(2 downto 0)
   );
end data_path_wpc;


architecture Structural of data_path_wpc is
signal instruction_sig : std_logic_vector(15 downto 0);
signal zero_flag_sig : std_logic;
signal extimm6_sig : std_logic_vector(15 downto 0);
begin

	DATA_PATH :	ENTITY xil_defaultlib.data_path(Structural)
		port map(
				instruction_in	=> instruction_sig,
				clk_in			=> clk,
	
				RegDst			=> RegDst,
				MemRead			=> MemRead,
				ALUsrc			=> ALUsrc,
				RegWriteEn		=> RegWriteEn,
				MemtoReg		=> MemtoReg,
				ALUctr			=> ALUctr,
				MemWrite		=> MemWrite,
				SEsel			=> SEsel,
			
				OpCode			=> OpCode,
				Func			=> Func,
				extimm6 		=> extimm6_sig,
				Zero			=> zero_flag_sig
				);
				
	PC_LOOP : ENTITY knappe_lib.pc_topleve(Behavioral)
		port map(
				clk				=>	clk,
				branch_flag		=>	Branch,
				zero_flag		=>	zero_flag_sig,
				instruction		=>	instruction_sig,
				branch_pc		=>	extimm6_sig,
				pc_init			=>	pc_init,
				set_pc			=>	set_pc
				);
	
end Structural;
