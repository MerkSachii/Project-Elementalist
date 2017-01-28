module alu(
	opA, opB,
	sel,
	res,
	z, c, v
);

	input [31:0] opA;
	input [31:0] opB;
	input [2:0] sel;
	output reg [31:0] res;
	output reg z, c, v;

	integer ctr;

	initial begin
	end

	always @(*) begin

		z = 0;
		c = 0;
		v = 0;
		res = 32'h00000000;
		// Addition
		if(sel == 3'b000) begin
			{c, res} = opA + opB;
			$display("%b", res);
			if(res == 32'h00000000)
				z = 1;
			if((opA[31] == opB[31]) && res[31] == ~opA[31])
				v = 1;
		end
		// Subtraction
		else if(sel == 3'b001) begin
			{c, res} = opA - opB;
			$display("%b", res);
			if(res == 32'h00000000)
				z = 1;
			if((~opA[31] == opB[31]) && res[31] == ~opA[31])
				v = 1;
		end
		else if(sel == 3'b010) begin
			res = opA & opB;
			$display("%b", res);
			if(res == 32'h00000000)
				z = 1;
		end
		else if(sel == 3'b011) begin
			res = opA | opB;
			$display("%b", res);
			if(res == 32'h00000000)
				z = 1;
		end
		else if(sel == 3'b100) begin
			res = ~opA;
			$display("%b", res);
			if(res == 32'h00000000)
				z = 1;
		end
		else begin
			$display("Invalid 'sel' value");
		end

		$display("Zero Flag: %b", z);
		$display("Carry Flag: %b", c);
		$display("Overflow Flag: %b", v);
	end

endmodule
