--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:56:56 09/13/2017
-- Design Name:   
-- Module Name:   C:/Users/lc002/Desktop/C o m p u t e r O r g/Lab1Part2/Full_Adder/Full_Addertest.vhd
-- Project Name:  Full_Adder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
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
 
ENTITY Full_Addertest IS
END Full_Addertest;
 
ARCHITECTURE behavior OF Full_Addertest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Sout : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sout : std_logic;
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sout => Sout,
          Cout => Cout
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		cin <= '0'; A <= '0'; B <= '0';	--0	S = 0		Out = 0
			wait for 100 ns;
		cin <= '0'; A <= '0'; B <= '1';	--1	S = 1		Out = 0
			wait for 100 ns;
		cin <= '0'; A <= '1'; B <= '0';	--2	S = 1		Out = 0
			wait for 100 ns;
		cin <= '0'; A <= '1'; B <= '1';	--3	S = 0		Out = 1
			wait for 100 ns;
		cin <= '1'; A <= '0'; B <= '0';	--4	S = 1		Out = 0
			wait for 100 ns;
		cin <= '1'; A <= '0'; B <= '1';	--5	S = 0		Out = 1
			wait for 100 ns;
		cin <= '1'; A <= '1'; B <= '0';	--6	S = 0		Out = 1
			wait for 100 ns;
		cin <= '1'; A <= '1'; B <= '1';	--7	S = 1		Out = 1
			wait for 100 ns;
      wait;
   end process;

END;
