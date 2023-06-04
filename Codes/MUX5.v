`timescale 1ns/1ns
module MUX5(input [15:0] I0,I1 ,input ALUsrcB, output reg [15:0] out);

always@(I0,I1,ALUsrcB) begin
	case(ALUsrcB)
		0: out <= I0;
		1: out <= I1;
	endcase
end
endmodule
