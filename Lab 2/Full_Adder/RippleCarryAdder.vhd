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
			SOUT	: out std_logic_vector	(3 downto 0);
			COUT	: out std_logic
		);

end RippleCarryAdder;

architecture Behavioral of RippleCarryAdder is

-- create signals

signal ripple_0, ripple_1, ripple_2 : std_logic;

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

ripple0 : Full_Adder port map
(
	A 		=>  	A(0),
	B 		=>  	B(0),
	Cin 	=> 	cin,
	
	Sout	=>		SOUT(0),
	Cout 	=>		ripple_0
);

ripple1: Full_Adder port map
(
	A 		=>  	A(1),
	B 		=>  	B(1),
	Cin 	=> 	ripple_0,
	
	Sout	=>		SOUT(1),
	Cout 	=>		ripple_1
);


ripple2 : Full_Adder port map
(
	A 		=>  	A(2),
	B 		=>  	B(2),
	Cin 	=> 	ripple_1,
	
	Sout	=>		SOUT(2),
	Cout 	=>		ripple_2
);


ripple3 : Full_Adder port map
(
	A 		=>  	A(3),
	B 		=>  	B(3),
	Cin 	=> 	ripple_2,
	
	Sout	=>		SOUT(3),
	Cout 	=>		cout
);



end Behavioral;

