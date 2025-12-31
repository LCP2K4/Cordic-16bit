-- tb_datapath.vhd
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- N?u c?n arithmetic trong TB, b?t NUMERIC_STD:
-- use IEEE.NUMERIC_STD.ALL;

entity tb_datapath is
-- no ports
end tb_datapath;

architecture sim of tb_datapath is
    -- component declaration optional if using direct entity instantiation
    component datapath
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               A : in STD_LOGIC_VECTOR (15 downto 0);
               cnt_ld : in STD_LOGIC;
               xyz_sel : in STD_LOGIC;
               xyz_ld : in STD_LOGIC;
               b_sel : in STD_LOGIC;
               xyz_next_ld : in STD_LOGIC;
               lut_ld : in STD_LOGIC;
               o_ld : in STD_LOGIC;
               o : out STD_LOGIC_VECTOR (15 downto 0);
               gt_15 : out STD_LOGIC;
               gt0 : out STD_LOGIC);
    end component;

    signal clk      : std_logic := '0';
    signal reset    : std_logic := '1';
    signal A_in     : std_logic_vector(15 downto 0) := x"0000";
    signal cnt_ld   : std_logic := '0';
    signal xyz_sel  : std_logic := '0';
    signal xyz_ld   : std_logic := '0';
    signal b_sel    : std_logic := '0';
    signal xyz_next_ld : std_logic := '0';
    signal lut_ld   : std_logic := '0';
    signal o_ld     : std_logic := '0';
    signal o_out    : std_logic_vector(15 downto 0);
    signal gt_15    : std_logic;
    signal gt0      : std_logic;

    constant clk_period : time := 20 ns;
begin
    -- Instantiate Unit Under Test (UUT)
    UUT: entity work.datapath
        port map (
            clk => clk,
            reset => reset,
            A => A_in,
            cnt_ld => cnt_ld,
            xyz_sel => xyz_sel,
            xyz_ld => xyz_ld,
            b_sel => b_sel,
            xyz_next_ld => xyz_next_ld,
            lut_ld => lut_ld,
            o_ld => o_ld,
            o => o_out,
            gt_15 => gt_15,
            gt0 => gt0
        );

    -- Clock generation
    clk_proc: process
    begin
        while now < 2 ms loop
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end loop;
        wait;
    end process;

    -- Stimulus
    stim_proc: process
    begin
        -- initial reset
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for clk_period * 2;

        -- Load counter to start sel (cnt_ld pulses)
        cnt_ld <= '1';
        wait for clk_period;
        cnt_ld <= '0';
        wait for clk_period * 3;

        -- Example: test x and y modules path
        -- set A input used by module_z
        A_in <= x"00FF";    -- arbitrary test vector
        -- enable LUT read (example) - causes blk_mem read using sel as addr
        lut_ld <= '1';
        wait for clk_period;
        lut_ld <= '0';
        wait for clk_period * 2;

        -- Enable xyz modules load (simulate computations)
        xyz_sel <= '1';
        xyz_ld  <= '1';
        wait for clk_period;
        xyz_ld  <= '0';
        wait for clk_period * 4;

        -- Toggle b_sel to test inv_z_sel path
        b_sel <= '1';
        wait for clk_period * 4;
        b_sel <= '0';
        wait for clk_period * 4;

        -- Pulse xyz_next_ld to advance registers if design uses that
        xyz_next_ld <= '1';
        wait for clk_period;
        xyz_next_ld <= '0';
        wait for clk_period * 4;

        -- Request output register to load and observe o_out
        o_ld <= '1';
        wait for clk_period;
        o_ld <= '0';
        wait for clk_period * 4;

        -- Simple checks (asserts) - you can expand based on expected values

        -- End simulation
        wait for 200 ns;
        report "Simulation finished" severity note;
        wait;
    end process;

end sim;
