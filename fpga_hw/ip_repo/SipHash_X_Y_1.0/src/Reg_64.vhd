-------------------------------------------------------------------------
-- Ben Welte
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- Reg_64.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file implements a 64-bit register in behavioral VHDL
--
--
-- NOTES:
-- 2/1/22: Design created.
-------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Reg_64 is
    Port ( i_Clk : in STD_LOGIC;
           i_RST : in STD_LOGIC;
           i_WE : in STD_LOGIC;
           i_D : in STD_LOGIC_VECTOR(63 downto 0);
           o_Q : out STD_LOGIC_VECTOR(63 downto 0));
end Reg_64;

architecture Behavioral of Reg_64 is
  signal s_D    : std_logic_vector(63 downto 0);    -- Multiplexed input to the FF
  signal s_Q    : std_logic_vector(63 downto 0);    -- Output of the FF

begin

  -- The output of the FF is fixed to s_Q
  o_Q <= s_Q;
  
  -- Create a multiplexed input to the FF based on i_WE
  with i_WE select
    s_D <= i_D when '1',
           s_Q when others;
  
  -- This process handles the asynchronous reset and
  -- synchronous write. We want to be able to reset 
  -- our processor's registers so that we minimize
  -- glitchy behavior on startup.
  process (i_CLK, i_RST)
  begin
    if (i_RST = '1') then
      s_Q <= (others => '0');
    elsif (rising_edge(i_CLK)) then
      s_Q <= s_D;
    end if;

  end process;
end Behavioral;
