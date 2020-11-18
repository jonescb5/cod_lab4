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
				pc_init_in		: in std_logic;
				set_pc_in		: in std_logic_vector(15 downto 0);
				Overflow	: out std_logic;
				Carry_Out	: out std_logic
				--pc			: out std_logic_vector(15 downto 0)     ------- get rid of this
				
				--RegRst		: in std_logic
				
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
signal Overflow_sig : std_logic;
signal Carry_Out_sig : std_logic;
signal SEsel_sig	: std_logic;

begin
Overflow <= Overflow_sig;
Carry_Out <= Carry_Out_sig;

DATA_PATH : entity xil_defaultlib.data_path_wpc(Structural)
		Port map(	
				clk				=>	clk_in,
				pc_init			=>	pc_init_in,
				set_pc			=>	set_pc_in,
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
				Overflow		=>	Overflow_sig,
				Carry_Out		=>	Carry_Out_sig
				--pc_pass			=> 	pc 				---- get rid of this 
				
				--RegRst			=> RegRst
	
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
        		Func			=>	Func_sig
				);
				
--ALU_CONTROL_UNIT : ENTITY xil_defaultlib.Mux2to1_4(Behavioral)
--			port map(
--				a		=> Func_sig,
--				b		=> ALUOp_sig,
--				sel		=> ALUOpSel_sig,
--				pass	=> ALUctr_sig
--				);

end Structural;
