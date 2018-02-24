
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity CPU_2214 is
	port(
		clk	: in std_logic;
		clear : in std_logic;
		instruction : in std_logic_vector(15 downto 0)
 	);
end CPU_2214;

architecture Behavioral of CPU_2214 is
	COMPONENT ALU_16Bit
		port(	
		A		:	in		std_logic_vector(15 downto 0);
		B		:	in		std_logic_vector(15 downto 0);
		S		:	in		std_logic_vector(1 downto 0); --change in next lab
		Sout	:	out 	std_logic_vector(15 downto 0);
		Cout	:	out	std_logic
		);
	END COMPONENT;
	
	COMPONENT Registers
		port(
		clk	:	in	std_logic;
		clear	:	in  std_logic;
		
		a_addr:	in	std_logic_vector( 3 downto 0);
		a_data:	in	std_logic_vector(15 downto 0);
		load	:	in	std_logic;
		
		b_addr:	in	std_logic_vector( 3 downto 0);
		c_addr:	in	std_logic_vector( 3 downto 0);
		
		b_data:	out std_logic_vector(15 downto 0);
		c_data:	out std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Control
		port(
		op			: in std_logic_vector(3 downto0);
		alu_op		: out std_logic_vector(1 downto 0);
		alu_src  	: out std_logic
		);
		END COMPONENT;
		
	COMPONENT Signextend
		port(
			immIn			:	in	std_logic_vector( 3 downto 0);
			immOut			:	out	std_logic_vector(15 downto 0));
			END COMPONENT;
					
	component mux2_1
   generic (WIDTH : positive:=16);
	port(
		Input1			:	in		std_logic_vector(WIDTH-1 	downto 0);
		Input2			:	in		std_logic_vector(WIDTH-1 	downto 0);
		S				:	in		std_logic;
		Sout			:	out	std_logic_vector(WIDTH-1 	downto 0));
	end component;

			
	-- Signals
	signal   op						:	std_logic_vector( 3 downto 0)	;
	signal	rd						:	std_logic_vector( 3 downto 0)	;
	signal	rs						:	std_logic_vector( 3 downto 0)	;
	signal	rt						:	std_logic_vector( 3 downto 0)	;
	signal	sout_alu				:	std_logic_vector(15 downto 0)	;
	signal	cout					:	std_logic							;
	signal	rs_data					:	std_logic_vector(15 downto 0)	;
	signal	rt_data					:	std_logic_vector(15 downto 0)	;
	signal	ctrl_alu_src			: 	std_logic;
	signal 	ctrl_alu_op 			: 	std_logic_vector( 1 downto 0)	;
	signal	sign_out				:	std_logic_vector(15 downto 0)	;
	signal	mux_out					:	std_logic_vector(15 downto 0)	;
	
begin
	--------------------------------------------------------------------------
	-- Instruction Fetch
	--------------------------------------------------------------------------
	op <= instruction(15 downto 12);
	rd		<= instruction(11 downto  8);
	rs		<= instruction(7  downto  4);
	rt		<= instruction(3  downto  0);	
	--------------------------------------------------------------------------
	-- Instruction Decode
	--------------------------------------------------------------------------
	CPU_Control_0:			Control port map(
		op			=>	op,
		alu_op	=>	ctrl_alu_op,
		alu_src	=>	ctrl_alu_src
	);

	CPU_Registers_0:		Registers port map(
		clk			=>	clk,
		clear		=>	clear,
		
		a_addr		=>	rd,
		a_data		=>	sout_alu,
		load		=>	'1',
		
		b_addr		=>	rs,
		c_addr		=>	rt,
		
		b_data		=>	rs_data,
		c_data		=>	rt_data
	);

	CPU_signextend_0:		Signextend port map(
		immIn		=>	rt,
		immOut		=>	sign_out
	);	
	
	--------------------------------------------------------------------------
	-- Execute
	--------------------------------------------------------------------------
	CPU_ALU_0:				ALU_16Bit port map(
		A			=>	rs_data,
		B			=>	mux_out,
		S			=>	ctrl_alu_op,
		Sout		=>	sout_alu,
		Cout		=>	cout
	);

	CPU_alu_src_mux:		mux2_1 generic map(16) port map(
		Input1		=>	rt_data,
		Input2		=>	sign_out,
		S			=>	ctrl_alu_src,
		Sout		=>	mux_out
	);

	--------------------------------------------------------------------------
	-- Memory
	--------------------------------------------------------------------------

	-- Not for this Lab
	
	--------------------------------------------------------------------------
	-- Write Back
	--------------------------------------------------------------------------

	-- Not for this Lab

end Behavioral;

