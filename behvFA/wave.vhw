--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 8.1i
--  \   \         Application : ISE
--  /   /         Filename : wave.vhw
-- /___/   /\     Timestamp : Thu Oct 26 09:12:24 2017
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: wave
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY wave IS
END wave;

ARCHITECTURE testbench_arch OF wave IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT code
        PORT (
            a : In std_logic;
            b : In std_logic;
            c : In std_logic;
            sum : Out std_logic;
            carry : Out std_logic
        );
    END COMPONENT;

    SIGNAL a : std_logic := '0';
    SIGNAL b : std_logic := '0';
    SIGNAL c : std_logic := '0';
    SIGNAL sum : std_logic := '0';
    SIGNAL carry : std_logic := '0';

    SHARED VARIABLE TX_ERROR : INTEGER := 0;
    SHARED VARIABLE TX_OUT : LINE;

    BEGIN
        UUT : code
        PORT MAP (
            a => a,
            b => b,
            c => c,
            sum => sum,
            carry => carry
        );

        PROCESS
            PROCEDURE CHECK_carry(
                next_carry : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (carry /= next_carry) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns carry="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, carry);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_carry);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            PROCEDURE CHECK_sum(
                next_sum : std_logic;
                TX_TIME : INTEGER
            ) IS
                VARIABLE TX_STR : String(1 to 4096);
                VARIABLE TX_LOC : LINE;
                BEGIN
                IF (sum /= next_sum) THEN
                    STD.TEXTIO.write(TX_LOC, string'("Error at time="));
                    STD.TEXTIO.write(TX_LOC, TX_TIME);
                    STD.TEXTIO.write(TX_LOC, string'("ns sum="));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, sum);
                    STD.TEXTIO.write(TX_LOC, string'(", Expected = "));
                    IEEE.STD_LOGIC_TEXTIO.write(TX_LOC, next_sum);
                    STD.TEXTIO.write(TX_LOC, string'(" "));
                    TX_STR(TX_LOC.all'range) := TX_LOC.all;
                    STD.TEXTIO.writeline(RESULTS, TX_LOC);
                    STD.TEXTIO.Deallocate(TX_LOC);
                    ASSERT (FALSE) REPORT TX_STR SEVERITY ERROR;
                    TX_ERROR := TX_ERROR + 1;
                END IF;
            END;
            BEGIN
                -- -------------  Current Time:  100ns
                WAIT FOR 100 ns;
                a <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  200ns
                WAIT FOR 100 ns;
                b <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  300ns
                WAIT FOR 100 ns;
                c <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1000ns
                WAIT FOR 700 ns;
                a <= '0';

                IF (TX_ERROR = 0) THEN
                    STD.TEXTIO.write(TX_OUT, string'("No errors or warnings"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT
                      "Simulation successful (not a failure).  No problems detected."
                      SEVERITY FAILURE;
                ELSE
                    STD.TEXTIO.write(TX_OUT, TX_ERROR);
                    STD.TEXTIO.write(TX_OUT,
                        string'(" errors found in simulation"));
                    STD.TEXTIO.writeline(RESULTS, TX_OUT);
                    ASSERT (FALSE) REPORT "Errors found during simulation"
                         SEVERITY FAILURE;
                END IF;
            END PROCESS;

    END testbench_arch;

