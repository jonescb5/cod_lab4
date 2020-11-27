----------------------------------------------------------------------------------
-- Company:
-- Engineer: Christopher Jones
--
-- Create Date: 11/09/2020 10:53:33 PM
-- Design Name:
-- Module Name: control_unit - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
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
use IEEE.NUMERIC_STD.ALL;

entity control_unit is
port (
        RegDst			: 	out std_logic_vector(1 downto 0);
        MemRead			: 	out std_logic;
        ALUsrc			: 	out std_logic;
        RegWriteEn		: 	out std_logic;
        MemtoReg		: 	out std_logic;
        ALUctr			:	out std_logic_vector(4 downto 0);
        SEsel			:	out std_logic;
        MemWrite		: 	out std_logic;
        Branch			:	out std_logic;
        OpCode			: 	in std_logic_vector(3 downto 0);
        Func			:	in std_logic_vector(2 downto 0);
        prog_rst		:	out std_logic
        );

end control_unit;

architecture Behavioral of control_unit is

Signal ALUOp : std_logic_vector(3 downto 0);
signal ALUFunc : std_logic_vector(3 downto 0);
begin

ALUFunc(3) <= OpCode(0);
ALUFunc(2 downto 0) <= Func;

  control : process(opcode,ALUFunc)
  begin
    case opcode is
    --R1 type instructions
	when "0000" =>
        RegDst			<= "00";
        MemRead			<= '0';
        ALUsrc			<= '0';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= ALUFunc;
        prog_rst <= '0';
        
    --R2 type instructions    
	when "0001" =>
        RegDst			<= "00";
        MemRead			<= '0';
        ALUsrc			<= '0';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= ALUFunc;
        prog_rst <= '0';
        
        --addi
	when "0010" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0000";
        prog_rst <= '0';
        
	when "0011" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0001";
        prog_rst <= '0';
        
	when "0100" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0010";
        prog_rst <= '0';
        
	when "0101" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0011";
        prog_rst <= '0';
        
	when "0110" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0100";
        prog_rst <= '0';
        
	when "0111" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0101";
        prog_rst <= '0';
        
	when "1000" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0110";
        prog_rst <= '0';
        
	when "1001" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0111";
        prog_rst <= '0';
        
  	-- lw
	when "1010" =>
	    RegDst			<= "01";
        MemRead			<= '1';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '1';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0000";
        prog_rst <= '0';
        
    --     
	when "1011" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '0';
        MemtoReg		<= '0';
        MemWrite		<= '1';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0000";
        prog_rst <= '0';
        
	when "1100" =>
	    RegDst			<= "01";
        MemRead			<= '0';
        ALUsrc			<= '0';
        RegWriteEn		<= '0';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '1';
        SEsel			<= '0';
        ALUOp <= "0001";
        prog_rst <= '0';
        
	when "1101" =>
	    RegDst			<= "10";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '1';
        ALUOp <= "1110";
        prog_rst <= '0';
        
	when "1110" =>
	    RegDst			<= "10";
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn		<= '1';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '1';
        ALUOp <= "1111";
        prog_rst <= '0';
        
--	when "1111" =>
--	    RegDst			<= "00";
--        MemRead			<= '0';
--        ALUsrc			<= '0';
--        RegWriteEn		<= '0';
--        MemtoReg		<= '0';
--        MemWrite		<= '0';
--        Branch			<= '0';
--        SEsel			<= '0';
--        ALUOp <= "0000";
--        prog_rst <= '1';
        
	when others =>
		RegDst			<= "00";
        MemRead			<= '0';
        ALUsrc			<= '0';
        RegWriteEn		<= '0';
        MemtoReg		<= '0';
        MemWrite		<= '0';
        Branch			<= '0';
        SEsel			<= '0';
        ALUOp <= "0000";
        prog_rst <= '0';
	end case;

      end process control;
      
      
	alu_control : process(ALUOp)
	begin
		case ALUOp is
		
		when "0000" =>
			ALUctr <= "00000";
		when "0001" =>
			ALUctr <= "10000";
		when "0010" =>
			ALUctr <= "00001";
		when "0011" =>
			ALUctr <= "00010";
		when "0100" =>
			ALUctr <= "00011";
		when "0101" =>
			ALUctr <= "00100";
		when "0110" =>
			ALUctr <= "00101";
		when "0111" =>
			ALUctr <= "00110";
		when "1000" =>
			ALUctr <= "00111";
		when "1001" =>
			ALUctr <= "01000";
		when "1010" =>
			ALUctr <= "01001";
		when "1011" =>
			ALUctr <= "01010";
		when "1100" =>
			ALUctr <= "01011";
		when "1101" =>
			ALUctr <= "01100";
		when "1110" =>
			ALUctr <= "01101";
		when "1111" =>
			ALUctr <= "01110";
		when others =>
			ALUctr <= "00000";
		end case;
	end process alu_control;
end Behavioral;
