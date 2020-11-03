----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/02/2020 04:31:20 PM
-- Design Name: 
-- Module Name: ALU_16_testbench - Behavioral
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

entity ALU_16_testbench is
--  Port ( );
end ALU_16_testbench;

architecture Behavioral of ALU_16_testbench is

signal A_stimulus : std_logic_vector(15 downto 0);
signal B_stimulus : std_logic_vector(15 downto 0);
signal ctr_stimulus : std_logic_vector(3 downto 0);
signal result_res : std_logic_vector(15 downto 0);
signal zero_res : std_logic;
signal overflow_res : std_logic;
signal carry_out_res : std_logic;

begin
	stimulus : process
		begin
			ctr_stimulus	<=	"0000" after 5ns,	-- Trigger Adder
								"1000" after 25ns,	-- Trigger Subtractor
								"0001" after 45ns,	-- Trigger Bitwise AND
								"0010" after 65ns,	-- Trigger Bitwise OR
								"0011" after 85ns,	-- Trigger Logical Left Shift
								"0100" after 105ns,	-- Trigger Logical Right Shift
								"0101" after 125ns,	-- Trigger Arithmetic Left Shift
								"0110" after 145ns,	-- Trigger Arithmetic Right Shift
								"0111" after 150ns;	-- Trigger Arithmetic Right Shift
					
					
        						--Adder busA Test Values
            A_stimulus 		<=	"0000010100000101" after 5ns, 	-- 1285
                     			"0000010100000101" after 10ns, 	-- 1285
                     			"0111111111111111" after 15ns, 	-- 32767
                     			"1111110100000101" after 20ns, 	-- -763
                    
                    			--Subtractor busA Test Values
                    			"0000010100000101" after 25ns,	-- 1285
                    			"0000010100000101" after 30ns, 	-- 1285
                   				"0111111111111111" after 35ns, 	-- 32767
                    			"0000010100000101" after 40ns, 	-- 
                    			
                    			--AND busA Test Values
                    			"1010101010101010" after 45ns,	-- 1285
                    			"1010101010101010" after 50ns, 	-- 1285
                   				"1111111111111111" after 55ns, 	-- 
                    			"1111110100000101" after 60ns, 	-- 
                    			
                    			--NOT busA Test Values
                    			"0000010100000101" after 65ns,	-- 1285
                    			"0000010100000101" after 70ns, 	-- 1285
                   				"0000010100000101" after 75ns, 	-- 
                    			"0000010100000101" after 80ns, 	-- 
                    			
                    			--OR busA Test Values
                    			"1010101010101010" after 85ns,	-- 1285
                    			"1111111111111111" after 90ns, 	-- 1285
                   				"1111110100000101" after 95ns, 	-- 
                    			"1101110011110001" after 100ns, 	-- 
                    			
                    			--XOR busA Test Values
                    			"1010101010101010" after 105ns,	-- 1285
                    			"1010101010101010" after 110ns, 	-- 1285
                   				"1111111111111111" after 115ns, 	-- 
                    			"1111111111111111" after 120ns, 	-- 
                    			
                    			--SLL busA Test Values
                    			"1111111111111111" after 125ns,	-- 1285
                    			"0111111111111111" after 130ns, 	-- 1285
                   				"1010101010101010" after 135ns, 	-- 
                    			"0101010101010101" after 140ns, 	-- 
                    			
                    			--SRL busA Test Values
                    			"1111111111111111" after 145ns,	-- 1285
                    			"0111111111111111" after 150ns, 	-- 1285
                   				"1010101010101010" after 155ns, 	-- 
                    			"0101010101010101" after 160ns, 	-- 
                    			
                    			--SRA busA Test Values
                    			"1111111111111111" after 165ns,	-- 1285
                    			"0111111111111111" after 170ns, 	-- 1285
                   				"1010101010101010" after 175ns, 	-- 
                    			"0101010101010101" after 180ns; 	-- 
         
         
         
        						--Adder busA Test Values
            B_stimulus 		<=	"0000010100000101" after 5ns, 	-- 1285
                     			"1111101011111011" after 10ns, 	-- -1285
                     			"0000000000000001" after 15ns, 	-- 1
                     			"0000000000000000" after 20ns, 	-- 0
                    
                    			--Subtractor busA Test Values
                    			"0000010100000101" after 25ns,	-- 1285
                    			"1111101011111011" after 30ns, 	-- -1285
                   				"0000000000000001" after 35ns, 	-- 1
                    			"1111111111111111" after 40ns, 	-- -1
 
                    			--AND busA Test Values
                    			"1010101010101010" after 45ns,	-- 1285
                    			"0101010101010101" after 50ns, 	-- 1285
                   				"1010101010101010" after 55ns, 	-- 
                    			"1000000000000000" after 60ns, 	--                     

                    			--OR busA Test Values
                    			"1010101010101010" after 85ns,	-- 1285
                    			"0101010101010101" after 90ns, 	-- 1285
                   				"1010101010101010" after 95ns, 	-- 
                    			"1000000000000000" after 100ns, 	-- 
                    			
                    			--XOR busA Test Values
                    			"1010101010101010" after 105ns,	-- 1285
                    			"0101010101010101" after 110ns, 	-- 1285
                   				"0101010101010101" after 115ns, 	-- 
                    			"0000010100000101" after 120ns; 	-- 
                  
                    
		
            wait;
    end process stimulus;			

	DUT : 	ENTITY xil_defaultlib.ALU_16(Structural)
			PORT MAP(
					A			=>	A_stimulus,
					B			=>	B_stimulus,
					ctr			=>	ctr_stimulus,
					result		=>	result_res,
					overflow	=>	overflow_res,
					carry_out	=>	carry_out_res,
					zero		=> 	zero_res
					);
						
end Behavioral;
