`timescale 1ns/1ns

module controller(input clk, rst, input[3:0] opcode, input [8:0] func, output reg IorD, MEMread, MEMwrite, IRwrite, ALUsrcB, PCwrite, regDst,
		 	regwrite, PCwritecond, output reg [1:0] ALUop, PCsrc, Memtoreg, ALUsrcA, output [3:0] psout);
	reg [3:0] ps, ns;
	reg [3:0] IF = 6'd0, ID = 6'd1, S1 = 6'd2, S2 = 6'd3, S3 = 6'd4, S4 = 6'd5, S5 = 6'd6, S6 = 6'd7,
			S7 = 6'd8, S8 = 6'd9, S9 = 6'd10, S10 = 6'd11, S11 = 6'd12, S12 = 6'd13, S13 = 6'd14;
	always @(ps, opcode, func)begin
		{IorD, MEMread, MEMwrite, IRwrite, ALUsrcB, PCwrite, regDst, regwrite, PCwritecond, ALUop, PCsrc, Memtoreg, ALUsrcA} = 17'd0;
   		ns = IF;
    		case (ps)
      			IF: begin
				IorD = 1'b0;
				MEMread = 1'b1;
				IRwrite = 1'b1;
				ALUsrcA = 2'b00;
				ALUsrcB = 1'b1;
				PCsrc = 2'b00;
				PCwrite = 1'b1;
				ALUop = 2'b00;
				ns = ID;
			
      			end
			ID: begin
				ALUsrcA = 2'b01;
				ALUsrcB = 1'b0;
				ALUop = 2'b00;
				ns = (opcode == 4'b1100) ? S2: 
				     (opcode == 4'b1101) ? S1:
				     (opcode == 4'b1110) ? S4: 
				     (opcode == 4'b0010) ? S5:
				     (opcode == 4'b0100) ? S6:
				     (opcode == 4'b1000) ? S7:
				     (opcode == 4'b0000) ? S10:
				     (opcode == 4'b0001) ? S12 : ID;
      			end
			S1: begin 
				ns = S2;
				ALUsrcA = 2'b01;
				ALUsrcB = 1'b0;
				ALUop = 2'b01;
			end
			S2: begin 
				ns = IF;
				Memtoreg = 2'b00;
				regDst = 1'b0;
				regwrite = 1'b1;
      			end
			S3: begin 
				ns = S2;
				ALUsrcA = 2'b01;
				ALUsrcB = 1'b0;
				ALUop = 2'b01;
      			end
			S4: begin
				
				ns = S2;
				ALUsrcA = 2'b01;
				ALUsrcB = 1'b0;
				ALUop = 2'b01;
      			end
			S5: begin 

				ns = IF;
				PCsrc = 2'b01;
				PCwrite = 1'b1;
      			end
			S6: begin 
				ns = IF;
				ALUsrcA = 2'b10;
				ALUsrcB = 1'b0;
				ALUop = 2'b10;
				PCsrc = 2'b10;
				PCwritecond = 1'b1;
			end
			S7: begin 
				ns = (func == 9'b000000010) ? S8 :
				     (func == 9'b000000001) ? S13 : S9;
				ALUsrcA = 2'b10;
				ALUsrcB = 1'b0;
				ALUop = 2'b11;
			end
			S8: begin 
				ns = IF;
				Memtoreg = 2'b11;
				regwrite = 1'b1;
				regDst = 1'b1;
			end
			S9: begin
				ns = IF;
				regDst = 1'b0;
				regwrite = 1'b1;
				Memtoreg = 2'b00;
				ALUop = 2'b11;
			end
			S13: begin
				ns = IF;
				regDst = 1'b0;
				regwrite = 1'b1;
				Memtoreg = 2'b10;
				ALUop = 2'b11;
			end
			S10: begin 
				ns = S11;
				MEMread = 1'b1;
				IorD = 1'b1;
			end
			S11: begin 
				ns = IF;
				regDst = 1'b0;
				Memtoreg = 2'b01;
				regwrite = 1'b1;
			end
			S12: begin 
				ns = IF;
				MEMwrite = 1'b1;
				IorD = 1'b1;
			end
		endcase
	end

	always @(posedge clk, posedge rst)begin
		if(rst)
			ps <= IF;
		else
			ps <= ns;
	end
	assign psout = ps;

endmodule
