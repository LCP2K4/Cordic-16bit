----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 12:10:32 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
  Port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         load : in STD_LOGIC;
          o : out STD_LOGIC_VECTOR (3 downto 0));
end counter;

architecture Behavioral of counter is
    signal temp : unsigned (3 downto 0) := (others => '0');
begin

    process(clk,reset) begin
        if reset = '1' then
            temp <= (others => '0');
        elsif rising_edge(clk) then
            if load = '1' then
                temp <= temp + 1;
            else
                temp <= temp;
            end if;
        end if;
     end process;
     
     o <= std_logic_vector(temp);

end Behavioral;
