library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity Registers is
	port(
		clk	:	in	 std_logic;
		clear	:	in  std_logic;
		
		a_addr:	in	 std_logic_vector( 3 downto 0);
		a_data:	in	 std_logic_vector(15 downto 0);
		load	:	in	 std_logic;
		
		b_addr:	in	 std_logic_vector( 3 downto 0);
		c_addr:	in	 std_logic_vector( 3 downto 0);
		
		b_data:	out std_logic_vector(15 downto 0);
		c_data:	out std_logic_vector(15 downto 0)
		);
End Registers;

architecture syn of Registers is
	type ram_type is array (15 downto 0) of std_logic_vector(15 downto 0);
	signal reg_file	:	ram_type;
begin
	process(clk, load, clear)
	begin
		if (clear = '0') then
			reg_file(0)	<= x"0000";
			reg_file(1)	<= x"0000";
			reg_file(2)	<= x"0000";
			reg_file(3)	<= x"0000";

			reg_file(4)	<= x"0000";
			reg_file(5)	<= x"0000";
			reg_file(6)	<= x"0000";
			reg_file(7)	<= x"0000";
		
			reg_file(8)	<= x"0000";
			reg_file(9)	<= x"0000";
			reg_file(10)	<= x"0000";
			reg_file(11)	<= x"0000";

			reg_file(12)	<= x"0000";
			reg_file(13)	<= x"0000";
			reg_file(14)	<= x"0000";
			reg_file(15)	<= x"0000";
		elsif (clk'event and clk='1') then
			if (load = '1') then
					reg_file(conv_integer(a_addr)) <= a_data;
			end if;
		end if;
		reg_file(0)	<= x"0000";
		reg_file(1)	<= x"0001";
	end process;
	b_data <= reg_file(conv_integer(b_addr));
	c_data <= reg_file(conv_integer(c_addr));
end syn;

--		if (clear = '0') then
--			for i in 15 downto 0 loop
--				REG(i) <= x"0000";
--			end loop;
--		elsif (rising_edge(clk) and load = '1') then
--			REG(conv_integer(a_addr)) <= a_data;
--		end if;		
