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
	"0010000010000100",	--	1	--addi r1,r0, 4		r1 = 4
	"0010000100001000",	--	2	--addi r2,r0, 8		r2 = 8
	"0000010100110000",	--	3	--add r3,r1,r2		r3 = r1+r2 = 4+8 = 12
	"0100101000000011",	--	4	--subi r4,r2, 3		r4 = r2 - 3 = 8-3 = 5
	"0000100111011000",	--	5	--sub r5,r2,r3		r5 = r2 - r3 = 8 - 12 = -4
	"1011010000001000",	--	6 --sw r5, 8(r0)
	"0001000001100101",	--	7 --sll r6,r4,r0 = 10
	"0000100001110110",	--	8 --srl r7, r2, r0      R7 = 4 = (r2 >> 1)
	"0000010101010100",	--	9	-- XOR r5, r1, r2    r5 = r1 XOR r2 = 12
	"0000000000000000",	--	a
	"0000000000000000",	--	b
	"0110001000001000",	--	c --LW r4, 8(r0)
	"0000000000000000",	--	d
	"0000000000000000",	--	e
	"1110011110000000"		--	f	--BEQ r1, r7 0 branch to PC 0 if r1 = r7

	);
	begin
	instr_addr <= pc(4 downto 1);
	instruction <= program(to_integer(unsigned(instr_addr)));

	end Behavioral;
