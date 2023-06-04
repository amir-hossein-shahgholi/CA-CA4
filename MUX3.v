`timescale 1ns/1ns
module MUX3(input [15:0] I0,I1,I2,I3 ,input [1:0] Memtoreg , output reg [15:0] out);

always@(I0,I1,I2,I3,Memtoreg) begin
	case(Memtoreg)
		2'b00: out <= I0;
		2'b01: out <= I1;
		2'b10: out <= I2;
		2'b11: out <= I3;
	endcase
end
endmodule
