----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 01:54:56 PM
-- Design Name: 
-- Module Name: test_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_tb is
--  Port ( );
end test_tb;

architecture Behavioral of test_tb is
    component test
    port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           o1 : out STD_LOGIC_VECTOR (15 downto 0);
           o2 : out STD_LOGIC_VECTOR (15 downto 0);
           done : out STD_LOGIC);
     end component;
     signal A_tb,o1_tb,o2_tb : STD_LOGIC_VECTOR (15 downto 0);
     signal ck,rs_tb,done : STD_LOGIC;
begin
    uut : test port map (a_tb,ck,rs_tb,o1_tb,o2_tb,done);
    
clock_proc : process begin
                ck <= '0';
                wait for 5 ns;
                ck <= '1';
                wait for 5 ns;
             end process clock_proc;

test_proc : process begin
            rs_tb <= '1';
            wait for 30 ns;
            rs_tb <= '0';
            a_tb <= "0100000000000001";
            wait until done = '1';
            a_tb <= "0100111111111111";
            wait until done = '1';
            a_tb <= "0100000100000001";
            wait until done = '1';
            a_tb <= "0110111111111111";
            wait until done = '1';
            wait for 100ns;
            wait;
            end process test_proc;                 

end Behavioral;
