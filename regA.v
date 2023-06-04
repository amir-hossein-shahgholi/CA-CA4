`timescale 1ns/1ns
module A(input clk,input [15:0] IN , output reg [15:0] q);
assign q = 16'b0;
	always @(posedge clk , IN) begin
			q = IN;
	end
endmodule
