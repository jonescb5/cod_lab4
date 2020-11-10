library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port ( Clk      : in STD_LOGIC;
           PC_in    : in STD_LOGIC_VECTOR (15 downto 0);
           PC_out   : out STD_LOGIC_VECTOR (15 downto 0)
           );
end PC;

architecture Behavioral of PC is
    signal PC_in_hold : STD_logic_vector(15 downto 0) := "0000000000000000";
begin
 
    process(clk)
    begin
        if (rising_edge(clk)) then 
            PC_out <= PC_in_hold; 
        end if; 
        pc_in_hold <= pc_in; 
    end process;
end Behavioral;
