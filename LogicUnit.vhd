----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:30:29 04/26/2022 
-- Design Name: 
-- Module Name:    LogicUnit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LogicUnit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           F_LU : out  STD_LOGIC);
end LogicUnit;

architecture Behavioral of LogicUnit is

begin
F_LU <=  (((((NOT S1) AND (NOT S0)) AND (A AND B)) OR
			 ((NOT S1) AND S0 AND (A OR B))) OR
			 (S1 AND (NOT S0) AND (A XOR B))) OR
			 (S1 AND S0 AND (A XNOR B));

end Behavioral;
