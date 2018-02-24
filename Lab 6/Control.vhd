library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity Control is
	port(
		op			:	in	std_logic_vector( 3 downto 0);
		alu_op		:	out	std_logic_vector( 1 downto 0);
		alu_src		:	out	std_logic
		);
End Control;

architecture syn of Control is

begin
	process (op) is
	begin
		case op is

			-- OPERATION	:ADD
			when x"0" =>
				alu_op		<=	"00";
				alu_src		<=	'0';

			-- OPERATION 	:SUB
			when x"1" =>
				alu_op		<=	"01";
				alu_src		<=	'0';
		

			-- OPERATION	:AND
			when x"2" =>
				alu_op		<= "10";
				alu_src		<= '0';

			-- OPERATION	:OR
			when x"3" =>
				alu_op		<=	"11";
				alu_src		<= '0';
			

			-- OPERATION 	:ADDI
			when x"4" =>
				alu_op		<= "00";
				alu_src		<= '1';
				

			-- OPERATION	:SUBI
			when x"5" =>
				alu_op		<= "01";
				alu_src		<= '1';

			-- OPERATION 	:LOAD WORD

			-- Not for this lab

			-- OPERATION	:STORE WORD

			-- Not for this lab	
	
			-- OPERATION	:SET LESS THAN

			-- Not for this lab

			when others =>
				alu_op	<=	"00";
				alu_src	<=	'0';				

		end case;
	end process;
end syn;