`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:02 09/15/2015 
// Design Name: 
// Module Name:    day_count 
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
module day_count(
	in0,
	in1,
	in2,
	in3,
	clk_out,
	rst_n,
	switch
    );

input clk_out,rst_n,switch;
output reg [3:0] in0,in1,in2,in3;

reg year_index;
reg [3:0] mon1,mon2,day1,day2,year1,year2;
reg [3:0] montotal;
reg [3:0] mon1_temp,mon2_temp,day1_temp,day2_temp,year1_temp,year2_temp;


always@(*) begin
	case(switch)
	1'b0: begin
	in0=mon1;
	in1=mon2;
	in2=day1;
	in3=day2;
	end
	
	
	1'b1:begin
	in0=0;
	in1=0;
	in2=year1;
	in3=year2;
	end
	endcase

//montotal=mon1+mon2;

	case({mon1,mon2})
	8'd1:begin 
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd2;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd2:begin 
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd2&&day2==4'd8) begin
				mon1_temp=0;
				mon2_temp=4'd3;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd3:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd4;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd4:begin 
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd0) begin
				mon1_temp=0;
				mon2_temp=4'd5;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd5:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd6;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd6:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd0) begin
				mon1_temp=4'd0;
				mon2_temp=4'd7;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd7:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd8;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd8:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd9;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd9:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd0) begin
				mon1_temp=4'd1;
				mon2_temp=4'd0;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd16:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd1) begin
				mon1_temp=4'd1;
				mon2_temp=4'd1;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd17:begin
			year_index=0;
			year1_temp=year1;
			year2_temp=year2;
			if(day1==4'd3&&day2==4'd0) begin
				mon1_temp=4'd1;
				mon2_temp=4'd2;
				day1_temp=0;
				day2_temp=4'd1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
			end end
			
	8'd18:begin
		
			if(day1==4'd3&&day2==4'd1) begin
				mon1_temp=0;
				mon2_temp=4'd1;
				day1_temp=0;
				day2_temp=4'd1;
				year_index=1'b1;
			end
			else if(day2==4'd9) begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1+1'b1;
				day2_temp=0;
				year_index=0;
			end
			else begin
				mon1_temp=mon1;
				mon2_temp=mon2;
				day1_temp=day1;
				day2_temp=day2+1'b1;
				year_index=0;
			end end
	endcase

	if(year_index==1'b1&&year2==4'd9)begin
		year1_temp=year1+1'b1;
		year2_temp=0;
		end
	
	else if  (year_index==1'b1)begin
		year1_temp=year1;
		year2_temp=year2+1'b1;
		end
	else begin
		year1_temp=year1;
		year2_temp=year2;
		end

end

always@(posedge clk_out or negedge rst_n)
	if(~rst_n) begin
		mon1<=4'd1;
		mon2<=4'd2;
		day1<=4'd1;
		day2<=4'd5;
		year1<=0;
		year2<=0;
		end
	else begin
		mon1<=mon1_temp;
		mon2<=mon2_temp;
		day1<=day1_temp;
		day2<=day2_temp;
		year1<=year1_temp;
		year2<=year2_temp;
		
		end
		
endmodule
