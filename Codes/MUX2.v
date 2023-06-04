`timescale 1ns/1ns
module MUX2(input [2:0] I0,I1 ,input RegDst , output reg [2:0] out);

always@(I0,I1,RegDst) begin
	case(RegDst)
		0: out <= I0;
		1: out <= I1;
	endcase
end
endmodule
