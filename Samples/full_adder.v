module full_adder(
clock,
a, b, cin,
sum, cout
);

// Variable Declarations
input wire a, b, cin, clock;
output reg sum, cout;

always @ (posedge clock)
begin : Full_Adder
	sum  = #1 a ^ b ^ cin;
	cout = #1 (a & b) | (cin & a) | (cin & b);
end

endmodule
