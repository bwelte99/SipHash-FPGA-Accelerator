-------------------------------------------------------------------------
-- Ben Welte
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- SipHash_x_y.vhd
-------------------------------------------------------------------------
--	Inputs:
--		s_tdata   	- AXIS input (the next 64-bit word in the message)
--		k0  		- 64-bit lower half of the security key
--		k1          - 64-bit upper half of the security key
--      s_tvalid    - AXIS signal indicating the core's current AXIS input word is valid
--      s_tlast     - AXIS signal marking the end of a message (e.g. s_tlast is raised when s_tdata is the final message word)
--      m_tready    - AXIS input from the slave device receiving the hash that it is ready for a new input
--      soft_reset  - reset signal (active high) originating from software (only for the SipHash core)
--		sys_reset   - reset signal (active high) for entire circuit
--      clk         - system clock
--
--  Outputs:
--      m_tdata     - 64-bit hash output (only valid when 'valid' output is raised)
--      m_tvalid    - AXIS signal indicating that m_tdata is a valid hash (should only be active for 1 cycle when m_tready is high)
--
-- NOTES:
-- 4/26/22: Design created.
-- 5/3/22: Last update (BW)
-------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SipHash_x_y is
    Generic (   X : integer := 2;
                Y : integer := 4);
    Port (      s_tdata : in std_logic_vector(63 downto 0);
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
end SipHash_x_y;

architecture Structural of SipHash_x_y is
    --------------------------------------------------
    -- custom type declarations:
    ---------------------------------------------------
    
    -- 4 64-bit vectors:
    type t_4_vectors is array (3 downto 0) of std_logic_vector(63 downto 0);
    
    -- X sets of 4 64-bit vectors
    type t_comp_array is array (X-1 downto 0) of t_4_vectors;
    
    -- Y sets of 4 64-bit vectors
    type t_final_array is array(Y-1 downto 0) of t_4_vectors;
    
    -- Y-1 sets of 4 64-bit vectors
    type t_vpipe_array is array(Y-2 downto 0) of t_4_vectors;
    
    --------------------------------------------------
    -- signal declarations:
    ---------------------------------------------------
    
    -- algorithmic constants after being XOR'ed w/k0 or k1:
    signal cons_key : t_4_vectors;
    
    --inputs & outputs from SipRound Compressions:
    signal comp_input : t_4_vectors;
    signal comp_output : t_comp_array;
    signal comp_v3_xor : std_logic_vector(63 downto 0);
    signal comp_v0_xor : std_logic_vector(63 downto 0);
    
    --register file outputs:
    signal file_out : t_4_vectors;
    signal file_v2_xor : std_logic_vector(63 downto 0);
    
    --inputs to SipRound Finalizations:
    signal finalize_input : t_4_vectors;
    signal finalize_output : t_final_array;
    signal v_pipe : t_vpipe_array;
    
    --combined reset signal (driven high from either hardware or software reset)
    signal total_reset : std_logic;
    
    --signal to track if it's cycle 1 (may need to convert this to a vector and add multiple flip-flops w/gen loop)
    signal ncyc1 : std_logic;
    
    --temporary signal to hold the hash value based on the internal state
    signal temp_hash : std_logic_vector(63 downto 0);
    
    --signal to store the inverted values of done
    signal ndone : std_logic;
    
    -- array of pipeline signals for the done signal
    signal p_done : std_logic_vector(Y downto 0);
    
    --signal to be assigned to m_tvalid output and used elsewhere, signal to determine if valid should be cleared, and we for valid flip flop
    signal valid_s, frozen_valid, valid_we : std_logic;
    
    --------------------------------------------------
    -- component declarations:
    ---------------------------------------------------
    component SipRound
    port(       v0 : in STD_LOGIC_VECTOR (63 downto 0);
                v1 : in STD_LOGIC_VECTOR (63 downto 0);
                v2 : in STD_LOGIC_VECTOR (63 downto 0);
                v3 : in STD_LOGIC_VECTOR (63 downto 0);
                v0_out : out STD_LOGIC_VECTOR (63 downto 0);
                v1_out : out STD_LOGIC_VECTOR (63 downto 0);
                v2_out : out STD_LOGIC_VECTOR (63 downto 0);
                v3_out : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
    
    component D_Flip_FLop
    port(       i_Clk : in STD_LOGIC;
                i_RST : in STD_LOGIC;
                i_WE : in STD_LOGIC;
                i_D : in STD_LOGIC;
                o_Q : out STD_LOGIC);
    end component;
    
    component Reg_64
    port(      i_Clk : in STD_LOGIC;
                i_RST : in STD_LOGIC;
                i_WE : in STD_LOGIC;
                i_D : in STD_LOGIC_VECTOR(63 downto 0);
                o_Q : out STD_LOGIC_VECTOR(63 downto 0));
    end component;
    
    component Reg_File_64
    port(       i_Clk : in STD_LOGIC;
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
    end component;
   
--------------------------------------------------
-- begin architecture:
---------------------------------------------------
begin

    --assign total reset signal
    total_reset <= sys_reset or soft_reset;
    
    --XOR constants with k0 or k1:
    cons_key(0) <= x"736f6d6570736575" xor k0;
    cons_key(1) <= x"646f72616e646f6d" xor k1;
    cons_key(2) <= x"6c7967656e657261" xor k0;
    cons_key(3) <= x"7465646279746573" xor k1;
    
    --invert done signal
    ndone <= not(s_tlast);

    --instantiate DFF to track if it's cycle 1 (may need to be converted to a gen loop)
    Cycle_Tracker : D_Flip_Flop
    port map(   i_CLK => clk,
                i_RST => total_reset,
                i_WE => s_tvalid,
                i_D => ndone,
                o_Q => ncyc1);
                
    --multiplex key inputs and reg file output into compression stage
    MULTIPLEX : for i in 0 to 3 generate
    with ncyc1 select
        comp_input(i) <= file_out(i)   when '1',
        cons_key(i)                    when others;
        
    end generate;
        
    --xor v3 with mi before 1st SipRound:
    comp_v3_xor <= comp_input(3) xor s_tdata;
    
    --perform sipround x times on the internal state:
    SipRound_0 : SipRound
    port map(   v0 => comp_input(0),
                v1 => comp_input(1),
                v2 => comp_input(2),
                v3 => comp_v3_xor,
                
                v0_out => comp_output(0)(0),
                v1_out => comp_output(0)(1),
                v2_out => comp_output(0)(2),
                v3_out => comp_output(0)(3));
    
    Compression : for i in 1 to X-1 generate
    SipRound_x: SipRound
    port map(   v0 => comp_output(i-1)(0),
                v1 => comp_output(i-1)(1),
                v2 => comp_output(i-1)(2),
                v3 => comp_output(i-1)(3),
                
                v0_out => comp_output(i)(0),
                v1_out => comp_output(i)(1),
                v2_out => comp_output(i)(2),
                v3_out => comp_output(i)(3));
    end generate;
    
    --xor v0 with mi
    comp_v0_xor <= comp_output(X-1)(0) xor s_tdata;
    
    --Input compression round results in the reg file
    InternalState : Reg_File_64
    port map(   i_CLK => clk,
                i_RST => total_reset,
                i_WE => s_tvalid,
                v0_in => comp_v0_xor,
                v1_in => comp_output(X-1)(1),
                v2_in => comp_output(X-1)(2),
                v3_in => comp_output(X-1)(3),
                
                v0_out => file_out(0),
                v1_out => file_out(1),
                v2_out => file_out(2),
                v3_out => file_out(3)); 
                
    --BEGIN FINALIZATION
    
    finalize_input(0) <= file_out(0);
    finalize_input(1) <= file_out(1);
    finalize_input(2) <= file_out(2) xor x"00000000000000ff";
    finalize_input(3) <= file_out(3);
    
    Finalization_0 : SipRound
        port map(   v0 => finalize_input(0),
                    v1 => finalize_input(1),
                    v2 => finalize_input(2),
                    v3 => finalize_input(3),
                    
                    v0_out => finalize_output(0)(0),
                    v1_out => finalize_output(0)(1),
                    v2_out => finalize_output(0)(2),
                    v3_out => finalize_output(0)(3));
                    
   Final_Pipe_0 : Reg_File_64
        port map(   i_Clk => clk,
                    i_RST => total_reset,
                    i_WE => '1',
                
                    v0_in => finalize_output(0)(0),
                    v1_in => finalize_output(0)(1),
                    v2_in => finalize_output(0)(2),
                    v3_in => finalize_output(0)(3),
                
                    v0_out => v_pipe(0)(0),
                    v1_out => v_pipe(0)(1),
                    v2_out => v_pipe(0)(2),
                    v3_out => v_pipe(0)(3));
    
    --Generate Y/X finalization pipeline stages:
    FINALIZATION_PIPE : for i in 1 to Y - 2 generate
    
        Finalization_i : SipRound
        port map(   v0 => v_pipe(i-1)(0),
                    v1 => v_pipe(i-1)(1),
                    v2 => v_pipe(i-1)(2),
                    v3 => v_pipe(i-1)(3),
                    
                    v0_out => finalize_output(i)(0),
                    v1_out => finalize_output(i)(1),
                    v2_out => finalize_output(i)(2),
                    v3_out => finalize_output(i)(3));
                    
        Final_Pipe_i : Reg_File_64
        port map(   i_Clk => clk,
                    i_RST => total_reset,
                    i_WE => '1',
                
                    v0_in => finalize_output(i)(0),
                    v1_in => finalize_output(i)(1),
                    v2_in => finalize_output(i)(2),
                    v3_in => finalize_output(i)(3),
                
                    v0_out => v_pipe(i)(0),
                    v1_out => v_pipe(i)(1),
                    v2_out => v_pipe(i)(2),
                    v3_out => v_pipe(i)(3));
    
    end generate;
    
    Finalization_y : SipRound
        port map(   v0 => v_pipe(Y-2)(0),
                    v1 => v_pipe(Y-2)(1),
                    v2 => v_pipe(Y-2)(2),
                    v3 => v_pipe(Y-2)(3),
                    
                    v0_out => finalize_output(Y-1)(0),
                    v1_out => finalize_output(Y-1)(1),
                    v2_out => finalize_output(Y-1)(2),
                    v3_out => finalize_output(Y-1)(3));
    
    --calculate the hash value based on the current internal state:
    temp_hash <= finalize_output(Y-1)(0) xor finalize_output(Y-1)(1) xor finalize_output(Y-1)(2) xor finalize_output(Y-1)(3);
    
    Hash_Holder : Reg_64
    port map(   i_Clk => clk,
                i_RST => total_reset,  
                i_WE => p_done(Y),
                i_D => temp_hash,
                o_Q => m_tdata);
    
    --store 'valid' bit
    Valid_Holder : D_Flip_Flop
    port map(   i_CLK => clk,
                i_RST => total_reset,
                i_WE => valid_we,
                i_D => p_done(Y),
                o_Q => valid_s);
                
    m_tvalid <= valid_s;
    
    valid_we <= not(valid_s and not(m_tready));
    
    tlast_delay_0 : D_Flip_Flop
    port map(   i_CLK => clk,
                i_RST => total_reset,
                i_WE => '1',
                i_D => s_tlast,
                o_Q => p_done(0));
    
    --delay s_tlast by Y clock cycles:
    DONE_PIPE : for i in 1 to Y generate
        tlast_delay_i : D_Flip_Flop
        port map(   i_CLK => clk,
                    i_RST => total_reset,
                    i_WE => '1',
                    i_D => p_done(i - 1),
                    o_Q => p_done(i));
                    
    end generate;

end Structural;
