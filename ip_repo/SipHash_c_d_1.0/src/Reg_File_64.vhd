-------------------------------------------------------------------------
-- Ben Welte
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- Reg_File_64.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file implements a 64-bit register file in structural
--  VHDL to hold 4 64-bit values for SipHash
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

entity Reg_File_64 is
    Port ( i_Clk : in STD_LOGIC;
           i_RST : in STD_LOGIC;
           i_WE : in STD_LOGIC;
           v0_in : in STD_LOGIC_VECTOR(63 downto 0);
           v1_in : in STD_LOGIC_VECTOR(63 downto 0);
           v2_in : in STD_LOGIC_VECTOR(63 downto 0);
           v3_in : in STD_LOGIC_VECTOR(63 downto 0);
           
           v0_out : out STD_LOGIC_VECTOR(63 downto 0);
           v1_out : out STD_LOGIC_VECTOR(63 downto 0);
           v2_out : out STD_LOGIC_VECTOR(63 downto 0);
           v3_out : out STD_LOGIC_VECTOR(63 downto 0));
end Reg_File_64;

architecture structural of Reg_File_64 is

--component declarations: 64-bit reg
component Reg_64
port(   i_Clk : in STD_LOGIC;
           i_RST : in STD_LOGIC;
           i_WE : in STD_LOGIC;
           i_D : in STD_LOGIC_VECTOR(63 downto 0);
           o_Q : out STD_LOGIC_VECTOR(63 downto 0));
end component;
           
--begin structural architecture      
begin

    v0_holder : Reg_64
    port map(   i_Clk => i_Clk,
                i_RST => i_RST,
                i_WE => i_WE,
                i_D => v0_in,
                o_Q => v0_out);
                
    v1_holder : Reg_64
    port map(   i_Clk => i_Clk,
                i_RST => i_RST,
                i_WE => i_WE,
                i_D => v1_in,
                o_Q => v1_out);
                
    v2_holder : Reg_64
    port map(   i_Clk => i_Clk,
                i_RST => i_RST,
                i_WE => i_WE,
                i_D => v2_in,
                o_Q => v2_out);
                
    v3_holder : Reg_64
    port map(   i_Clk => i_Clk,
                i_RST => i_RST,
                i_WE => i_WE,
                i_D => v3_in,
                o_Q => v3_out);


end structural;


