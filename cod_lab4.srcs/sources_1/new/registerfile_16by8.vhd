----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Christopher Jones
-- 
-- Create Date: 11/04/2020 03:23:14 PM
-- Design Name: 
-- Module Name: registerfile_16by8 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registerfile_16by8 is
	Port (	clk				:	in std_logic;
			reg_addr_a		:	in std_logic_vector(2 downto 0);
			reg_addr_b		:	in std_logic_vector(2 downto 0);
			reg_addr_c		:	in std_logic_vector(2 downto 0);
			reg_data_a		:	out std_logic_vector(15 downto 0);
			reg_data_b		:	out std_logic_vector(15 downto 0);
			reg_data_write	:	in std_logic_vector(15 downto 0);
			reg_write_enable:	in std_logic;
			reset			:	in std_logic;
			
			reg_contents	:	out std_logic_vector(127 downto 0)		
			);
end registerfile_16by8;

architecture Behavioral of registerfile_16by8 is
type registers is array ( 0 to 7) of std_logic_vector(15 downto 0);
signal reg_block : registers := ((others=> (others=>'0')));


begin
	
	reg_contents(15 downto 0)	<=	reg_block(0);
	reg_contents(31 downto 16)	<=	reg_block(1);
	reg_contents(47 downto 32)	<=	reg_block(2);
	reg_contents(63 downto 48)	<=	reg_block(3);
	reg_contents(79 downto 64)	<=	reg_block(4);
	reg_contents(95 downto 80)	<=	reg_block(5);
	reg_contents(111 downto 96)	<=	reg_block(6);
	reg_contents(127 downto 112)	<=	reg_block(7);


	write_proc : process(clk)
		begin
			if (reset = '1') then
				reg_block <= ((others=>(others=>'0')));
			elsif (rising_edge(clk)) then
				if (reg_write_enable = '1') then
					case reg_addr_c is
						when "001" =>
							reg_block(1) <= reg_data_write;
						when "010" =>
							reg_block(2) <= reg_data_write;	
						when "011" =>
							reg_block(3) <= reg_data_write;
						when "100" =>
							reg_block(4) <= reg_data_write;
						when "101" =>
							reg_block(5) <= reg_data_write;
						when "110" =>
							reg_block(6) <= reg_data_write;
						when "111" =>
							reg_block(7) <= reg_data_write;
						when others =>
							reg_block(0) <= "0000000000000000";
					end case;
				end if;
			end if;
		end process write_proc;	
		
reg_data_a <= x"0000" when reg_addr_a = "000" else reg_block(to_integer(unsigned(reg_addr_a)));
reg_data_b <= x"0000" when reg_addr_b = "000" else reg_block(to_integer(unsigned(reg_addr_b)));
				
	
end Behavioral;
