-------------------------------------------------------------------------
-- Ben Welte
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- SipHash_tb4.vhd
-------------------------------------------------------------------------
--	Description:
--      Test bench to test the snail-speed DMA inputs
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

entity SipHash_tb4 is
    generic(gCLK_HPER : time := 10 ns);
end SipHash_tb4;

architecture bench of SipHash_tb4 is

constant cCLK_PER : time := gCLK_HPER * 2;

--Signal Declarations
signal mi_s,hash_s : std_logic_vector(63 downto 0);
signal ready_s, done_s, soft_reset_s, sys_reset_s, clk_s, valid_s, freeze_output_s, m_tready_s : std_logic;

--Component Declarations
component SipHash_x_y
Generic (   X : integer := 2;
            Y : integer := 4);
port(           s_tdata : in std_logic_vector(63 downto 0);
                k0 : in std_logic_vector(63 downto 0);
                k1 : in std_logic_vector(63 downto 0);
                s_tvalid : in std_logic;
                s_tlast : in std_logic;
                m_tready : in std_logic;
                soft_reset : in std_logic;
                sys_reset : in std_logic;
                clk : in std_logic;
                
                m_tdata : out std_logic_vector(63 downto 0);
                m_tvalid : out std_logic);
end component;

begin

    --attempting to implement test case from SipHash paper
    m_tready_s <= not(freeze_output_s);

    SipHashTest : SipHash_x_y
    generic map (    X => 1,
                     Y => 3)
    port map(   s_tdata => mi_s,
                k0 => x"0706050403020100",
                k1 => x"0f0e0d0c0b0a0908",
                s_tvalid => ready_s,
                s_tlast => done_s,
                m_tready => m_tready_s,
                soft_reset => soft_reset_s,
                sys_reset => sys_reset_s,
                clk => clk_s,
                
                m_tdata => hash_s,
                m_tvalid => valid_s);
                
    P_CLK : process
    begin
        clk_s <= '1';
        wait for gCLK_HPER;
        clk_s <= '0';
        wait for gCLK_HPER;
    end process;

    P_RUN : process
    begin
    
        mi_s <= x"0000000000000000";
        ready_s <= '1';
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '1';
        wait for cCLK_PER;
        
        --BEGIN TEST CASE
        mi_s <= x"0706050403020100";
        ready_s <= '1'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        --3 dummy cycles (tvalid deasserted)
        mi_s <= x"0706050403020100";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0706050403020100";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0706050403020100";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        --next m:
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '1'; --tvalid
        done_s <= '1';  --tlast
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        --3 dummy cycles
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        --flush pipeline
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '1';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '1';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '1';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
        mi_s <= x"0f0e0d0c0b0a0908";
        ready_s <= '0'; --tvalid
        done_s <= '0';
        freeze_output_s <= '0';
        soft_reset_s <= '0';
        sys_reset_s <= '0';
        wait for cCLK_PER;
        
    
    end process;

end bench;