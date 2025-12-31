----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2025 06:44:33 PM
-- Design Name: 
-- Module Name: z_tb - Behavioral
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

entity z_tb is
--  Port ( );
end z_tb;

architecture Behavioral of z_tb is
component z_module
Port      ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           a_sel : in STD_LOGIC;
           a_ld : in STD_LOGIC;
           b_sel : in STD_LOGIC;
           a_next_ld : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
 end component;
 
 signal clk,reset,a_sel,a_ld,b_sel,a_next_ld : STD_LOGIC;
 signal a,b,o : STD_LOGIC_VECTOR (15 downto 0);
begin
clock_proc : process begin
                clk <= '0';
                wait for 5 ns;
                clk <= '1';
                wait for 5 ns;
             end process clock_proc;
test_proc : process begin
                reset <= '1';
                wait for 30 ns;
                reset <= '0';
                a <= 

end Behavioral;
