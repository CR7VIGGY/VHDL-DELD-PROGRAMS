----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:01 10/24/2017 
-- Design Name: 
-- Module Name:    structmuxuse2to1 - Behavioral 
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

entity structmuxuse2to1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           X0 : out  STD_LOGIC);
end structmuxuse2to1;

architecture Behavioral of structmuxuse2to1 is

begin

X0 <= (NOT S0 AND I0)OR(S0 AND I1);

end Behavioral;

