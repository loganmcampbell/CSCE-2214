----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:53:09 08/30/2017 
-- Design Name: 
-- Module Name:    counter606024 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter606024 is
	port (
				clock		: 	in 	std_logic;
				enable 	:	in 	std_logic;
				reset		:	in 	std_logic;
				--cout is the carry variable
				cout		:	out 	std_logic;
				seconds	:	out	std_logic_vector	(5 downto 0);
				minutes	:	out	std_logic_vector	(5 downto 0);
				hours		:	out	std_logic_vector	(5 downto 0)
			);
			
end counter606024;

architecture Behavioral of counter606024 is
	signal count1, count2, count3 : std_logic_vector (5 downto 0);
	signal cout_temp :  std_logic;

begin
	process(clock)
	begin
			--cout_temp		|| c a r r y  o u t
			if rising_edge (clock) and cout_temp = '1' then
				cout_temp <= '0';
			end if;
			
			--count 1 		|| s e c o n d ( s ) 
			if 		rising_edge (clock) 	and reset 	= '1' 	then
				count1 <= "000000";
			elsif 	rising_edge(clock) 	and enable 	= '1' 	and count1 = "111100" then
				count1 <= "000000";
			elsif 	rising_edge (clock) 	and enable 	= '1' 	then
				count1 <= count1 + "000001" ;
			end if;
			
			--count 2 		|| m i n u t e ( s )
			if 		rising_edge (clock) 	and reset 	= 	'1' 	then
				count2 <= "000000";
			elsif 	rising_edge(clock) 	and enable 	= 	'1' 	and count2 = "111100" 	then
				count2 <= "000000";
			elsif 	rising_edge (clock) 	and enable 	= 	'1' 	and count1 = "111011"	then
				count2 <= count2 + "000001" ;
			end if;
			
			--count 3 		|| h o u r ( s )
			if 		rising_edge (clock) 	and reset 	= 	'1' 	then
				count3 <= "000000";
			elsif 	rising_edge(clock) 	and enable 	= 	'1' 	and count3 = "111100" 	then
				count3 <= "000000";
				cout_temp   <= '1';
			elsif 	rising_edge (clock) 	and enable 	= 	'1' 	and count2 = "111011"	then
				count3 <= count3 + "000001" ;
			end if;

	end process;
		
		--assign the values to the output(s)
		seconds 	<= count1;
		minutes 	<= count2;
		hours		<= count3;
		cout 		<= cout_temp;


end Behavioral;

