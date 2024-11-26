-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
-- Date        : Mon Nov 25 22:08:14 2024
-- Host        : fedora running 64-bit Fedora Linux 41 (Workstation Edition)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               /home/umberto/Documents/elettronica_digitale/mini_alu/mini_alu.sim/sim_1/impl/func/xsim/mini_alu_testbench_func_impl.vhd
-- Design      : mini_alu
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity mini_alu is
  port (
    A : in STD_LOGIC_VECTOR ( 3 downto 0 );
    B : in STD_LOGIC_VECTOR ( 3 downto 0 );
    C : in STD_LOGIC;
    output : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of mini_alu : entity is true;
  attribute ECO_CHECKSUM : string;
  attribute ECO_CHECKSUM of mini_alu : entity is "52e4fa50";
  attribute n : integer;
  attribute n of mini_alu : entity is 4;
end mini_alu;

architecture STRUCTURE of mini_alu is
  signal A_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal B_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal B_adder : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal C_IBUF : STD_LOGIC;
  signal \generic_adder_alu/carry_2__2\ : STD_LOGIC;
  signal \generic_adder_alu/p_4\ : STD_LOGIC;
  signal output_OBUF : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \output[1]_INST_0_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output[4]_INST_0_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[4]_INST_0_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[4]_INST_0_i_4\ : label is "soft_lutpair0";
begin
\A_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(0),
      O => A_IBUF(0)
    );
\A_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(1),
      O => A_IBUF(1)
    );
\A_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(2),
      O => A_IBUF(2)
    );
\A_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => A(3),
      O => A_IBUF(3)
    );
\B_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(0),
      O => B_IBUF(0)
    );
\B_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(1),
      O => B_IBUF(1)
    );
\B_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(2),
      O => B_IBUF(2)
    );
\B_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => B(3),
      O => B_IBUF(3)
    );
C_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => C,
      O => C_IBUF
    );
\output[0]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(0),
      O => output(0)
    );
\output[0]_INST_0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => A_IBUF(0),
      O => output_OBUF(0)
    );
\output[1]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(1),
      O => output(1)
    );
\output[1]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"66969666"
    )
        port map (
      I0 => A_IBUF(1),
      I1 => B_IBUF(1),
      I2 => B_IBUF(0),
      I3 => C_IBUF,
      I4 => A_IBUF(0),
      O => output_OBUF(1)
    );
\output[2]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(2),
      O => output(2)
    );
\output[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"56A9AA55A95655AA"
    )
        port map (
      I0 => A_IBUF(2),
      I1 => B_IBUF(0),
      I2 => B_IBUF(1),
      I3 => B_IBUF(2),
      I4 => C_IBUF,
      I5 => \generic_adder_alu/carry_2__2\,
      O => output_OBUF(2)
    );
\output[3]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(3),
      O => output(3)
    );
\output[3]_INST_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"566A"
    )
        port map (
      I0 => \generic_adder_alu/p_4\,
      I1 => A_IBUF(2),
      I2 => B_adder(2),
      I3 => \generic_adder_alu/carry_2__2\,
      O => output_OBUF(3)
    );
\output[3]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999999936666666C"
    )
        port map (
      I0 => C_IBUF,
      I1 => B_IBUF(3),
      I2 => B_IBUF(0),
      I3 => B_IBUF(1),
      I4 => B_IBUF(2),
      I5 => A_IBUF(3),
      O => \generic_adder_alu/p_4\
    );
\output[4]_INST_0\: unisim.vcomponents.OBUF
     port map (
      I => output_OBUF(4),
      O => output(4)
    );
\output[4]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"888E8EEE"
    )
        port map (
      I0 => A_IBUF(3),
      I1 => B_adder(3),
      I2 => A_IBUF(2),
      I3 => B_adder(2),
      I4 => \generic_adder_alu/carry_2__2\,
      O => output_OBUF(4)
    );
\output[4]_INST_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"01FEFF00"
    )
        port map (
      I0 => B_IBUF(2),
      I1 => B_IBUF(1),
      I2 => B_IBUF(0),
      I3 => B_IBUF(3),
      I4 => C_IBUF,
      O => B_adder(3)
    );
\output[4]_INST_0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EF0"
    )
        port map (
      I0 => B_IBUF(0),
      I1 => B_IBUF(1),
      I2 => B_IBUF(2),
      I3 => C_IBUF,
      O => B_adder(2)
    );
\output[4]_INST_0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFE02080"
    )
        port map (
      I0 => A_IBUF(0),
      I1 => C_IBUF,
      I2 => B_IBUF(0),
      I3 => B_IBUF(1),
      I4 => A_IBUF(1),
      O => \generic_adder_alu/carry_2__2\
    );
end STRUCTURE;
