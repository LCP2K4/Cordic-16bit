----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 07:06:55 PM
-- Design Name: 
-- Module Name: cla_4bit - Behavioral
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

entity cla_4bit is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end cla_4bit;

architecture Behavioral of cla_4bit is
    signal G,P,C : STD_LOGIC_VECTOR(3 downto 0);
begin 
    G <= a and b;
    P <= a xor b;
    C(0) <= G(0) or (P(0) and Cin);
    C(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and Cin);
    C(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and Cin);
    C(3) <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and Cin);
    o <= p xor (c(2 downto 0) & Cin);
    cout <= C(3);
end Behavioral;
