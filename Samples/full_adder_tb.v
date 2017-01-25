`include "full_adder.v"

module full_adder_tb();

reg a, b, cin, clock;
wire sum, cout;

initial begin
  $dumpfile("full_adder.vcd"); 
  $dumpvars(0,a,b,cin,sum,cout,clock);
  clock = 1;
  #5
  a = 1'b1;
  b = 1'b0;
  cin = 1'b0;
  // sum = 1
  // cout = 0
  #10
  a = 1'b1;
  b = 1'b0;
  cin = 1'b1;
  // sum = 0
  // cout = 1
  #10
  a = 1'b1;
  b = 1'b1;
  cin = 1'b1; 
  // sum =1
  // cout =1
  #10
  a = 1'b0;
  b = 1'b1;
  cin = 1'b1;  
  // sum = 0
  // cout = 1
  #10
  $finish;
end

// Clock generator
always begin
  #5 clock = ~clock; // Toggle clock every 5 ticks
end

// Connect DUT to test bench
full_adder U_full_adder (
clock,
a, b, cin,
sum, cout
);

endmodule