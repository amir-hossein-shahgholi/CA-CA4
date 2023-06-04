`timescale 1ns/1ns
module ALU(input [15:0] A,B,input [2:0] ALUoperation ,output reg [15:0] out , output zero);
assign zero = (out == 0);
always @(ALUoperation ,A,B) begin
	case(ALUoperation) 
		3'b000: out <= A & B;
		3'b001: out <= A | B;
		3'b010: out <= A + B;
		3'b011: out <= B - A;
		3'b100: out <= ~A;
		3'b101: out <= A;
		3'b111: out <= 16'b0;
	endcase
end
endmodule


