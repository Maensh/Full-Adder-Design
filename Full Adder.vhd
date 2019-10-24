----------------------------------------------------------------------------------
-- Company: 
-- Engineer: MAAN SHARBAJI
-- 
-- Create Date:    05:38:54 10/12/2019 
-- Design Name:    
-- Module Name:    ilkTest - Behavioral 
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

entity ve_KAPASI is
	port(
		ve_g1:in STD_LOGIC;
		ve_g2:in STD_LOGIC;
		ve_CIKIS:out STD_LOGIC
	);
end ve_KAPASI;

architecture Behavioral of ve_KAPASI is
begin
	process(ve_g1,ve_g2)
	begin
		ve_CIKIS <= ve_g1 AND ve_g2;
	end process;
end Behavioral;


-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VEYA_KAPISI is
	port(	veya_g1: in STD_LOGIC;
			veya_g2: in STD_LOGIC;
			veya_cikis: out STD_LOGIC);
end VEYA_KAPISI;

architecture Behavioral of VEYA_KAPISI is
begin
	process(veya_g1, veya_g2)
	begin
		veya_cikis <= veya_g1 or veya_g2;
	end process;
end Behavioral;
-----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR_KAPISI is
	port(	xor_g1: in STD_LOGIC;
			xor_g2: in STD_LOGIC;
			xor_cikis: out STD_LOGIC);
end XOR_KAPISI;

architecture veri_akisi of XOR_KAPISI is
begin
	process(xor_g1, xor_g2)
	begin
		xor_cikis <= xor_g1 xor xor_g2;
	end process;
end veri_akisi;

----------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity YT is
	port(	yt_g1: in STD_LOGIC;
			yt_g2: in STD_LOGIC;
			yt_toplam: out STD_LOGIC;
			yt_eldecikisi: out STD_LOGIC);
end YT;

architecture yapisal of YT is
	component ve_KAPASI is
		port(	ve_g1:in STD_LOGIC;
				ve_g2:in STD_LOGIC;
				ve_cikis:out STD_LOGIC);
	end component;
	component XOR_KAPISI is
		port(	xor_g1: in STD_LOGIC;
				xor_g2: in STD_LOGIC;
				xor_cikis: out STD_LOGIC);
	end component;
begin
	blok1: XOR_KAPISI port map(xor_g1 => yt_g1, xor_g2 => yt_g2, xor_cikis => yt_toplam);
	blok2: ve_KAPASI port map(ve_g1 => yt_g1, ve_g2 => yt_g2, ve_cikis => yt_eldecikisi);
end yapisal;
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TT is
	port(	tt_g1: in STD_LOGIC;
			tt_g2: in STD_LOGIC;
			tt_eldegirisi: in STD_LOGIC;
			tt_toplam: out STD_LOGIC;
			tt_eldecikisi: out STD_LOGIC
	);
end TT;

architecture yapisal of TT is
	component YT is
		port(	yt_g1: in STD_LOGIC;
				yt_g2: in STD_LOGIC;
				yt_toplam: out STD_LOGIC;
				yt_eldecikisi: out STD_LOGIC);
	end component;
	component  VEYA_KAPISI is
		port(	veya_g1: in STD_LOGIC;
				veya_g2: in STD_LOGIC;
				veya_cikis: out STD_LOGIC);
	end component;
	signal arakablo1: STD_LOGIC;
	signal arakablo2: STD_LOGIC;
	signal arakablo3: STD_LOGIC;
begin
	blok1: YT port map(yt_g1 => tt_g1, yt_g2 => tt_g2, yt_eldecikisi => arakablo2, 
	yt_toplam => arakablo1);
	blok2: YT port map(yt_g1 => arakablo1, yt_g2 => tt_eldegirisi, 
	yt_eldecikisi => arakablo3, yt_toplam => tt_toplam);
	blok3: VEYA_KAPISI port map(veya_g1 => arakablo2, veya_g2 => arakablo3, 
	veya_cikis => tt_eldecikisi);
end yapisal;
