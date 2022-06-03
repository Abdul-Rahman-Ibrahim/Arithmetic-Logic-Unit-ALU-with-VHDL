----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:32:02 04/26/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           Cin : in  STD_LOGIC;--_VECTOR (3 downto 0);
           M : in  STD_LOGIC;
           F : out  STD_LOGIC_VECTOR (3 downto 0);
           Cout : inout  STD_LOGIC_VECTOR (3 downto 0);
			  V : out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

COMPONENT ArithmeticUnit
	Port ( A : in  STD_LOGIC;
				  B : in  STD_LOGIC;
				  Cin : in  STD_LOGIC;
				  S1 : in  STD_LOGIC;
				  S0 : in  STD_LOGIC;
				  F_AU : out  STD_LOGIC;
				  Cout : inout STD_LOGIC);
				  
end COMPONENT;

COMPONENT LogicUnit
	Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S1 : in  STD_LOGIC;
           S0 : in  STD_LOGIC;
           F_LU : out  STD_LOGIC);
			  
end COMPONENT;

COMPONENT Multiplexer_2X1
	Port ( F_LU : in  STD_LOGIC;
           F_AU : in  STD_LOGIC;
			  M : in  STD_LOGIC;
			  F : out STD_LOGIC);

end COMPONENT;

SIGNAL F_LU, F_AU : STD_LOGIC_VECTOR (3 DOWNTO 0);

begin
--DESIGNING THE LOGIC UNIT  
L1 : LogicUnit port map(A(0), B(0), S1, S0, F_LU(0));
L2 : LogicUnit port map(A(1), B(1), S1, S0, F_LU(1));
L3 : LogicUnit port map(A(2), B(2), S1, S0, F_LU(2));
L4 : LogicUnit port map(A(3), B(3), S1, S0, F_LU(3));

--DESIGNING THE ARITHMETIC UNIT
A1 : ArithmeticUnit port map(A(0), B(0), Cin, S1, S0, F_AU(0), Cout(0));
A2 : ArithmeticUnit port map(A(1), B(1), Cout(0), S1, S0, F_AU(1), Cout(1));
A3 : ArithmeticUnit port map(A(2), B(2), Cout(1), S1, S0, F_AU(2), Cout(2));
A4 : ArithmeticUnit port map(A(3), B(3), Cout(2), S1, S0, F_AU(3), Cout(3));
V <= Cout(3) XNOR Cout(2);

--DESIGNING THE MULTIPLEXER
M1 : Multiplexer_2X1 port map(F_LU(0), F_AU(0), M, F(0));
M2 : Multiplexer_2X1 port map(F_LU(1), F_AU(1), M, F(1));
M3 : Multiplexer_2X1 port map(F_LU(2), F_AU(2), M, F(2));
M4 : Multiplexer_2X1 port map(F_LU(3), F_AU(3), M, F(3));

end Behavioral;
