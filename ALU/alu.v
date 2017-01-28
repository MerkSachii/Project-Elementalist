module alu(
	opA, opB, 
	sel, 
	res, 
	z, c, v
);

input reg [31:0] opA;
input reg [31:0] opB;
input reg [2:0] sel;
output reg [31:0] res;
output wire z, c, v;

integer ctr;

initial begin
	
end

endmodule