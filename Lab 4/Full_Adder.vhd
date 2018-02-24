----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:06:39 09/13/2017 
-- Design Name: 
-- Module Name:    Full_Adder - Behavioral 
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


entity Full_Adder is
	port (
				A			:	in std_logic;
				B			:	in std_logic;
				Cin		:	in std_logic;
				
				Sout		:	out std_logic;
				Cout		:	out std_logic

			);

end Full_Adder;

architecture Behavioral of Full_Adder is

signal xor1_xor2, and1_or1, and2_or1, and3_or1 : std_logic;

	--COMPONENT AND 1
	component and_1
		port (
					a: in std_logic;
					b: in std_logic;
					z: out std_logic
				);
				
	end component;
	
	--COMPONENT AND 2
	component and_2
		port (
					a: in std_logic;
					b: in std_logic;
					z: out std_logic
				);
				
	end component;	
	
		--COMPONENT AND 3
	component and_3
		port (
					a: in std_logic;
					b: in std_logic;
					z: out std_logic
				);
				
	end component;
	
	--COMPONENT XOR 1
	component xor_1
		port (
					a: in std_logic;
					b: in std_logic;
					z: out std_logic
				);
	end component;
	
	--COMPONENT XOR 2
	component xor_2
		port (
					a: in std_logic;
					b: in std_logic;
					z: out std_logic
				);
	end component;	
	
	--COMPONENT OR
	component or_1
		port	(
					a: in std_logic;
					b: in std_logic;
					c: in std_logic;
					z: out std_logic
				);
	end component;
	
	
begin	
	
	-- A N D   G A T E S	---------
	AND10	: and_1 port map
	(
		a => A,
		b => B,
		z => and1_or1
	);
	
	AND20	: and_2 port map
	(
		a => A,
		b => Cin,
		z => and2_or1
	);
	
	AND30	: and_3 port map
	(
		a => B,
		b => Cin,
		z => and3_or1
	);
	---------------------------------------------------
	
	-- X O R   G A T E S	---------
	XOR10	: xor_1 port map
	(
		a => Cin,
		b => xor1_xor2,
		z => sout
	);
	
	XOR20	: xor_2 port map
	(
		a => A,
		b => B,
		z => xor1_xor2
	);
	
	
	
	---------------------------------------------------
	
	-- O R    G A T E S ---------
	OR10	: or_1 port map
	(
		a => and1_or1,
		b => and2_or1,
		c => and3_or1,
		z => Cout
	);
	
	
	---------------------------------------------------
				
	








end Behavioral;

