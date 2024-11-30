// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
// Date        : Sat Nov 30 19:41:27 2024
// Host        : Host-003 running 64-bit unknown
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/thecoder/projects/elettronica_digitale/mini_alu/mini_alu.sim/sim_1/impl/timing/xsim/mini_alu_testbench_time_impl.v
// Design      : mini_alu
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "55b395a0" *) (* bit_number = "16" *) 
(* NotValidForBitStream *)
module mini_alu
   (A,
    B,
    C,
    \output );
  input [15:0]A;
  input [15:0]B;
  input C;
  output [16:0]\output ;

  wire [15:0]A;
  wire [15:0]A_IBUF;
  wire [15:0]B;
  wire [15:0]B_IBUF;
  wire C;
  wire C_IBUF;
  wire [16:0]\output ;
  wire \output[11]_INST_0_i_2_n_0 ;
  wire \output[12]_INST_0_i_10_n_0 ;
  wire \output[12]_INST_0_i_11_n_0 ;
  wire \output[12]_INST_0_i_2_n_0 ;
  wire \output[12]_INST_0_i_3_n_0 ;
  wire \output[12]_INST_0_i_4_n_0 ;
  wire \output[12]_INST_0_i_5_n_0 ;
  wire \output[12]_INST_0_i_6_n_0 ;
  wire \output[12]_INST_0_i_7_n_0 ;
  wire \output[12]_INST_0_i_8_n_0 ;
  wire \output[12]_INST_0_i_9_n_0 ;
  wire \output[14]_INST_0_i_2_n_0 ;
  wire \output[16]_INST_0_i_10_n_0 ;
  wire \output[16]_INST_0_i_2_n_0 ;
  wire \output[16]_INST_0_i_3_n_0 ;
  wire \output[16]_INST_0_i_4_n_0 ;
  wire \output[16]_INST_0_i_5_n_0 ;
  wire \output[16]_INST_0_i_6_n_0 ;
  wire \output[16]_INST_0_i_7_n_0 ;
  wire \output[16]_INST_0_i_8_n_0 ;
  wire \output[16]_INST_0_i_9_n_0 ;
  wire \output[3]_INST_0_i_2_n_0 ;
  wire \output[5]_INST_0_i_2_n_0 ;
  wire \output[7]_INST_0_i_2_n_0 ;
  wire \output[9]_INST_0_i_2_n_0 ;
  wire [16:0]output_OBUF;

initial begin
 $sdf_annotate("mini_alu_testbench_time_impl.sdf",,,,"tool_control");
