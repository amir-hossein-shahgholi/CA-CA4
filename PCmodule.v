`timescale 1ns/1ns
module PC(input clk,input [15:0] IN , input en, output reg [15:0] q);
assign q = 16'b0;
	always @(posedge clk) begin
		if(en)
			q = IN;
	end
endmodule
