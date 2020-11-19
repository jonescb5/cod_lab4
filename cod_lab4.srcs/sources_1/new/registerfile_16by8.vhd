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
			reg_write_enable:	in std_logic
			--reg_reset		:	in std_logic
			);
end registerfile_16by8;

architecture Behavioral of registerfile_16by8 is
type registers is array ( 0 to 7) of std_logic_vector(15 downto 0);
signal reg_block : registers := ((others=> (others=>'0')));


begin


	--write_proc : process(reg_addr_c, reg_data_write)
	write_proc : process(clk)
		begin
			if (rising_edge(clk)) then
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
				
--	read_a_proc : process(reg_addr_a,reg_addr_b)
--		begin
--				--if (rising_edge(clk)) then
--					case reg_addr_a is
--						when "001" =>
--							reg_data_a <= reg_block(1);
--						when "010" =>
--							reg_data_a <= reg_block(2);	
--						when "011" =>
--							reg_data_a <= reg_block(3);
--						when "100" =>
--							reg_data_a <= reg_block(4);
--						when "101" =>
--							reg_data_a <= reg_block(5);
--						when "110" =>
--							reg_data_a <= reg_block(6);
--						when "111" =>
--							reg_data_a <= reg_block(7);
--						when others =>
--							reg_data_a <= "0000000000000000";
--					end case;
--				--end if;
--		end process read_a_proc;
		
--	read_b_proc : process(reg_addr_b,reg_addr_a)
--		begin
--				--if (rising_edge(clk)) then
--					case reg_addr_b is
--						when "001" =>
--							reg_data_b <= reg_block(1);
--						when "010" =>
--							reg_data_b <= reg_block(2);	
--						when "011" =>
--							reg_data_b <= reg_block(3);
--						when "100" =>
--							reg_data_b <= reg_block(4);
--						when "101" =>
--							reg_data_b <= reg_block(5);
--						when "110" =>
--							reg_data_b <= reg_block(6);
--						when "111" =>
--							reg_data_b <= reg_block(7);
--						when others =>
--							reg_data_b <= "0000000000000000";
--					end case;
--				--end if;
--		end process read_b_proc;	
end Behavioral;
