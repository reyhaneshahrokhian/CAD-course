library IEEE;
use IEEE.std_logic_1164.all;

entity lift_ctr_tb is
end lift_ctr_tb;

architecture testbench of lift_ctr_tb is
    -- Constants
    constant CLK_PERIOD: time := 10 ns;
    
    -- Component declaration
    component lift_ctr is
        port (
            button: in std_logic;
            clk: in std_logic;
            dco_s: in std_logic;
            go_down: in std_logic;
            go_up: in std_logic;
            dco: out std_logic;
            fan: out std_logic;
            motor: out std_logic;
            motor_dir: out std_logic
        );
    end component;
    
    -- Signals
    signal button_tb: std_logic := '0';
    signal clk_tb: std_logic := '0';
    signal dco_s_tb: std_logic := '0';
    signal go_down_tb: std_logic := '0';
    signal go_up_tb: std_logic := '0';
    signal dco_tb: std_logic;
    signal fan_tb: std_logic;
    signal motor_tb: std_logic;
    signal motor_dir_tb: std_logic;
    
begin
    -- Instantiate the lift_ctr module
    dut: lift_ctr
        port map (
            button => button_tb,
            clk => clk_tb,
            dco_s => dco_s_tb,
            go_down => go_down_tb,
            go_up => go_up_tb,
            dco => dco_tb,
            fan => fan_tb,
            motor => motor_tb,
            motor_dir => motor_dir_tb
        );
        
    -- Clock process
    clk_process: process
    begin
        while now < 1000 ns loop
            clk_tb <= '0';
            wait for CLK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    stimulus_process: process
    begin

        button_tb <= '0';
        wait for 10 ns;


        button_tb <= '1';
        dco_s_tb <= '0';
        wait for 20 ns;

        dco_s_tb <= '1';
        go_up_tb <= '0';
        wait for 20 ns;

        go_up_tb <= '1';
        button_tb <= '0';
        wait for 20 ns;


        button_tb <= '1';
        dco_s_tb <= '0';
        wait for 20 ns;


        dco_s_tb <= '1';
        go_down_tb <= '0';
        wait for 20 ns;


        go_down_tb <= '1';
        button_tb <= '0';
        wait for 20 ns;

        wait;
    end process;
    
end testbench;
