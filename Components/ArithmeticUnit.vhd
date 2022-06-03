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

entity ArithmeticUnit is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           F_AU : out  STD_LOGIC;
           Cout : inout  STD_LOGIC);
			  
end ArithmeticUnit;

architecture Behavioral of ArithmeticUnit is
COMPONENT FullAdder
	Port ( A : in  STD_LOGIC;
          B : in  STD_LOGIC;
          Cin : in  STD_LOGIC;
          S : out  STD_LOGIC;
          Cout : out  STD_LOGIC);

end COMPONENT;

SIGNAL AS, BS : STD_LOGIC;
begin

AS <= ((S1 AND S0) XOR A);
BS <= (((S1 OR S0) AND B) XOR (S1 AND (NOT S0)));

F : FullAdder port map(AS, BS, Cin, F_AU, Cout);

end Behavioral;
