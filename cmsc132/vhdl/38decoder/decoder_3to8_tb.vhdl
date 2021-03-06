LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder_3to8_tb IS
END decoder_3to8_tb;

ARCHITECTURE behavior OF decoder_3to8_tb IS

   COMPONENT decoder_3to8 IS
   PORT (
      I2, I1, I0: IN STD_LOGIC;
      Out7, Out6, Out5, Out4, Out3, Out2, Out1, Out0: OUT STD_LOGIC
   );
   END COMPONENT;

   SIGNAL INPUT_TB: STD_LOGIC_VECTOR(2 downto 0);
   SIGNAL OUTPUT_TB: STD_LOGIC_VECTOR(7 downto 0);

begin 
   uut: decoder_3to8 port map (
      I2 => INPUT_TB(2),
      I1 => INPUT_TB(1),
      I0 => INPUT_TB(0),
      Out7 => OUTPUT_TB(7),
      Out6 => OUTPUT_TB(6),
      Out5 => OUTPUT_TB(5),
      Out4 => OUTPUT_TB(4),
      Out3 => OUTPUT_TB(3),
      Out2 => OUTPUT_TB(2),
      Out1 => OUTPUT_TB(1),
      Out0 => OUTPUT_TB(0)
   );

   stim_proc: process
   begin

      wait for 50 ns;


      INPUT_TB <= "000"; wait for 10 ns; assert OUTPUT_TB="00000001" report "000 failed,output= ";
      INPUT_TB <= "001"; wait for 10 ns; assert OUTPUT_TB="00000010" report "001 failed,output= ";
      INPUT_TB <= "010"; wait for 10 ns; assert OUTPUT_TB="00000100" report "010 failed,output= "; 
      INPUT_TB <= "011"; wait for 10 ns; assert OUTPUT_TB="00001000" report "011 failed,output= ";
      INPUT_TB <= "100"; wait for 10 ns; assert OUTPUT_TB="00010000" report "100 failed,output= ";
      INPUT_TB <= "101"; wait for 10 ns; assert OUTPUT_TB="00100000" report "101 failed,output= "; 
      INPUT_TB <= "110"; wait for 10 ns; assert OUTPUT_TB="01000000" report "110 failed,output= ";
      INPUT_TB <= "111"; wait for 10 ns; assert OUTPUT_TB="10000000" report "111 failed,output= ";
      wait;
   end process;
end;      
   

