-------------------------------------------------------------------------
-- Ben Welte
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- D_Flip_Flop.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file implements a D Flip Flop in mixed VHDL
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

entity D_Flip_Flop is
    Port ( i_Clk : in STD_LOGIC;
           i_RST : in STD_LOGIC;
           i_WE : in STD_LOGIC;
           i_D : in STD_LOGIC;
           o_Q : out STD_LOGIC);
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is
  signal s_D    : std_logic;    -- Multiplexed input to the FF
  signal s_Q    : std_logic;    -- Output of the FF

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
      s_Q <= '0'; -- Use "(others => '0')" for N-bit values
    elsif (rising_edge(i_CLK)) then
      s_Q <= s_D;
    end if;

  end process;
end Behavioral;
