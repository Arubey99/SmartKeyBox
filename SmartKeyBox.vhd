library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clk64kHz is
    Port (
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end clk64kHz;
 
architecture Behavioral of clk64kHz is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 780 := 0;
begin
    freq_divider: process (reset, clk) begin
        if (reset = '1') then
            temporal <= '0';
            counter  <= 0;
        elsif rising_edge(clk) then
            if (counter = 780) then
                temporal <= NOT(temporal);
                counter  <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
 
    clk_out <= temporal;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity servo_pwm is
    PORT (
        clk   : IN  STD_LOGIC;
        reset : IN  STD_LOGIC;
        pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
        servo : OUT STD_LOGIC
    );
end servo_pwm;

architecture Behavioral of servo_pwm is

    signal cnt : unsigned(10 downto 0);

    signal pwmi: unsigned(7 downto 0);
begin
    
    pwmi <= unsigned('0' & pos) + 32;
  
    counter: process (reset, clk) begin
        if (reset = '1') then
            cnt <= (others => '0');
        elsif rising_edge(clk) then
            if (cnt = 1279) then
                cnt <= (others => '0');
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    servo <= '1' when (cnt < pwmi) else '0';
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_pwm_clk64kHz is
    PORT(
        clk  : IN  STD_LOGIC;
        reset: IN  STD_LOGIC;
        pos  : IN  STD_LOGIC_VECTOR(6 downto 0);
        servo: OUT STD_LOGIC
    );
end servo_pwm_clk64kHz;

architecture Behavioral of servo_pwm_clk64kHz is
    COMPONENT clk64kHz
        PORT(
            clk    : in  STD_LOGIC;
            reset  : in  STD_LOGIC;
            clk_out: out STD_LOGIC
        );
    END COMPONENT;
    
    COMPONENT servo_pwm
        PORT (
            clk   : IN  STD_LOGIC;
            reset : IN  STD_LOGIC;
            pos   : IN  STD_LOGIC_VECTOR(6 downto 0);
            servo : OUT STD_LOGIC
        );
    END COMPONENT;
    
    signal clk_out : STD_LOGIC := '0';
begin
    clk64kHz_map: clk64kHz PORT MAP(
        clk, reset, clk_out
    );
    
    servo_pwm_map: servo_pwm PORT MAP(
        clk_out, reset, pos, servo
    );
end Behavioral;

