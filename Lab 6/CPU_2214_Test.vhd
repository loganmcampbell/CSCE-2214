library ieee;
use ieee.std_logic_1164.all;


entity CPU_2214_Test is
end entity CPU_2214_Test;


architecture mixed of CPU_2214_Test is
    constant tick : time := 100 ns;
    signal reset, clock : std_logic;
    signal instruction : std_logic_vector(0 to 15);
begin
    CPU_2214_Sim : entity work.CPU_2214
        port map(
            clk		=> clock,
            clear	=> reset,
            instruction => instruction
        );

    driver : process is
    begin
        -- reset the system
        reset <= '0'; instruction <= x"0000"; wait for 50 ns;
        reset <= '1';

        -- ADD r2, r1, r1   
        instruction <= x"0211"; wait for tick;

        -- ADDI r3, r2, 5   
        instruction <= x"4325"; wait for tick;

        -- SUB r4, r3, r2   
        instruction <= x"1432"; wait for tick;

        -- SUBI r5, r4, -4  
        instruction <= x"554C"; wait for tick;

        -- AND r6, r3, r5   
        instruction <= x"2635"; wait for tick;

        -- OR r7, r5, r4    
        instruction <= x"3754"; wait for tick;

        wait;
    end process driver;

    clock_p : process is
    begin
        for i in 0 to 18 loop
            clock <= '1'; wait for tick/2;
            clock <= '0'; wait for tick/2;
        end loop;
        wait;
    end process clock_p;
end architecture mixed;