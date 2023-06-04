`timescale 1ns/1ns
module MDR(input clk,input [15:0] IN , output reg [15:0] q);
assign q = 16'b0;
	always @(posedge clk) begin
			q = IN;
	end
endmodule
