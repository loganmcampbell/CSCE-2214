--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:23:25 09/18/2017
-- Design Name:   
-- Module Name:   C:/Users/lc002/Desktop/C o m p u t e r O r g/Lab1Part2/Full_Adder/Ripple_TB.vhd
-- Project Name:  Full_Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RippleCarryAdder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Ripple_TB IS
END Ripple_TB;
 
ARCHITECTURE behavior OF Ripple_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RippleCarryAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         sout : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := "0000";
   signal B : std_logic_vector(3 downto 0) := "0000"; 
   signal cin : std_logic := '0';

 	--Outputs
   signal sout : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RippleCarryAdder PORT MAP (
          A => A,
          B => B,
          cin => cin,
          sout => sout,
          cout => cout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
      wait for 100 ns;
	-- CIN = 0			A = 1				B = 2
		cin <= '0'; 	A <= "0001"; 	B <= "0010";
		wait for 100 ns;
	-- CIN = 0			A = 3				B = 4
		cin <= '0'; 	A <= "0011"; 	B <= "0100";
		wait for 100 ns;
	-- CIN = 0			A = 5				B = 6
		cin <= '0'; 	A <= "0101"; 	B <= "0110";
		wait for 100 ns;
	-- CIN = 0			A = 7				B = 8
		cin <= '0'; 	A <= "0111"; 	B <= "1000";		
		wait for 100 ns;
		
	-- CIN = 1			A = 1				B = 2
		cin <= '1'; 	A <= "0001"; 	B <= "0010";
		wait for 100 ns;
	-- CIN = 1			A = 3				B = 4
		cin <= '1'; 	A <= "0011"; 	B <= "0100";		
		wait for 100 ns;
	-- CIN = 1			A = 5				B = 6
		cin <= '1'; 	A <= "0101"; 	B <= "0110";
		wait for 100 ns;
	-- CIN = 1			A = 7				B = 8
		cin <= '1'; 	A <= "0111"; 	B <= "1000";
		wait for 100 ns;

      wait;
		
   end process;

END;
