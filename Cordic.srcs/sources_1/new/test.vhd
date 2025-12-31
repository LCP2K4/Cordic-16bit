----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 01:36:33 PM
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           o1 : out STD_LOGIC_VECTOR (15 downto 0);
           o2 : out STD_LOGIC_VECTOR (15 downto 0);
           done : out STD_LOGIC);
end test;

architecture Behavioral of test is
    component controller
    port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           rs_ld : out STD_LOGIC;
           z_ld : out STD_LOGIC;
           cnt_ld : out STD_LOGIC;
           lut_ld : out STD_LOGIC;
           done : out STD_LOGIC);
     end component;
     
     component datapath
     port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           z_ld : in STD_LOGIC;
           lut_ld : in STD_LOGIC;
           cnt_ld : in STD_LOGIC;
           o1 : out STD_LOGIC_VECTOR (15 downto 0);
           o2 : out STD_LOGIC_VECTOR (15 downto 0));
     end component;
     
     signal rs_ld,z_ld,cnt_ld,lut_ld : std_logic;
begin
    fsm : controller port map (clk,reset,rs_ld,z_ld,cnt_ld,lut_ld,done);
    dp :  datapath port map (clk,rs_ld,A,z_ld,lut_ld,cnt_ld,o1,o2);

end Behavioral;
