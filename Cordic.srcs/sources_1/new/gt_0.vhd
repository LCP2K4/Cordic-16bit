----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 03:01:42 PM
-- Design Name: 
-- Module Name: gt_0 - Behavioral
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

entity gt_0 is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           o : out STD_LOGIC);
end gt_0;

architecture Behavioral of gt_0 is
    signal temp : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
begin
    process(clk,reset) begin
        if reset = '1' then o <= '0';
        elsif rising_edge(clk) then
            o <= not a(15);
         end if;
     end process;

end Behavioral;
