----------------------------------------------------------------------------------
-- Company: VCU
-- Engineer: Christopher Knappe
-- 
-- Create Date: 11/04/2020 03:12:59 PM
-- Design Name: data memory  
-- Module Name: mem_16 - Behavioral
-- Project Name: single cycle 16-bit processor 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity mem_16 is
    Port ( clk : in std_logic;
           mem_access_addr : in STD_LOGIC_VECTOR (15 downto 0);
           mem_write_data : in STD_LOGIC_VECTOR (15 downto 0);
           mem_read_data : out STD_LOGIC_VECTOR (15 downto 0);
           mem_read, mem_write : in STD_LOGIC;
       
           mem_disp_access_addr : in STD_LOGIC_VECTOR (7 downto 0);
           mem_disp_data : out std_logic_vector(15 downto 0);
           reset	:	in std_logic
           );
end mem_16;

architecture Behavioral of mem_16 is
    type data_mem is array (0 to 255) of std_logic_vector (15 downto 0);
    signal ram_addr : std_logic_vector(7 downto 0);
    signal disp_ram_addr : std_logic_vector(7 downto 0);
    signal RAM : data_mem := (	x"0000",
    							x"0000",
    							x"0000",
    							x"0000",--Mem(3)
    							x"0000",
    							x"0000",
    							x"0000",
    							x"0000",--Mem(7)
    							x"0000",
    							x"0000",
    							x"0000",
    							x"0000",--Mem(11)
    							x"0000",
    							x"0000",
    							x"0000",
    							x"0000",--Mem(15)
    							x"0101",
    							x"0110",
    							x"0011",
    							x"00F0",--Mem(19)
    							x"00FF",
    							others=> (others=>'0'));
begin
    
    ram_addr <= mem_access_addr(7 downto 0);
    process(clk)
    begin
    	if(reset = '1') then
    		RAM <= (	x"0000",
    				x"0000",
    							x"0000",
    							x"0000",--Mem(3)
    							x"0000",
    							x"0000",
    							x"0000",
    							x"0000",--Mem(7)
    							x"0000",
    							x"0000",
    							x"0000",
    							x"0000",--Mem(11)
    							x"0000",
    							x"0000",
    							x"0000",
    							x"0000",--Mem(15)
    							x"0101",
    							x"0110",
    							x"0011",
    							x"00F0",--Mem(19)
    							x"00FF",
    							others=> (others=>'0'));
        elsif(rising_edge(clk)) then 
            if( mem_write = '1') then
                RAM(to_integer(unsigned(ram_addr))) <= mem_write_data;
        	end if;
        end if;
    end process;
    mem_read_data <= RAM(to_integer(unsigned(ram_addr))) when (mem_read = '1') else x"0000";
    mem_disp_data <= RAM(to_integer(unsigned(mem_disp_access_addr)));
end Behavioral;
