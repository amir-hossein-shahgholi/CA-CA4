module TOPmoduleMC(input clk, rst);
	wire [15:0] w1, w2, w3, w4, w5, w7, w8, w9, w10, w11,w12,w13,w14,w15,w18,w19;
	wire w20, IorD, MR, MW, IRwrite, RegDst, regwrite, ALUsrcB, PCwrite, cond, zero;
	wire [1:0] ALUsrcA, ALUop, Memtoreg, PCsrc; 
	wire [2:0] w30 ,ALUoperation;
	reg [2:0] r0 = 3'b0;
	reg [15:0] r1 = 16'd1;
	wire [3:0] ps;
	PC m1(.clk(clk), .IN(w1) , .en(w20) , .q(w2));
	MUX1 m2(.I0(w1), .I1(w5), .IorD(IorD), .out(w3));
	datamem m3(.writedata(w11), .adr(w3), .MR(MR), .MW(MW), .clk(clk), .readdata(w4));
	IR m4(.clk(clk), .IN(w4), .IRwrite(IRwrite), .q(w7));
	MDR m5(.clk(clk), .IN(w4), .q(w8));
	MUX2 m6(.I0(r0), .I1({w7[2:0]}), .RegDst(RegDst), .out(w30));
	Regfile m7(.RR1(w7[2:0]), .RR2(r0), .WR(w30), .wd(w9), .regwrite(regwrite), .clk(clk), .RD1(w10), .RD2(w18));
	A m8(.clk(clk), .IN(w10) , .q(w12));
	A m19(.clk(clk), .IN(w18) , .q(w11));
	MUX3 m9(.I0(w19), .I1(w8), .I2(w12), .I3(w11), .Memtoreg(Memtoreg), .out(w9));
	signExtend m10(.IN({w7[11:0]}), .out(w5));
	MUX5 m11(.I0(w11), .I1(r1), .ALUsrcB(ALUsrcB), .out(w13));
	MUX4 m12(.I0(w2), .I1(w5), .I2(w12), .ALUsrcA(ALUsrcA), .out(w14));
	box1 m13(.zero(zero), .pcwrite(PCwrite), .cond(cond) , .out(w20));
	ALU m14(.A(w14), .B(w13), .ALUoperation(ALUoperation), .out(w15), .zero(zero));
	ALUout m15(.clk(clk), .IN(w15), .q(w19));
	MUX6 m16(.I0(w15), .I1({w2[15:12],w7[11:0]}), .I2({w2[15:9],w7[11:3]}), .PCsrc(PCsrc), .out(w1));
	ALUcontrol m17(.func({w7[11:3]}), .opc({w7[15:12]}), .clk(clk), .ALUop(ALUop), .ALUoperation(ALUoperation));
	controller m18(.clk(clk), .rst(rst), .opcode(w7[15:12]), .func(w7[11:3]), .IorD(IorD), .MEMread(MR), .MEMwrite(MW), .IRwrite(IRwrite), .ALUsrcB(ALUsrcB), .PCwrite(PCwrite), .regDst(RegDst),
		 	.regwrite(regwrite), .PCwritecond(cond), .ALUop(ALUop), .PCsrc(PCsrc), .Memtoreg(Memtoreg), .ALUsrcA(ALUsrcA), .psout(ps));
endmodule	
	
