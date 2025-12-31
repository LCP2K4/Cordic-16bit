----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2025 01:11:12 PM
-- Design Name: 
-- Module Name: controller - Behavioral
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

entity controller is
    Port ( clk : in STD_LOGIC;
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
end controller;

    architecture Behavioral of controller is
    type state_type is (S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10);
    signal state, next_state : state_type;
begin

    process(clk,reset) begin
        if reset = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= next_state;  
        end if;
    end process;
    
     process(state,start,gt0,gt15) begin
        case state is 
            when S0 =>
                rs_ld <= '1';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '0';
                o_ld <= '0';
                done <= '0';
                next_state <= S1;
            when S1 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '0';
                o_ld <= '0';
                done <= '0';
                if start = '1' then
                    next_state <= S2;
                else
                    next_state <= S1;
                end if;
           when S2 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '1';
                b_sel <= '0';
                xyz_next_ld <= '0';                
                lut_ld <= '1';
                o_ld <= '0';
                done <= '0';
                next_state <= S3;
           when S3 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '1';
                o_ld <= '0';
                done <= '0';
                if gt15 = '1' then
                    next_state <= S9;
                else
                    next_state <= S4;
                end if;
           when S4 =>
                rs_ld <= '0';
                cnt_ld <= '1';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '0';
                done <= '0';
                o_ld <= '0';
                next_state <= S5; 
           when S5 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '0';
                o_ld <= '0';
                done <= '0';
                if gt0 = '1' then
                    next_state <= S6;
                else 
                    next_state <= S7;
                end if;
                
            when S6 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '1';
                o_ld <= '0';
                lut_ld <= '0';
                done <= '0';
                next_state <= S8;
            when S7 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '1';
                xyz_next_ld <= '1';
                lut_ld <= '0';
                o_ld <= '0';
                done <= '0';
                next_state <= S8;
            when S8 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '1';
                xyz_ld <= '1';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '1';
                o_ld <= '0';
                done <= '0';
                next_state <= S3;
             when S9 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '0';
                o_ld <= '1';
                done <= '0';
                next_state <= S10;
              when S10 =>
                rs_ld <= '0';
                cnt_ld <= '0';
                xyz_sel <= '0';
                xyz_ld <= '0';
                b_sel <= '0';
                xyz_next_ld <= '0';
                lut_ld <= '0';
                o_ld <= '0';
                done <= '1';
                next_state <= S0;
           end case;
   end process;
                                 


end Behavioral;
