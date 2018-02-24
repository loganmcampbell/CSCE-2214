--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:53:07 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/lc002/Desktop/Lab_4/Lab4/alutest.vhd
-- Project Name:  Lab4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU_16Bit
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
 
ENTITY alutest IS
END alutest;
 
ARCHITECTURE behavior OF alutest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU_16Bit
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         Sout : OUT  std_logic_vector(15 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal Sout : std_logic_vector(15 downto 0);
   signal Cout : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU_16Bit PORT MAP (
          A => A,
          B => B,
          S => S,
          Sout => Sout,
          Cout => Cout
        );

   -- Clock process definitions
  stim_proc : PROCESS

     BEGIN

		 A    <= x"0064"; --100
		 B    <= x"00E6"; --230
		 S    <= "00"; --Add
		 wait for 100 ns;
		 A    <= x"FFEC"; ---20
		 B    <= x"00A0"; --60
		 S    <= "00"; --Add
		 wait for 100 ns;
		 A    <= x"0001"; --1
		 B    <= x"0001"; --1
		 S    <= "00"; --Add
		 wait for 100 ns;
		 A    <= x"01F4"; --500
		 B    <= x"0154"; --340
		 S    <= "01"; --Sub
		 wait for 100 ns;
		 A    <= x"0037"; --55
		 B    <= x"0046"; --70
		 S    <= "01"; --Sub
		 wait for 100 ns;
		 A    <= x"FFFF"; ---1
		 B    <= x"000E"; --14
		 S    <= "01"; --Sub
		 wait for 100 ns;
		 A    <= x"0080"; --128
		 B    <= x"0200"; --512
		 S    <= "10"; --And
		 wait for 100 ns;
		 A    <= x"0BB8"; --3000
		 B    <= x"0002"; --2
		 S    <= "10"; --And
		 wait for 100 ns;
		 A    <= x"14DE"; --5342
		 B    <= x"03D2"; --978
		 S    <= "10"; --And
		 wait for 100 ns;
		 A    <= x"0010"; --16
		 B    <= x"0008"; --8
		 S    <= "11"; --Or
		 wait for 100 ns;
		 A    <= x"0000"; --0
		 B    <= x"0929"; --2345
		 S    <= "11"; --Or
		 wait for 100 ns;
		 A    <= x"FFFF"; ---1
		 B    <= x"0005"; --5
		 S    <= "11"; --Or

		 wait for 100 ns;
   end process;

END Behavior;
