----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:50:01 10/24/2017 
-- Design Name: 
-- Module Name:    4isto1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity 4isto1 is
    Port ( p : in  STD_LOGIC;
           q : in  STD_LOGIC;
           r : in  STD_LOGIC;
           s : in  STD_LOGIC;
           s0 : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           o : out  STD_LOGIC);
end 4isto1;

architecture Behavioral of 4isto1 is
component mux is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           s1 : in  STD_LOGIC;
           y : out  STD_LOGIC);
end component;
signal y1,y2 : std_logic;
begin
mux1 : mux port map(p,q,s0,y1);
mux2 : mux port map(r,s,s0,y2);
mux3 : mux port map(y1,y2,s1,o);

end Behavioral;

