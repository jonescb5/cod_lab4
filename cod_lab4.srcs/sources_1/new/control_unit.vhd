----------------------------------------------------------------------------------
-- Company:
-- Engineer:
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
        RegDst			: 	out std_logic;
        MemRead			: 	out std_logic;
        ALUsrc			: 	out std_logic;
        RegWriteEn	: 	out std_logic;
        MemtoReg		: 	out std_logic;
        ALUOp			  : 	out std_logic_vector(3 downto 0);
        ALUOpSel    :   out std_logic;
        MemWrite		: 	out std_logic;
        Branch			:	  out std_logic;
        OpCode			: 	in std_logic_vector(2 downto 0)
        );

end control_unit;

architecture Behavioral of control_unit is
begin
  control : process(opcode)
  begin
    case opcode is
    --R type instructions
      when "000" =>
        RegDst			<= '1';
        MemRead			<= '0';
        ALUsrc			<= '0';
        RegWriteEn	<= '1';
        MemtoReg		<= '0';
        ALUOp			  <= "0000";
        ALUOpSel    <= '0';
        MemWrite		<= '0';
        Branch			<= '0';
      --ADDI
      when "001" =>
        RegDst			<= '0';
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn	<= '1';
        MemtoReg		<= '0';
        ALUOp			  <= "0000";
        ALUOpSel    <= '1';
        MemWrite		<= '0';
        Branch			<= '0';
      --SUBI
      when "010" =>
        RegDst			<= '0';
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn	<= '1';
        MemtoReg		<= '0';
        ALUOp			  <= "1000";
        ALUOpSel    <= '1';
        MemWrite		<= '0';
        Branch			<= '0';
      --LW
      when "011" =>
        RegDst			<= '1';
        MemRead			<= '1';
        ALUsrc			<= '1';
        RegWriteEn	<= '1';
        MemtoReg		<= '1';
        ALUOp			  <= "0000";
        ALUOpSel    <= '1';
        MemWrite		<= '0';
        Branch			<= '0';
      --SW
      when "100" =>
        RegDst			<= '0';
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn	<= '0';
        MemtoReg		<= '0';
        ALUOp			  <= "0000";
        ALUOpSel    <= '1';
        MemWrite		<= '1';
        Branch			<= '0';
      --STLI
      when "101" =>
        RegDst			<= '0';
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn	<= '0';
        MemtoReg		<= '0';
        ALUOp			  <= "1000";
        ALUOpSel    <= '1';
        MemWrite		<= '0';
        Branch			<= '0';
      --BE
      when "110" =>
        RegDst			<= '0';
        MemRead			<= '0';
        ALUsrc			<= '1';
        RegWriteEn	<= '0';
        MemtoReg		<= '0';
        ALUOp			  <= "1000";
        ALUOpSel    <= '1';
        MemWrite		<= '0';
        Branch			<= '1';
      --Error state
      when others =>
        RegDst			<= '0';
        MemRead			<= '0';
        ALUsrc			<= '0';
        RegWriteEn	<= '0';
        MemtoReg		<= '0';
        ALUOp			  <= "0000";
        ALUOpSel    <= '0';
        MemWrite		<= '0';
        Branch			<= '0';
      end case;
      end process control;
end Behavioral;
