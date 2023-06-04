`timescale 1ns/1ns
module MCTB();
reg clk =1'b0, rst = 1'b0;
TOPmoduleMC CUT1(clk, rst);
always #100 clk=~clk;
initial begin
	#1000000 $stop;
end
endmodule
