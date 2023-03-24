-------------------------------------------------------------------------
-- Ben Welte
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- SipRound.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file implements the SipRound function from SipHash in
--  dataflow VHDL
--
--
-- NOTES:
-- 1/25/22: Design created.
-------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Dataflow SipRound implementation
--	Ports:
--		v0-v3		        - 64-bit inputs for internal state variables
--		v0_out - v3_out     - 64-bit outputs for internal state variables

entity SipRound is
    Port ( v0 : in STD_LOGIC_VECTOR (63 downto 0);
           v1 : in STD_LOGIC_VECTOR (63 downto 0);
           v2 : in STD_LOGIC_VECTOR (63 downto 0);
           v3 : in STD_LOGIC_VECTOR (63 downto 0);
           v0_out : out STD_LOGIC_VECTOR (63 downto 0);
           v1_out : out STD_LOGIC_VECTOR (63 downto 0);
           v2_out : out STD_LOGIC_VECTOR (63 downto 0);
           v3_out : out STD_LOGIC_VECTOR (63 downto 0));
end SipRound;

architecture Dataflow of SipRound is

-- intermediate signals to hold temporary values of v0 - v3
signal v0_s, v1_s, v2_s,v3_s, s1_1, s1_2, s1_3, s0_1, s0_2, s0_3, s2_1, s2_2, s3_1, s3_2, s3_3 : unsigned (63 downto 0) := (others => '0');

begin
        --initialize temporary signals to input values
        v0_s <= unsigned(v0);
        v1_s <= unsigned(v1);
        v2_s <= unsigned(v2);
        v3_s <= unsigned(v3);


        --carry out operations in SipRound's ARX network
        s1_1 <= v1_s(50 downto 0) & v1_s(63 downto 51);
        s1_2 <= s1_1 xor s0_1;
        s1_3 <= s1_2(46 downto 0) & s1_2(63 downto 47);
        
        s0_1 <= v0_s + v1_s;
        s0_2 <= s0_1(31 downto 0) & s0_1(63 downto 32);
        s0_3 <= s0_2 + s3_2;
        
        s2_1 <= v2_s + v3_s;
        s2_2 <= s2_1 + s1_2;
        
        s3_1 <= v3_s(47 downto 0) & v3_s(63 downto 48);
        s3_2 <= s3_1 xor s2_1;
        s3_3 <= s3_2(42 downto 0) & s3_2(63 downto 43);
     
        --set output signals to finalized intermediate values
        v0_out <= std_logic_vector(s0_3);
        v1_out <= std_logic_vector(s1_3 xor s2_2);
        v2_out <= std_logic_vector(s2_2(31 downto 0) & s2_2(63   downto 32));
        v3_out <= std_logic_vector(s0_3 xor s3_3);

end Dataflow;
