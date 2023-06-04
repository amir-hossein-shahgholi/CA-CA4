`timescale 1ns/1ns
module signExtend(input [11:0] IN , output reg [15:0] out);
always@(IN) begin
	out <= {4'b0,IN};
end
endmodule
