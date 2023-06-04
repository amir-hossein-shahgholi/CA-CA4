`timescale 1ns/1ns
module MUX1(input [15:0] I0,I1 ,input IorD , output reg [15:0] out);

always@(I0,I1,IorD) begin
	case(IorD)
		0: out <= I0;
		1: out <= I1;
	endcase
end
endmodule
