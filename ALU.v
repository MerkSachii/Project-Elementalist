module ALU(
	opA, opB,
	sel,
	res,
	z,
	c,
	v
);

//Input port declaration
input [31:0]	opA;
input [31:0]	opB;
input [2:0]		sel;

//Output port declaration
output [31:0]	res;
output wire 	z;
output wire		c;
output wire		v;

always@(*) // not sure
begin

	case(sel)
		3’b000: 	res = opA + opB;	// addition
		3’b001: 	res = opA - opB; 	// subtraction
		3’b010: 	res = opA && opB; 	// AND
		3’b011: 	res = opA || opB; 	// OR
		3’b100: 	res = !opA; 		// NOT
		
		// set result and flags to 0
		default: 	res = 32’h00000000;
					z = 0;
					c = 0;
					v = 0;
	endcase
	
end

endmodule