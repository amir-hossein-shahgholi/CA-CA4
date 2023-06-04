`timescale 1ns/1ns
module ALUcontrol(input [8:0] func, input [3:0] opc,input clk,input [1:0] ALUop,output reg [2:0] ALUoperation);
	always @(clk) begin
		ALUoperation = 3'b010;
		case(ALUop)
			2'b00: ALUoperation = 3'b010;
			2'b10: ALUoperation = 3'b011;
			2'b01: begin
				case(opc)
					4'b1100:ALUoperation = 3'b010;
					4'b1101:ALUoperation = 3'b011;
					4'b1110:ALUoperation = 3'b000;
					4'b1111:ALUoperation = 3'b001;
				 endcase
				end
				
			2'b11: begin
				case(func)
					9'b000000001:ALUoperation = 3'b000;
					9'b000000010:ALUoperation = 3'b101;
					9'b000000100:ALUoperation = 3'b010;
					9'b000001000:ALUoperation = 3'b011;
					9'b000010000:ALUoperation = 3'b000;
					9'b000100000:ALUoperation = 3'b001;
					9'b001000000:ALUoperation = 3'b100;
					9'b010000000:ALUoperation = 3'b111;
				endcase
				end
		endcase 
	end 
endmodule