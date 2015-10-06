`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:07 09/15/2015 
// Design Name: 
// Module Name:    lab7_3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab7_3(
	 rst_n,
	 clk,
	 switch,
	 display,
	 ftsd_ctl
    );


input rst_n,clk,switch;
output [14:0] display;
output [3:0] ftsd_ctl;

wire clk_out;
wire [1:0] clk_ctl;
wire [3:0] in0,in1,in2,in3,bcd;

freq_div f1(
	.clk_out(clk_out), // divided clock output  1HZ
	.clk_ctl(clk_ctl), // divided clock output for scan freq
	.clk(clk), // global clock input
	.rst_n(rst_n) // active low reset
	); 
	
day_count d1(
	.in0(in0),
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.clk_out(clk_out),
	.rst_n(rst_n),
	.switch(switch)
    );

scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in((bcd)), // output to ftsd display
	.in0(in0), // 1st input
	.in1(in1), // 2nd input
	.in2(in2), // 3rd input
	.in3(in3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	); 

bcd2ftsegdec b1(
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);

endmodule
