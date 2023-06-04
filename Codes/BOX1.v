`timescale 1ns/1ns
module box1(input zero,pcwrite,cond , output out);
	assign out = ((zero & cond) | pcwrite);
endmodule 
