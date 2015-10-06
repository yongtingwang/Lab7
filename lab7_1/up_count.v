`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:04 09/04/2015 
// Design Name: 
// Module Name:    up_count 
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
module up_count(
	mode,
	clk_out,
	rst_n,
	in0,
	in1,
	in2,
	in3
    );

input [1:0] mode;
input clk_out,rst_n;
output reg [3:0] in0,in1,in2,in3;

reg [3:0] D,hr24_1,hr24_2,AorP,M,hr12_1,hr12_2,min1,min2,s1,s2;
reg [3:0] hr24_1_temp,hr24_2_temp,AorP_temp,hr12_1_temp,hr12_2_temp,min1_temp,min2_temp,s1_temp,s2_temp;



always@(*)begin
	case(mode)
		2'b00:begin         //分秒
				in0=min1;
				in1=min2;
				in2=s1;
				in3=s2; end
		2'b01:begin          //AM PM
				in0=AorP;
				in1=M;
				in2=hr12_1;
				in3=hr12_2; end
		2'b10:begin          //24小時
				in0=D;
				in1=D;
				in2=hr24_1;
				in3=hr24_2; end
	endcase
	 if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2==4'd1&&hr12_1==4'd1)begin
		hr24_1_temp=0;
		hr24_2_temp=0;
		AorP_temp=4'd10;
		hr12_1_temp=0;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end	

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2==4'd9)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1+1'b1;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end	



	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2==4'd7)begin
		hr24_1_temp=hr24_1+1'b1;
		hr24_2_temp=0;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end	

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2<4'd7)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end	
		
	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=hr24_2&&hr12_2<4'd9)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2==4'd1&&hr12_1==4'd1&&hr12_2==hr24_2)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=4'd13;
		hr12_1_temp=0;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2<4'd1&&hr12_1==4'd1&&hr12_2==hr24_2)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end
		

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2==4'd9&&hr12_1==0&&hr12_2==hr24_2)begin
		hr24_1_temp=hr24_1+1'b1;
		hr24_2_temp=0;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1+1'b1;
		hr12_2_temp=0;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end
		
	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1==4'd5&&hr12_2!=4'd9&&hr12_1==0&&hr12_2==hr24_2)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2+1'b1;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2+1'b1;
		min1_temp=0;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end

	else if (s2==4'd9&&s1==4'd5&&min2==4'd9&&min1!=4'd5)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1+1'b1;
		min2_temp=0;
		s1_temp=0;
		s2_temp=0;end

	else if (s2==4'd9&&s1==4'd5&&min2!=4'd9)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1;
		min2_temp=min2+1'b1;
		s1_temp=0;
		s2_temp=0;end


	else if (s2==4'd9&&s1!=4'd5)begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1;
		min2_temp=min2;
		s1_temp=s1+1'b1;
		s2_temp=0;end


		
	else begin
		hr24_1_temp=hr24_1;
		hr24_2_temp=hr24_2;
		AorP_temp=AorP;
		hr12_1_temp=hr12_1;
		hr12_2_temp=hr12_2;
		min1_temp=min1;
		min2_temp=min2;
		s1_temp=s1;
		s2_temp=s2+1'b1; end	
		
	end

always@(posedge clk_out or negedge rst_n)
	if(~rst_n) begin
		D<=4'd12;    //不變
		hr24_1<=4'd1;
		hr24_2<=4'd1;
		AorP<=4'd10;   //reset 變A
		M<=4'd11;    //不變
		hr12_1<=4'd1;
		hr12_2<=4'd1;
		min1<=4'd5;
		min2<=4'd9;
		s1<=4'd5;
		s2<=0; end

	else begin
		D<=4'd12;     //不變
		hr24_1<=hr24_1_temp;
		hr24_2<=hr24_2_temp;
		AorP<=AorP_temp;
		M<=4'd11;     //不變
		hr12_1<=hr12_1_temp;
		hr12_2<=hr12_2_temp;
		min1<=min1_temp;
		min2<=min2_temp;
		s1<=s1_temp;
		s2<=s2_temp; end

endmodule
