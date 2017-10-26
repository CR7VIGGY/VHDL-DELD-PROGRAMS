----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:05:19 10/26/2017 
-- Design Name: 
-- Module Name:    code - Behavioral 
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

entity code is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           carry : out  STD_LOGIC);
end code;

architecture Behavioral of code is

begin
process(a,b,c)
begin

if(a='1' and b ='1' and c='1')then sum <= '1'; carry <= '1';
elsif(a='1' and b='1' and c = '0') then sum <= '0'; carry <= '1';
elsif(a='1' and b='0' and c = '1') then sum <= '0'; carry <= '1';
elsif(a='1' and b='0' and c = '0') then sum <= '1'; carry <= '0';
elsif(a='0' and b='1' and c = '1') then sum <= '0'; carry <= '1';
elsif(a='0' and b='1' and c = '0') then sum <= '1'; carry <= '0';
elsif(a='0' and b='0' and c = '1') then sum <= '1'; carry <= '0';
else 
sum <= '0';carry <= '0';
end if;
end process;
end Behavioral;

