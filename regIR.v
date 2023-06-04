`timescale 1ns/1ns
module IR(input clk,input [15:0] IN , input IRwrite, output reg [15:0] q);
assign q = 16'b0;
	always @(posedge clk) begin
		if(IRwrite)
			q = IN;
	end
endmodule