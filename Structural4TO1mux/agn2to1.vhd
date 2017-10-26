----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:37:44 10/24/2017 
-- Design Name: 
-- Module Name:    agn2to1 - Behavioral 
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

entity agn2to1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
			  a : in std_logic;
			  b : in std_logic;
           S2 : in  STD_LOGIC;
           S3 : in  STD_LOGIC;
           X1 : out  STD_LOGIC);
end agn2to1;

architecture Behavioral of agn2to1 is
component structmuxuse2to1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           X0 : out  STD_LOGIC);
end component;
signal Y1,Y2 : std_logic;
begin
mux1 : agn2to1 port map (I0,I1,s2,y1);
mux2 : agn2to1 port map (a,b,s2,y2);
mux3 : agn2to1 port map (y1,y2,s3,X1);

end Behavioral;

