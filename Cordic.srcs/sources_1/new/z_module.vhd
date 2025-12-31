----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2025 05:14:16 PM
-- Design Name: 
-- Module Name: z_module - Behavioral
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

entity z_module is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           a_sel : in STD_LOGIC;
           a_ld : in STD_LOGIC;
           b_sel : in STD_LOGIC;
           a_next_ld : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
end z_module;

architecture Behavioral of z_module is
    component mux_2_1
    port (A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component cla_16bit
    port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
    end component;
    
    component regload
    port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component gt_0
    port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           o : out STD_LOGIC);
    end component;
    
    signal a_sel_temp,a_next,a_temp,b_sel_temp : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal inv_b : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal add_temp : STD_LOGIC_VECTOR(16 downto 0) := (others => '0'); 
begin

inv_b <= not b;
a_next_sl : mux_2_1 port map(b,inv_b,b_sel,b_sel_temp);
add : cla_16bit port map(a_temp,b_sel_temp,b_sel,add_temp(15 downto 0),add_temp(16));
a_next_reg : regload port map (add_temp(15 downto 0),clk,reset,a_next_ld,a_next);
a_sl : mux_2_1 port map(a,a_next, a_sel,a_sel_temp);
a_reg : regload port map (a_sel_temp,clk,reset,a_ld,a_temp);
o <= a_temp;


end Behavioral;
