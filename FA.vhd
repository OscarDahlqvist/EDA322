library IEEE;
use IEEE.std_logic_1164.all;


entity E_fulladd is
	port (x		: in 	STD_LOGIC;
	      y		: in	STD_LOGIC;
	      cin	: in 	STD_LOGIC;
	      s		: out	STD_LOGIC;
	      cout	: out	STD_LOGIC);
end E_fulladd;

architecture dataflow of E_fulladd is
begin
	s 	<= x XOR y XOR cin;
	cout	<= (x AND y) OR (cin AND (x XOR y));
end dataflow;