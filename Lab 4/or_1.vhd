----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:45 09/13/2017 
-- Design Name: 
-- Module Name:    or_1 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- O R 
entity or_1 is
port (
			a :	in		std_logic;
			b :	in		std_logic;
			c :   in    std_logic;
			z :	out 	std_logic
		);
end	or_1;

architecture Behavioral of or_1 is
begin

	z <= a or b or c;
	
end Behavioral;

