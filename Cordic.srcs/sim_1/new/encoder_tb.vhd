----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 04:10:01 AM
-- Design Name: 
-- Module Name: encoder_tb - Behavioral
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

entity encoder_tb is
end encoder_tb;

architecture Behavioral of encoder_tb is
    component encoder
    port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    signal a_tb,o_tb : std_logic_vector(15 downto 0);
    signal sel_tb : std_logic_vector(3 downto 0);
begin
    uut : encoder port map ( a_tb,sel_tb,o_tb);
    
    process begin
        a_tb <= "1011011000001000";
        sel_tb <= "0000";
        wait for 10ns;
        sel_tb <= "0001";
        
        wait for 10 ns;
        sel_tb <= "0100";
        wait for 10 ns;
        sel_tb <= "1111";
        
        wait for 10 ns;
        sel_tb <= "0011";
        wait;
     end process;


end Behavioral;
