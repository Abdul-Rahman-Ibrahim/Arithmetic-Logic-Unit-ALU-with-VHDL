
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S1 : IN  std_logic;
         S0 : IN  std_logic;
         Cin : IN  std_logic;
         M : IN  std_logic;
         F : OUT  std_logic_vector(3 downto 0);
         Cout : INOUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal S1 : std_logic := '0';
   signal S0 : std_logic := '0';
   signal Cin : std_logic := '0';
   signal M : std_logic := '0';

	--BiDirs
   signal Cout : std_logic_vector(3 downto 0);

 	--Outputs
   signal F : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          S1 => S1,
          S0 => S0,
          Cin => Cin,
          M => M,
          F => F,
          Cout => Cout
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		--Transfer A
      wait for clock_period*10;
		A<="0101"; B<="0010"; S1<='0'; S0<='0'; M<='1'; Cin<='0';
		
		--Increment A by 1
		wait for clock_period*10;
		A<="0011"; B<="0010"; S1<='0'; S0<='0'; M<='1'; Cin<='1';
		
		--Sum A and B
		wait for clock_period*10;
		A<="0001"; B<="0010"; S1<='0'; S0<='1'; M<='1'; Cin<='0';
		
		--Increment the sum of A and B by 1
		wait for clock_period*10;
		A<="0001"; B<="0010"; S1<='0'; S0<='1'; M<='1'; Cin<='1';
		
		--A plus 1 complement of B
		wait for clock_period*10;
		A<="0001"; B<="0010"; S1<='1'; S0<='0'; M<='1'; Cin<='0';
		
		--Subtract B from A
		wait for clock_period*10;
		A<="0001"; B<="0010"; S1<='1'; S0<='0'; M<='1'; Cin<='1';
		
		--B plus 1 complement of A
		wait for clock_period*10;
		A<="0001"; B<="0010"; S1<='1'; S0<='1'; M<='1'; Cin<='0';
		
		--Subtract A from B
		wait for clock_period*10;
		A<="0001"; B<="0010"; S1<='1'; S0<='1'; M<='1'; Cin<='1';

      -- insert stimulus here

      wait;
   end process;

END;
