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
    "1101001000000000",		--0002	lubi r1, x00		$v0 = r1 = x0040
    "1110001001000000",		--0004	llbi r1, x40
    "1011000001000001",		--0006	sw r0 r1 1
    "1101010000010000",		--0008	lubi r2, x10		$v1 = r2 = x1010
    "1110010000010000",		--000a	llbi r2, x10
    "1011000010000010",		--000c	sw r0 r2 2
    "1101011000000000",		--000e	lubi r3 x00		$v2 = r3 = x000f
    "1110011000001111",		--0010	llbi r3 x0f
    "1011000011000011",		--0012	sw r0 r3 3
    "1101100000000000",		--0014	lubi r4 x00		$v3 = r4 = x00f0
    "1110100011110000",		--0016	llbi r4 xf0
    "1011000100000100",		--0018	sw r0 r4 4
    "1101101000000000",		--001a	lubi r5 x00		$t0 = r5 = x0000
    "1110101000000000",		--001c	llbi r5 x00
    "1011000101000101",		--001e	sw r0 r5 5
    "1101110000000000",		--0020	lubi r6 x00		$a0 = r6 = x0010
    "1110110000010000",		--0022	llbi r6 x10
    "1011000110000110",		--0024	sw r0 r6 6
    "1101111000000000",		--0026	lubi r7 x00		$a1 = r7 = x0005
    "1110111000000101",		--0028	llbi r7 x05
    "1011000111000111",		--002a	sw r0 r7 7
    "0000000000000000",		--002c	nop				WHILE r7 > 0
    "1010000001000001",		--002e	lw r1 r0 1
    "0011111111000001",		--0030	subi r7 r7 1		r7 = r7 - 1
    "1011000111000111",		--0032	sw r0 r7 7
    "1010110101000000",		--0034	lw r5, r6, 0		r5 = mem[r6]
    "1011000001000001",		--0036	sw r1 r0 1		if r5 > x0100
    "1101001000000001",		--0038	lubi r1 x01
    "0000101001001101",		--003a	slt r1 r5 r1
    "1100001000101011",		--003c	beq r1 r0 0x56		BRANCH TO 56 = 1010110 >> 101011
    "1010000001000001",		--003e	lw r1 r0 1
    "0001001000001010",		--0040	srl r1 r1 r0		r1 = r1/8
    "0001001000001010",		--0042	srl r1 r1 r0
    "0001001000001010",		--0044	srl r1 r1 r0
    "1011000001000001",		--0046	sw r0 r1 1
    "0000010001010011",		--0048	or r2 r2 r1
    "1011000010000010",		--004a	sw r0 r2 2
    "1011000001000001",		--004c	sw r0 r1 1		mem[r6]=xff00
    "1101001011111111",		--004e	lubi r1 xff
    "1011110001000000",		--0050	sw r6 r1 0
    "1010000001000001",		--0052	lw r1 r0 1		END OF IF
    "1100000000110110",		--0054	beq r0 r0 0x6c		BRANCH TO 6C = 01101100 >> 110110
    "0000000000000000",		--0056	nop				START OF ELSE
    "1010000001000001",		--0058	lw r0 r1 1
    "0001011000011001",		--005a	sll r3 r3 r0
    "0001011000011001",		--005c	sll r3 r3 r0
    "1011000001000011",		--005e	sw r3 r0 3
    "0000100011100100",		--0060	xor r4 r4 r3
    "1011000100000100",		--0062	sw r4 r0 4
    "1011000001000001",		--0064	sw r1 r0 1
    "1110001011111111",		--0066	llbi r1 0xff
    "1011110001000000",		--0068	sw r1 r6 0
    "1010000001000001",		--006a	lw r1 r0 1
    "0000000000000000",		--006c	nop				END OF ELSE
    "0010110110000001",		--006e	addi r6 r6 2
    "1011000110000110",		--0070	sw r6 r0 0x6
    "1011000001000001",		--0072	sw r1 r0 0x1
    "0000111000001110",		--0074	sgt r1 r7 r0
    "1100001000010110",		--0076	beq r1 r0 0x2C		BRANCH TO 2C = 101100 >> 010110
    "0000000000000000",		--0078	nop
    "0000000000000000",		--007a	nop
    "1111000000000000",		--007c	nop
    "1100000000000000"		--007e	beq r0 r0 0x00		RESTART PROGRAM
	);
	begin
	instr_addr <= pc(6 downto 1);
	instruction <= program(to_integer(unsigned(instr_addr)));

	end Behavioral;
