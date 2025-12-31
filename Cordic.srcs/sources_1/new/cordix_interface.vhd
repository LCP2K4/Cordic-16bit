----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2025 05:09:12 PM
-- Design Name: 
-- Module Name: cordix_interface - Behavioral
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

entity cordix_interface is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           start : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR(15 downto 0);
           done : out STD_LOGIC);
end cordix_interface;

architecture Behavioral of cordix_interface is
 component datapath 
 Port    ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           A : in STD_LOGIC_VECTOR (15 downto 0);
           cnt_ld : in STD_LOGIC;
           xyz_sel : in STD_LOGIC;
           xyz_ld : in STD_LOGIC;
           b_sel : in STD_LOGIC;
           xyz_next_ld : in STD_LOGIC;
           lut_ld : in STD_LOGIC;
           o_ld : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0);
           gt_15 : out STD_LOGIC;
           gt0 : out STD_LOGIC);
   end component;
   
   component controller
   Port  ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           gt0 : in STD_LOGIC;
           gt15 : in STD_LOGIC;
           rs_ld : out STD_LOGIC;
           cnt_ld : out STD_LOGIC;
           xyz_sel : out STD_LOGIC;
           xyz_ld : out STD_LOGIC;
           b_sel : out STD_LOGIC;
           xyz_next_ld : out STD_LOGIC;
           lut_ld : out STD_LOGIC;
           o_ld : out STD_LOGIC;
           done : out STD_LOGIC);
    end component;   
    
    signal nreset,cnt_ld,xyz_sel,xyz_ld,b_sel,xyz_next_ld,lut_ld,o_ld : STD_LOGIC;
    signal gt0,gt15 : STD_LOGIC;
begin

dp : datapath port map(clk,nreset,a,cnt_ld,xyz_sel,xyz_ld,b_sel,xyz_next_ld,lut_ld,o_ld,o,z,gt15,gt0);
ctl : controller port map (clk,reset,start,gt0,gt15,nreset,cnt_ld,xyz_sel,xyz_ld,b_sel,xyz_next_ld,lut_ld,o_ld,done);

end Behavioral;
