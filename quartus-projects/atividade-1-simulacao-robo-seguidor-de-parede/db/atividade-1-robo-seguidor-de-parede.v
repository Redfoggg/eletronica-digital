// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Fri Sep  3 22:03:40 2021"

module atividade-robo-seguidor-de-parede(
	clock,
	H,
	L,
	A,
	R
);


input wire	clock;
input wire	H;
input wire	L;
output wire	A;
output wire	R;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
reg	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;





always@(posedge clock)
begin
	begin
	SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_0;
	end
end

assign	SYNTHESIZED_WIRE_0 = ~(L | H);

assign	SYNTHESIZED_WIRE_1 =  ~H;

assign	A = SYNTHESIZED_WIRE_1 & SYNTHESIZED_WIRE_2;

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_6 | L;

assign	R = SYNTHESIZED_WIRE_3 | H;

assign	SYNTHESIZED_WIRE_4 =  ~L;

assign	SYNTHESIZED_WIRE_5 =  ~SYNTHESIZED_WIRE_6;

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5;


endmodule
