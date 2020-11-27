----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/10/2020 12:49:51 PM
-- Design Name: 
-- Module Name: processor_toplevel - Behavioral
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

entity processor_toplevel is
	Port (		clk_in		: in std_logic;
				reset		: in std_logic;
				PC			: out std_logic_vector(15 downto 0);
				reg_contents	: out std_logic_vector(127 downto 0);
				mem_disp_access_addr : in STD_LOGIC_VECTOR (7 downto 0);
				mem_disp_data :  out std_logic_vector(15 downto 0);
				instruction : out std_logic_vector(15 downto 0)
				);
end processor_toplevel;

architecture Structural of processor_toplevel is
signal RegDst_sig : std_logic_vector(1 downto 0);
signal MemRead_sig : std_logic;
signal ALUsrc_sig : std_logic;
signal RegWriteEn_sig : std_logic;
signal MemtoReg_sig : std_logic;
signal ALUctr_sig : std_logic_vector(4 downto 0);
signal MemWrite_sig : std_logic;
signal Branch_sig : std_logic;
signal OpCode_sig : std_logic_vector(3 downto 0);
signal Func_sig : std_logic_vector(2 downto 0);

signal SEsel_sig	: std_logic;
signal prog_rst		: std_logic;
signal rst_sig		: std_logic;

begin

rst_sig <= prog_rst or reset;

DATA_PATH : entity xil_defaultlib.data_path_wpc(Structural)
		Port map(	
				clk				=>	clk_in,
				RegDst			=>	RegDst_sig,
				MemRead			=>	MemRead_sig,
				ALUsrc			=>	ALUsrc_sig,
				RegWriteEn		=>	RegWriteEn_sig,
				MemtoReg		=>	MemtoReg_sig,
				ALUctr			=>	ALUctr_sig,
				MemWrite		=>	MemWrite_sig,
				SEsel			=>	SEsel_sig,
				Branch			=>	Branch_sig,
				OpCode			=>	OpCode_sig,
				Func			=>	Func_sig,
				reset			=> 	rst_sig,
				pc_pass			=>	PC,
				reg_contents	=>	reg_contents,
				mem_disp_access_addr => mem_disp_access_addr,
           		mem_disp_data 	=> 	mem_disp_data,
           		instruction		=>	instruction
			);
			
CONTROL_UNIT : ENTITY xil_defaultlib.control_unit(Behavioral)
		Port map(
			    RegDst			=>	RegDst_sig,
        		MemRead			=>	MemRead_sig,
       	 		ALUsrc			=>	ALUsrc_sig,
        		RegWriteEn		=>	RegWriteEn_sig,
        		MemtoReg		=>	MemtoReg_sig,
        		ALUctr			=>	ALUctr_sig,
        		SEsel			=>	SEsel_sig,
        		MemWrite		=>	MemWrite_sig,
        		Branch			=>	Branch_sig,
        		OpCode			=>	OpCode_sig,
        		Func			=>	Func_sig,
        		prog_rst		=>	prog_rst
				);

end Structural;
