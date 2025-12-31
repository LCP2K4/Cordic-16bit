----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2025 02:09:59 PM
-- Design Name: 
-- Module Name: shift_count - Behavioral
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

entity shift_count is
  Port (w0,w1: in std_logic;
        en: in std_logic;
        cout: out std_logic 
   );
end shift_count;

architecture Behavioral of shift_count is
begin
    process(w0,w1,en) begin
        cout <= w0;
        if en = '1' then cout <= w1;
        end if;
    end process;

end Behavioral;
