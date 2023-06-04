`timescale 1ns/1ns
module datamem(input [15:0] writedata,adr,input MR,MW,clk,output reg [15:0] readdata);
reg [15:0] mem[0:511];
initial begin 
	$readmemb("mem.txt" , mem);
end
always @(adr,MW,writedata , negedge clk) begin
	if(MW)begin 
		mem[adr[15:0]] <= writedata;
		$writememb("mem.txt" , mem);
	end
end
always @(adr,MR,clk) begin
	if(MR) begin
		readdata <= mem[adr[15:0]];

	end
end
endmodule