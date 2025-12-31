----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2025 05:23:09 PM
-- Design Name: 
-- Module Name: cordix_tb - Behavioral
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
use std.textio.all;
use ieee.std_logic_textio.all;
use IEEE.numeric_std.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cordix_tb is
--  Port ( );
end cordix_tb;

architecture Behavioral of cordix_tb is

component cordix_interface 
port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           clk : in STD_LOGIC;
           reset: in STD_LOGIC;
           start : in STD_LOGIC;
           o : out STD_LOGIC_VECTOR (15 downto 0);
           done : out STD_LOGIC);
end component;
file textfile : text;

signal clk,reset,start,done : STD_LOGIC;
signal a,o : STD_LOGIC_VECTOR (15 downto 0);
begin

uut : cordix_interface port map (a,clk,reset,start,o,done);
clk_prog :  process begin
                clk <= '0';
                wait for 5 ns;
                clk <= '1';
                wait for 5 ns;
            end process clk_prog;

test_prog:  process
    variable line_buf : line;
    variable check : integer := 0;
    variable A_txt     : std_logic_vector(15 downto 0);
    variable start_txt : std_logic;
    variable reset_txt : std_logic;
    variable cordic_txt  : std_logic_vector(15 downto 0);
    variable done_txt  : std_logic;
    variable v_ratio : real;
    variable v_num   : real;
    variable v_den   : real;
begin
 file_open(textfile, "filetest.txt", read_mode);

    while not endfile(textfile) loop
        readline(textfile, line_buf);

        hread(line_buf, A_txt);
        read(line_buf, start_txt);
        read(line_buf, reset_txt);
        hread(line_buf, cordic_txt);
        read(line_buf, done_txt);


        A    <= A_txt;
        start <= start_txt;
        reset <= reset_txt;
        wait for 25 ns;
        start <= '0';
        wait until done = '1';
        wait for 5 ns;
        v_num := real(to_integer(signed(O)));
        v_den := real(to_integer(signed(cordic_txt)));
        if v_den /= 0.0 then
            v_ratio := abs(v_num / v_den);
            assert (v_ratio <= 1.04) and (v_ratio >= 0.94)
            report "Output mismatch! " & real'image(v_num) & " " & real'image(v_den) severity error;
            if not ((v_ratio <= 1.04) and (v_ratio >= 0.94)) then
                        check := check + 1;
            end if;
         end if;
    end loop;

    file_close(textfile);
    report "Simulation finished, total mismatch: " & integer'image(check) severity note;
    wait;
end process test_prog;


end Behavioral;
