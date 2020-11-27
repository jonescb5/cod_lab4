library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( Clk      : in STD_LOGIC;
           PC_in    : in STD_LOGIC_VECTOR (15 downto 0);
           reset	: in STD_LOGIC;
           PC_out   : out STD_LOGIC_VECTOR (15 downto 0)
           );
end PC;

architecture Behavioral of PC is
    signal PC_in_hold : STD_logic_vector(15 downto 0) := "0000000000000000";
begin
 
-- 	process(reset)
-- 	begin
-- 		if(reset = '1') then
--    		pc_out <= "0000000000000000";
--		end if;
--	end process;
	
    process(clk)
    begin
    	if (reset = '1') then
    		pc_in_hold <= "0000000000000000";
        elsif (rising_edge(clk)) then
        	pc_in_hold <= pc_in; 
        end if; 
    end process;
    PC_out <= PC_in_hold; 
end Behavioral;
