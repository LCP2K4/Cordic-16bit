----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2025 10:38:47 PM
-- Design Name: 
-- Module Name: encoder - Behavioral
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

entity encoder is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
end encoder;

architecture Behavioral of encoder is
    component mux4_1
    port(    A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           C : in STD_LOGIC_VECTOR (15 downto 0);
           D : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC_VECTOR (15 downto 0));
     end component;
     signal temp0, temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9,temp10,temp11,temp12,temp13,temp14,temp15 : std_logic_vector(15 downto 0) := (others => '0');
     signal temp4_1, temp4_2, temp4_3, temp4_4 : std_logic_vector(15 downto 0) := (others => '0');
begin
     temp0 <= a;
     temp1 <=  a(15) & a(15 downto 1);
     temp2 <= (1 downto 0 => a(15)) & a(15 downto 2);
     temp3 <= (2 downto 0 => a(15)) & a(15 downto 3);
     temp4 <= (3 downto 0 => a(15)) & a(15 downto 4);
     temp5 <=  (4 downto 0 => a(15)) & a(15 downto 5);
     temp6 <= (5 downto 0 => a(15)) & a(15 downto 6);
     temp7 <= (6 downto 0 => a(15)) & a(15 downto 7);
     temp8 <= (7 downto 0 => a(15)) & a(15 downto 8);
     temp9 <= (8 downto 0 => a(15)) & a(15 downto 9);
     temp10 <= (9 downto 0 => a(15)) & a(15 downto 10);
     temp11 <= (10 downto 0 => a(15)) & a(15 downto 11);
     temp12 <= (11 downto 0 => a(15)) & a(15 downto 12);
     temp13 <= (12 downto 0 => a(15)) & a(15 downto 13);
     temp14 <= (13 downto 0 => a(15)) & a(15 downto 14);
     temp15 <= (14 downto 0 => a(15)) & a(15);
     
     sel1 : mux4_1 port map(temp0,temp4,temp8,temp12,sel(3 downto 2),temp4_1);
     sel2 : mux4_1 port map(temp1,temp5,temp9,temp13,sel(3 downto 2),temp4_2);
     sel3 : mux4_1 port map(temp2,temp6,temp10,temp14,sel(3 downto 2),temp4_3);
     sel4 : mux4_1 port map(temp3,temp7,temp11,temp15,sel(3 downto 2),temp4_4);
     sel5 : mux4_1 port map(temp4_1,temp4_2,temp4_3,temp4_4,sel(1 downto 0),o);

end Behavioral;
