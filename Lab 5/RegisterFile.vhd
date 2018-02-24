----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:23:13 10/25/2017 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterFile is
 port
 (
	clk: in std_logic; 										-- positive edge triggered clock
	clear:    in std_logic; 								-- asynchronous reset
	
	a_addr: in std_logic_vector ( 3 downto 0); 		-- input data port
	a_data: in std_logic_vector (15 downto 0); 		-- register select for input a
	load: in std_logic; 										-- load enable
	
	b_addr: in std_logic_vector ( 3 downto 0); 		-- register select for output b
	c_addr: in std_logic_vector ( 3 downto 0);  		-- register select for output c 
	
	b_data: out std_logic_vector (15 downto 0); 		-- first output data port
	c_data: out std_logic_vector (15 downto 0) 		-- second output data port
	
  );

end RegisterFile;

architecture syn of RegisterFile is
		-- Define Register File
		type ram_type is array (15 downto 0) of std_logic_vector(15 downto 0);
		-- Create a pointer signal that points to the 'reg' from the previous line
		signal Reg_File : ram_type;		
		
		
		
		
begin
	process(clk, load, clear)
	begin
		if (clear = '0') then
		-- inital
		Reg_File(0) <= "0000000000000000";
		Reg_File(1) <= "0000000000000001";
		Reg_File(2) <= "0000000000000000";
		Reg_File(3) <= "0000000000000000";
		Reg_File(4) <= "0000000000000000";
		Reg_File(5) <= "0000000000000000";
		Reg_File(6) <= "0000000000000000";
		Reg_File(7) <= "0000000000000000";
		Reg_File(8) <= "0000000000000000";
		Reg_File(9) <= "0000000000000000";
		Reg_File(10) <= "0000000000000000";
		Reg_File(11) <= "0000000000000000";
		Reg_File(12) <= "0000000000000000";
		Reg_File(13) <= "0000000000000000";
		Reg_File(14) <= "0000000000000000";
		Reg_File(15) <= "0000000000000000";
		
		elsif (clk'event and clk='1') then
		
			if (load = '1') then				
			-- Register Write 
			-- Use the conv_integer(<binary>) Function in VHDL to convert a <binary> signal into an integer
			
			--LOAD (ASSERTED) : A_ADDRESS IS ASSIGNED DATA_A.
			Reg_File(conv_integer(a_addr)) <= a_data;
			
			
			
			
			
			
			end if;
		
		--RUN REGARDLESS OF CLOCK SIGNAL IS 1 
		b_data <= Reg_File(conv_integer(b_addr));
		c_data <= Reg_File(conv_integer(c_addr));

		end if;
		-- Set R0 and R1
		Reg_File(0) <= "0000000000000000";
		Reg_File(1) <= "0000000000000001";
		
	end process;
	-- Register Read
	
end syn;
