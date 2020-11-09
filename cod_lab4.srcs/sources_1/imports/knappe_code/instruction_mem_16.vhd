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
-- 
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
signal instr_addr : std_logic_vector(3 downto 0);
type program_structure is array (0 to 15) of std_logic_vector(15 downto 0);
constant program : program_structure:=(
	"0000000000000000",	--	0
	"0010000010000100",	--	1	--addi r1,r0, 4
	"0010000100001000",	--	2	--addi r2,r0, 8
	"0000010100110000",	--	3	--add r3,r1,r2
	"0100101000000011",	--	4	--subi r4,r2, 3
	"0000100111010001",	--	5	--sub r5,r2,r3
	"0000000000000110",	--	6
	"0000000000000111",	--	7
	"0000000000001000",	--	8
	"0000000000001001",	--	9
	"0000000000001010",	--	a
	"0000000000001011",	--	b
	"0000000000001100",	--	c
	"0000000000001101",	--	d
	"0000000000001110",	--	e
	"0000000000001111"	--	f
	);
	begin
	instr_addr <= pc(4 downto 1);
	instruction <= program(to_integer(unsigned(instr_addr)));
	
	end Behavioral;
