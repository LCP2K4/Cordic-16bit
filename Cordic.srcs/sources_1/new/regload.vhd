----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 12:37:17 PM
-- Design Name: 
-- Module Name: regload - Behavioral
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

entity regload is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
end regload;

architecture Behavioral of regload is
    signal temp : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
begin
    process(clk,reset) begin
        if reset = '1' then
            temp <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                temp <= a;
            else
                temp <= temp;
            end if;
        end if;
   end process;  
    o <= temp;
end Behavioral;