end
  IBUF \A_IBUF[0]_inst 
       (.I(A[0]),
        .O(A_IBUF[0]));
  IBUF \A_IBUF[10]_inst 
       (.I(A[10]),
        .O(A_IBUF[10]));
  IBUF \A_IBUF[11]_inst 
       (.I(A[11]),
        .O(A_IBUF[11]));
  IBUF \A_IBUF[12]_inst 
       (.I(A[12]),
        .O(A_IBUF[12]));
  IBUF \A_IBUF[13]_inst 
       (.I(A[13]),
        .O(A_IBUF[13]));
  IBUF \A_IBUF[14]_inst 
       (.I(A[14]),
        .O(A_IBUF[14]));
  IBUF \A_IBUF[15]_inst 
       (.I(A[15]),
        .O(A_IBUF[15]));
  IBUF \A_IBUF[1]_inst 
       (.I(A[1]),
        .O(A_IBUF[1]));
  IBUF \A_IBUF[2]_inst 
       (.I(A[2]),
        .O(A_IBUF[2]));
  IBUF \A_IBUF[3]_inst 
       (.I(A[3]),
        .O(A_IBUF[3]));
  IBUF \A_IBUF[4]_inst 
       (.I(A[4]),
        .O(A_IBUF[4]));
  IBUF \A_IBUF[5]_inst 
       (.I(A[5]),
        .O(A_IBUF[5]));
  IBUF \A_IBUF[6]_inst 
       (.I(A[6]),
        .O(A_IBUF[6]));
  IBUF \A_IBUF[7]_inst 
       (.I(A[7]),
        .O(A_IBUF[7]));
  IBUF \A_IBUF[8]_inst 
       (.I(A[8]),
        .O(A_IBUF[8]));
  IBUF \A_IBUF[9]_inst 
       (.I(A[9]),
        .O(A_IBUF[9]));
  IBUF \B_IBUF[0]_inst 
       (.I(B[0]),
        .O(B_IBUF[0]));
  IBUF \B_IBUF[10]_inst 
       (.I(B[10]),
        .O(B_IBUF[10]));
  IBUF \B_IBUF[11]_inst 
       (.I(B[11]),
        .O(B_IBUF[11]));
  IBUF \B_IBUF[12]_inst 
       (.I(B[12]),
        .O(B_IBUF[12]));
  IBUF \B_IBUF[13]_inst 
       (.I(B[13]),
        .O(B_IBUF[13]));
  IBUF \B_IBUF[14]_inst 
       (.I(B[14]),
        .O(B_IBUF[14]));
  IBUF \B_IBUF[15]_inst 
       (.I(B[15]),
        .O(B_IBUF[15]));
  IBUF \B_IBUF[1]_inst 
       (.I(B[1]),
        .O(B_IBUF[1]));
  IBUF \B_IBUF[2]_inst 
       (.I(B[2]),
        .O(B_IBUF[2]));
  IBUF \B_IBUF[3]_inst 
       (.I(B[3]),
        .O(B_IBUF[3]));
  IBUF \B_IBUF[4]_inst 
       (.I(B[4]),
        .O(B_IBUF[4]));
  IBUF \B_IBUF[5]_inst 
       (.I(B[5]),
        .O(B_IBUF[5]));
  IBUF \B_IBUF[6]_inst 
       (.I(B[6]),
        .O(B_IBUF[6]));
  IBUF \B_IBUF[7]_inst 
       (.I(B[7]),
        .O(B_IBUF[7]));
  IBUF \B_IBUF[8]_inst 
       (.I(B[8]),
        .O(B_IBUF[8]));
  IBUF \B_IBUF[9]_inst 
       (.I(B[9]),
        .O(B_IBUF[9]));
  IBUF C_IBUF_inst
       (.I(C),
        .O(C_IBUF));
  OBUF \output[0]_INST_0 
       (.I(output_OBUF[0]),
        .O(\output [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \output[0]_INST_0_i_1 
       (.I0(B_IBUF[0]),
        .I1(A_IBUF[0]),
        .O(output_OBUF[0]));
  OBUF \output[10]_INST_0 
       (.I(output_OBUF[10]),
        .O(\output [10]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \output[10]_INST_0_i_1 
       (.I0(\output[11]_INST_0_i_2_n_0 ),
        .I1(C_IBUF),
        .I2(B_IBUF[10]),
        .I3(A_IBUF[10]),
        .O(output_OBUF[10]));
  OBUF \output[11]_INST_0 
       (.I(output_OBUF[11]),
        .O(\output [11]));
  LUT6 #(
    .INIT(64'h4DE8B217B2174DE8)) 
    \output[11]_INST_0_i_1 
       (.I0(\output[11]_INST_0_i_2_n_0 ),
        .I1(B_IBUF[10]),
        .I2(A_IBUF[10]),
        .I3(C_IBUF),
        .I4(B_IBUF[11]),
        .I5(A_IBUF[11]),
        .O(output_OBUF[11]));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[11]_INST_0_i_2 
       (.I0(A_IBUF[9]),
        .I1(B_IBUF[9]),
        .I2(C_IBUF),
        .I3(A_IBUF[8]),
        .I4(B_IBUF[8]),
        .I5(\output[9]_INST_0_i_2_n_0 ),
        .O(\output[11]_INST_0_i_2_n_0 ));
  OBUF \output[12]_INST_0 
       (.I(output_OBUF[12]),
        .O(\output [12]));
  LUT6 #(
    .INIT(64'h4DE8B217B2174DE8)) 
    \output[12]_INST_0_i_1 
       (.I0(\output[12]_INST_0_i_2_n_0 ),
        .I1(B_IBUF[11]),
        .I2(A_IBUF[11]),
        .I3(C_IBUF),
        .I4(B_IBUF[12]),
        .I5(A_IBUF[12]),
        .O(output_OBUF[12]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[12]_INST_0_i_10 
       (.I0(C_IBUF),
        .I1(B_IBUF[3]),
        .O(\output[12]_INST_0_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \output[12]_INST_0_i_11 
       (.I0(A_IBUF[4]),
        .I1(B_IBUF[4]),
        .I2(C_IBUF),
        .O(\output[12]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[12]_INST_0_i_2 
       (.I0(A_IBUF[10]),
        .I1(B_IBUF[10]),
        .I2(C_IBUF),
        .I3(A_IBUF[9]),
        .I4(B_IBUF[9]),
        .I5(\output[12]_INST_0_i_3_n_0 ),
        .O(\output[12]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[12]_INST_0_i_3 
       (.I0(A_IBUF[8]),
        .I1(B_IBUF[8]),
        .I2(C_IBUF),
        .I3(A_IBUF[7]),
        .I4(B_IBUF[7]),
        .I5(\output[12]_INST_0_i_4_n_0 ),
        .O(\output[12]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hE888EEE8EEE8EEE8)) 
    \output[12]_INST_0_i_4 
       (.I0(A_IBUF[6]),
        .I1(\output[12]_INST_0_i_5_n_0 ),
        .I2(A_IBUF[5]),
        .I3(\output[12]_INST_0_i_6_n_0 ),
        .I4(\output[12]_INST_0_i_7_n_0 ),
        .I5(\output[12]_INST_0_i_8_n_0 ),
        .O(\output[12]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[12]_INST_0_i_5 
       (.I0(C_IBUF),
        .I1(B_IBUF[6]),
        .O(\output[12]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[12]_INST_0_i_6 
       (.I0(C_IBUF),
        .I1(B_IBUF[5]),
        .O(\output[12]_INST_0_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \output[12]_INST_0_i_7 
       (.I0(A_IBUF[4]),
        .I1(B_IBUF[4]),
        .I2(C_IBUF),
        .O(\output[12]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h001717FFFFFFFFFF)) 
    \output[12]_INST_0_i_8 
       (.I0(\output[3]_INST_0_i_2_n_0 ),
        .I1(\output[12]_INST_0_i_9_n_0 ),
        .I2(A_IBUF[2]),
        .I3(\output[12]_INST_0_i_10_n_0 ),
        .I4(A_IBUF[3]),
        .I5(\output[12]_INST_0_i_11_n_0 ),
        .O(\output[12]_INST_0_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[12]_INST_0_i_9 
       (.I0(C_IBUF),
        .I1(B_IBUF[2]),
        .O(\output[12]_INST_0_i_9_n_0 ));
  OBUF \output[13]_INST_0 
       (.I(output_OBUF[13]),
        .O(\output [13]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \output[13]_INST_0_i_1 
       (.I0(\output[14]_INST_0_i_2_n_0 ),
        .I1(C_IBUF),
        .I2(B_IBUF[13]),
        .I3(A_IBUF[13]),
        .O(output_OBUF[13]));
  OBUF \output[14]_INST_0 
       (.I(output_OBUF[14]),
        .O(\output [14]));
  LUT6 #(
    .INIT(64'h4DE8B217B2174DE8)) 
    \output[14]_INST_0_i_1 
       (.I0(\output[14]_INST_0_i_2_n_0 ),
        .I1(B_IBUF[13]),
        .I2(A_IBUF[13]),
        .I3(C_IBUF),
        .I4(B_IBUF[14]),
        .I5(A_IBUF[14]),
        .O(output_OBUF[14]));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[14]_INST_0_i_2 
       (.I0(A_IBUF[12]),
        .I1(B_IBUF[12]),
        .I2(C_IBUF),
        .I3(A_IBUF[11]),
        .I4(B_IBUF[11]),
        .I5(\output[12]_INST_0_i_2_n_0 ),
        .O(\output[14]_INST_0_i_2_n_0 ));
  OBUF \output[15]_INST_0 
       (.I(output_OBUF[15]),
        .O(\output [15]));
  LUT6 #(
    .INIT(64'h6999669699966966)) 
    \output[15]_INST_0_i_1 
       (.I0(B_IBUF[15]),
        .I1(A_IBUF[15]),
        .I2(\output[16]_INST_0_i_2_n_0 ),
        .I3(C_IBUF),
        .I4(B_IBUF[14]),
        .I5(A_IBUF[14]),
        .O(output_OBUF[15]));
  OBUF \output[16]_INST_0 
       (.I(output_OBUF[16]),
        .O(\output [16]));
  LUT6 #(
    .INIT(64'h4DFFFF1700174D00)) 
    \output[16]_INST_0_i_1 
       (.I0(A_IBUF[14]),
        .I1(B_IBUF[14]),
        .I2(\output[16]_INST_0_i_2_n_0 ),
        .I3(C_IBUF),
        .I4(B_IBUF[15]),
        .I5(A_IBUF[15]),
        .O(output_OBUF[16]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h96)) 
    \output[16]_INST_0_i_10 
       (.I0(A_IBUF[9]),
        .I1(B_IBUF[9]),
        .I2(C_IBUF),
        .O(\output[16]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[16]_INST_0_i_2 
       (.I0(A_IBUF[13]),
        .I1(B_IBUF[13]),
        .I2(C_IBUF),
        .I3(A_IBUF[12]),
        .I4(B_IBUF[12]),
        .I5(\output[16]_INST_0_i_3_n_0 ),
        .O(\output[16]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hE888EEE8EEE8EEE8)) 
    \output[16]_INST_0_i_3 
       (.I0(A_IBUF[11]),
        .I1(\output[16]_INST_0_i_4_n_0 ),
        .I2(A_IBUF[10]),
        .I3(\output[16]_INST_0_i_5_n_0 ),
        .I4(\output[16]_INST_0_i_6_n_0 ),
        .I5(\output[16]_INST_0_i_7_n_0 ),
        .O(\output[16]_INST_0_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[16]_INST_0_i_4 
       (.I0(C_IBUF),
        .I1(B_IBUF[11]),
        .O(\output[16]_INST_0_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[16]_INST_0_i_5 
       (.I0(C_IBUF),
        .I1(B_IBUF[10]),
        .O(\output[16]_INST_0_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \output[16]_INST_0_i_6 
       (.I0(A_IBUF[9]),
        .I1(B_IBUF[9]),
        .I2(C_IBUF),
        .O(\output[16]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h001717FFFFFFFFFF)) 
    \output[16]_INST_0_i_7 
       (.I0(\output[12]_INST_0_i_4_n_0 ),
        .I1(\output[16]_INST_0_i_8_n_0 ),
        .I2(A_IBUF[7]),
        .I3(\output[16]_INST_0_i_9_n_0 ),
        .I4(A_IBUF[8]),
        .I5(\output[16]_INST_0_i_10_n_0 ),
        .O(\output[16]_INST_0_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[16]_INST_0_i_8 
       (.I0(C_IBUF),
        .I1(B_IBUF[7]),
        .O(\output[16]_INST_0_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \output[16]_INST_0_i_9 
       (.I0(C_IBUF),
        .I1(B_IBUF[8]),
        .O(\output[16]_INST_0_i_9_n_0 ));
  OBUF \output[1]_INST_0 
       (.I(output_OBUF[1]),
        .O(\output [1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h69966666)) 
    \output[1]_INST_0_i_1 
       (.I0(A_IBUF[1]),
        .I1(B_IBUF[1]),
        .I2(C_IBUF),
        .I3(A_IBUF[0]),
        .I4(B_IBUF[0]),
        .O(output_OBUF[1]));
  OBUF \output[2]_INST_0 
       (.I(output_OBUF[2]),
        .O(\output [2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \output[2]_INST_0_i_1 
       (.I0(\output[3]_INST_0_i_2_n_0 ),
        .I1(A_IBUF[2]),
        .I2(B_IBUF[2]),
        .I3(C_IBUF),
        .O(output_OBUF[2]));
  OBUF \output[3]_INST_0 
       (.I(output_OBUF[3]),
        .O(\output [3]));
  LUT6 #(
    .INIT(64'h4ED8B127B1274ED8)) 
    \output[3]_INST_0_i_1 
       (.I0(A_IBUF[2]),
        .I1(B_IBUF[2]),
        .I2(C_IBUF),
        .I3(\output[3]_INST_0_i_2_n_0 ),
        .I4(A_IBUF[3]),
        .I5(B_IBUF[3]),
        .O(output_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hBE28B8B8)) 
    \output[3]_INST_0_i_2 
       (.I0(A_IBUF[1]),
        .I1(B_IBUF[1]),
        .I2(C_IBUF),
        .I3(A_IBUF[0]),
        .I4(B_IBUF[0]),
        .O(\output[3]_INST_0_i_2_n_0 ));
  OBUF \output[4]_INST_0 
       (.I(output_OBUF[4]),
        .O(\output [4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \output[4]_INST_0_i_1 
       (.I0(\output[5]_INST_0_i_2_n_0 ),
        .I1(C_IBUF),
        .I2(B_IBUF[4]),
        .I3(A_IBUF[4]),
        .O(output_OBUF[4]));
  OBUF \output[5]_INST_0 
       (.I(output_OBUF[5]),
        .O(\output [5]));
  LUT6 #(
    .INIT(64'h4DE8B217B2174DE8)) 
    \output[5]_INST_0_i_1 
       (.I0(\output[5]_INST_0_i_2_n_0 ),
        .I1(B_IBUF[4]),
        .I2(A_IBUF[4]),
        .I3(C_IBUF),
        .I4(B_IBUF[5]),
        .I5(A_IBUF[5]),
        .O(output_OBUF[5]));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[5]_INST_0_i_2 
       (.I0(A_IBUF[3]),
        .I1(B_IBUF[3]),
        .I2(C_IBUF),
        .I3(A_IBUF[2]),
        .I4(B_IBUF[2]),
        .I5(\output[3]_INST_0_i_2_n_0 ),
        .O(\output[5]_INST_0_i_2_n_0 ));
  OBUF \output[6]_INST_0 
       (.I(output_OBUF[6]),
        .O(\output [6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \output[6]_INST_0_i_1 
       (.I0(\output[7]_INST_0_i_2_n_0 ),
        .I1(C_IBUF),
        .I2(B_IBUF[6]),
        .I3(A_IBUF[6]),
        .O(output_OBUF[6]));
  OBUF \output[7]_INST_0 
       (.I(output_OBUF[7]),
        .O(\output [7]));
  LUT6 #(
    .INIT(64'h4DE8B217B2174DE8)) 
    \output[7]_INST_0_i_1 
       (.I0(\output[7]_INST_0_i_2_n_0 ),
        .I1(B_IBUF[6]),
        .I2(A_IBUF[6]),
        .I3(C_IBUF),
        .I4(B_IBUF[7]),
        .I5(A_IBUF[7]),
        .O(output_OBUF[7]));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[7]_INST_0_i_2 
       (.I0(A_IBUF[5]),
        .I1(B_IBUF[5]),
        .I2(C_IBUF),
        .I3(A_IBUF[4]),
        .I4(B_IBUF[4]),
        .I5(\output[5]_INST_0_i_2_n_0 ),
        .O(\output[7]_INST_0_i_2_n_0 ));
  OBUF \output[8]_INST_0 
       (.I(output_OBUF[8]),
        .O(\output [8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \output[8]_INST_0_i_1 
       (.I0(\output[9]_INST_0_i_2_n_0 ),
        .I1(C_IBUF),
        .I2(B_IBUF[8]),
        .I3(A_IBUF[8]),
        .O(output_OBUF[8]));
  OBUF \output[9]_INST_0 
       (.I(output_OBUF[9]),
        .O(\output [9]));
  LUT6 #(
    .INIT(64'h4DE8B217B2174DE8)) 
    \output[9]_INST_0_i_1 
       (.I0(\output[9]_INST_0_i_2_n_0 ),
        .I1(B_IBUF[8]),
        .I2(A_IBUF[8]),
        .I3(C_IBUF),
        .I4(B_IBUF[9]),
        .I5(A_IBUF[9]),
        .O(output_OBUF[9]));
  LUT6 #(
    .INIT(64'hBE2EBEB82E28B828)) 
    \output[9]_INST_0_i_2 
       (.I0(A_IBUF[7]),
        .I1(B_IBUF[7]),
        .I2(C_IBUF),
        .I3(A_IBUF[6]),
        .I4(B_IBUF[6]),
        .I5(\output[7]_INST_0_i_2_n_0 ),
        .O(\output[9]_INST_0_i_2_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
