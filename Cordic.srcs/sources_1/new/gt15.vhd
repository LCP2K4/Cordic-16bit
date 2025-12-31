----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2025 09:25:33 AM
-- Design Name: 
-- Module Name: gt15 - Behavioral
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

entity gt15 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           gt15 : out STD_LOGIC);
end gt15;

architecture Behavioral of gt15 is
    signal temp : STD_LOGIC;
begin
    process(clk,reset) begin
        if reset = '1' then
            gt15 <= '0';
        elsif clk'event and clk = '1' then
            if a = "1111" then
                gt15 <= '1';
            else
                gt15 <= '0';
            end if;    
        end if;
    end process;

end Behavioral;
