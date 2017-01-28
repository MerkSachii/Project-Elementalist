`include "alu.v"
module alu_tb();
	reg[31:0] opA;
	reg[31:0] opB;
	reg[2:0] sel;

	wire[31:0] res;
	wire z;
	wire c;
	wire v;

initial begin
	$dumpfile("alu.vcd");
	$dumpvars(0, opA, opB, sel, res, z, c, v);


	#5
	sel = 3'b000;
	opA = 32'h8FFFFFFF;
	opB = 32'h8FFFFFFF;

	#5
	sel = 3'b001;
	opA = 32'h0FFFFFFF;
	opB = 32'h8FFFFFFF;

	#5
	sel = 3'b000;
	opA = 32'hFFFFFFFF;
	opB = 32'h00000004;

	#5
	sel = 3'b010;
	opA = 32'hFFFFFFFF;
	opB = 32'h55555555;

	#5
	sel = 3'b000;
	opA = 32'h40000000;
	opB = 32'h40000000;

	#5
	sel = 3'b000;
	opA = 32'h00000000;
	opB = 32'h00000000;

	#5
	sel = 3'b001;
	opA = 32'h80000000;
	opB = 32'h70000000;

	#5
	sel = 3'b001;
	opA = 32'h00000000;
	opB = 32'hffffffff;

	#5
	sel = 3'b001;
	opA = 32'h00000006;
	opB = 32'h00000001;

	#5
	sel = 3'b001;
	opA = 32'h00000001;
	opB = 32'h00000001;

	#5
	sel = 3'b001;
	opA = 32'h00000000;
	opB = 32'h00000001;

	#5
	sel = 3'b110;
	opA = 32'h00000000;
	opB = 32'h00000001;

	#20

	$finish;
end


alu U_alu(opA, opB, sel, res, z, c, v);

endmodule
