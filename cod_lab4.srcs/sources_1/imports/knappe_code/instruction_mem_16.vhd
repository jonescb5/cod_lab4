----------------------------------------------------------------------------------
-- Company:
-- Engineer: Christopher Jones
--
-- Create Date: 11/05/2020 01:33:11 PM
-- Design Name:
-- Module Name: instruction_mem_16 - Behavioral
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
--22
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_mem_16 is
	Port (	pc			:	in std_logic_vector(15 downto 0);
			instruction	: 	out std_logic_vector(15 downto 0));
end instruction_mem_16;

architecture Behavioral of instruction_mem_16 is
signal instr_addr : std_logic_vector(5 downto 0);
type program_structure is array (0 to 63) of std_logic_vector(15 downto 0);
constant program : program_structure:=(
    "0000000000000000",		--0000
    "1101001000000000",		--0002  $v0 = R1 = x0040    lubi R1, x00
    "1110001001000000",		--0004             					llbi R1, x40
    "1011000001000001",		--0006            					sw R0 R1 1
    "1101010000010000",		--0008 	$v1 = R2 = x1010		lubi R2, x10
    "1110010000010000",		--000a 											llbi R2, x10
    "1011000010000010",		--000c											sw R0 R2 2
    "1101011000000000",		--000e  $V2 = R3 = x000F		lubi R3 x00
    "1110011000001111",		--0010											llbi R3 x0F
    "1011000011000011",		--0012											sw R0 R3 3
    "1101100000000000",		--0014 	$V3 = R4 = x00F0    lubi R4 x00
    "1110100011110000",		--0016											llbi R4 xF0
    "1011000100000100",		--0018 											sw R0 R4 4
    "1101101000000000",		--001a 	$t0 = R5 = x0000		lubi R5 x00
    "1110101000000000",		--001c   										llbi R5 x00
    "1011000101000101",		--001e											sw R0 R5 5
    "1101110000000000",		--0020  $a0 = R6 = x0010    lubi R6 x00
    "1110110000010000",		--0022											llbi R6 x10
    "1011000110000110",		--0024											sw R0 R6 6
    "1101111000000000",		--0026  $a1 = R7 = x0005		lubi R7 x00
    "1110111000000101",		--0028											llbi R7 x05
    "1011000111000111",		--002a											sw R0 R7 7
    "0000000000000000",		--002c  While R7 > 0  NOP
    "1010000001000001",		--002e                lw R1 R0 1
    "0011111111000001",		--0030  R7 = R7 - 1   subi R7 R7 1
    "1011000111000111",		--0032 								sw R0 R7 7
    "1010110101000000",		--0034  R5 = mem[R6]  lw R5, R6, 0
    "1011000001000001",		--0036  IF R5 > x0100 sw R1 R0 1
    "1101001000000001",		--0038                lubi R1 x01
    "0000101001001101",		--003a								slt R1 R5 R1
  	"1100001000101011",		--003c                beq R1 R0 056     BRANCH TO PC 0056 = 1010110 >> 101011
    "1010000001000001",		--003e                lw R1 R0 1
    "0001001000001010",		--0040  R1 = R1/8     srl R1 R1 R0
    "0001001000001010",		--0042                srl R1 R1 R0
    "0001001000001010",		--0044                srl R1 R1 R0
    "1011000001000001",		--0046 					  		sw R0 R1 1
    "0000010001010011",		--0048                or R2 R2 R1
    "1011000010000010",		--004a   							sw R0 R2 2
    "1011000001000001",		--004c mem[R6]=xFF00  sw R0 R1 1
    "1101001011111111",		--004e                lubi R1 xFF
    "1011110001000000",		--0050								sw R6 R1 0
    "1010000001000001",		--0052                lw R1 R0 1
    "1100000000110110",		--0054 END OF IF      beq R0 R0 after else BRANCH TO 6C = 01101100 >> 11 0110
    "0000000000000000",		--0056 START OF ELSE  NOP
    "1010000001000001",		--0058                lw R0 R1 1
    "0001011000011001",		--005a     					  SLL R3 R3 R0
    "0001011000011001",		--005c								SLL R3 R3 R0
    "1011000001000011",		--005e								SW R3 R0 3

    "0000100011100100",		--0060								XOR R4 R4 R3

    "1011000100000100",		--0062								SW R4 R0 4
    "1011000001000001",		--0064								SW R1 R0 1
    "1110001011111111",		--0066								LLBI R1 0xFF
    "1011110001000000",		--0068								SW R1 R6 0
    "1010000001000001",		--006a								LW R1 R0 1
    "0000000000000000",		--006c End of Else 		NOP
    "0010110110000001",		--006e						  	ADDI R6 R6 2
    "1011000110000110",		--0070								SW R6 R0 0x6
    "1011000001000001",		--0072								SW R1 R0 0x1
    "0000111000001110",		--0074								SGT R1 R7 R0
    "1100001000010110",		--0076								BEQ R1 R0 0x15     BRANCH TO 2C   101100 >> 010110
    "0000000000000000",		--0078								NOP
    "0000000000000000",		--007a								NOP
    "0000000000000000",		--007c								NOP
    "0000000000000000"		--007e								NOP

	);
	begin
	instr_addr <= pc(6 downto 1);
	instruction <= program(to_integer(unsigned(instr_addr)));

	end Behavioral;
