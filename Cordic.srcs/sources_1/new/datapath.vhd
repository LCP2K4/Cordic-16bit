----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 01:25:14 PM
-- Design Name: 
-- Module Name: datapath - Behavioral
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

entity datapath is
    Port ( clk : in STD_LOGIC;
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
end datapath;

architecture Behavioral of datapath is
    component counter
    port ( clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         load : in STD_LOGIC;
          o : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
   component encoder
   port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           o : out STD_LOGIC_VECTOR (15 downto 0));
   end component;
   
   component mux_2_1
   Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
           B : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component regload
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           load : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
     end component;
    
    component CLA_16bit
    port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
    end component;
   
   component z_module
   Port (  a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           a_sel : in STD_LOGIC;
           a_ld : in STD_LOGIC;
           b_sel : in STD_LOGIC;
           a_next_ld : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    component gt_0
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           o : out STD_LOGIC);
    end component;
    
    
    component blk_mem_gen_0
    port (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
    end component;
    
    component gt15 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           gt15 : out STD_LOGIC);
    end component;
    
    signal sel : STD_LOGIC_VECTOR (3 downto 0);
    signal x_in : STD_LOGIC_VECTOR (15 downto 0) := "0010011010010000";
    signal y_in : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal x_reg,y_reg,x_shift,y_shift : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal lut_in, z_reg : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal inv_z_sel : STD_LOGIC;
    signal o_reg : STD_LOGIC_VECTOR (15 downto 0);
    signal carry : STD_LOGIC;
begin

count : counter port map(clk,reset,cnt_ld,sel);
cmp15 : gt15 port map (sel,clk,reset,gt_15);
x_shift_sl : encoder port map(x_reg,sel,x_shift);
y_shift_sl : encoder port map(y_reg,sel,y_shift);
mem : blk_mem_gen_0 port map(clk,lut_ld,sel,lut_in);
inv_z_sel <= not b_sel;
module_x : z_module port map(x_in,y_shift,clk,reset,xyz_sel,xyz_ld,b_sel,xyz_next_ld,x_reg);
module_y : z_module port map(y_in,x_shift,clk,reset,xyz_sel,xyz_ld,b_sel,xyz_next_ld,y_reg);
module_z : z_module port map(a,lut_in,clk,reset,xyz_sel,xyz_ld,inv_z_sel,xyz_next_ld,z_reg);
total_add : cla_16bit port map(x_reg,y_reg,'0',o_reg, carry);
result : regload port map (o_reg,clk,reset,o_ld,o);
cmp0 : gt_0 port map(z_reg,clk,reset,gt0);



end Behavioral;
