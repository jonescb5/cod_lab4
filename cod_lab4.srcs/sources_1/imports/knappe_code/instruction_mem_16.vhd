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
	"0000000000000000",
	"0000000000000001",
	"0000000000000010",
	"0000000000000011",
	"0000000000000100",
	"0000000000000101",
	"0000000000000110",
	"0000000000000111",
	"0000000000001000",
	"0000000000001001",
	"0000000000001010",
	"0000000000001011",
	"0000000000001100",
	"0000000000001101",
	"0000000000001110",
	"0000000000001111"
	);
	begin
	instr_addr <= pc(4 downto 1);
	instruction <= program(to_integer(unsigned(instr_addr)));
	
	end Behavioral;
