----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2025 11:19:26 AM
-- Design Name: 
-- Module Name: CLA_32bit - Behavioral
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

entity CLA_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end CLA_16bit;

architecture Behavioral of CLA_16bit is
    component cla_4bit
    port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
    end component;
    signal temp : STD_LOGIC_VECTOR (4 downto 0);
begin
    temp(0) <= cin;
    cla_gen : for i in 0 to 3 generate
        cla : cla_4bit port map (a((4*(1 + i) - 1) downto (4 * i)),
        b((4*(1 + i) - 1) downto (4 * i)),temp(i),
        o((4*(1 + i) - 1) downto (4 * i)),temp(i+1));
     end generate cla_gen;
    cout <= temp(4);
end Behavioral;
