----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:30 09/13/2017 
-- Design Name: 
-- Module Name:    RippleCarryAdder - Behavioral 
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

entity RippleCarryAdder is
port (
			A 		: in std_logic_vector (3 downto 0);
			B 		: in std_logic_vector (3 downto 0);
			cin	: in std_logic;
			sout	: out std_logic;
			cout	: out std_logic
		);

end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is

-- create signals
signal ripple_0, ripple_1, ripple_2, ripple_3 : std_logic_vector (3 downto 0);
--define our full adder component
component Full_Adder
	port
		(
				A			:	in std_logic;
				B			:	in std_logic;
				Cin		:	in std_logic;

				Sout		:	out std_logic;
				Cout		:	out std_logic

		);
end component;




begin
--instantiate that full adder 4 times... here.




end Behavioral;

