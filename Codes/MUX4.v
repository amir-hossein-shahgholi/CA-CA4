`timescale 1ns/1ns
module MUX4(input [15:0] I0,I1,I2 ,input [1:0] ALUsrcA, output reg [15:0] out);

always@(I0,I1,I2,ALUsrcA) begin
	case(ALUsrcA)
		2'b00: out <= I0;
		2'b01: out <= I1;
		2'b10: out <= I2;
	endcase
end
endmodule
