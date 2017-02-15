module single_cycle_mips (
  clk,
  rst_n,
  inst_addr, inst,
  data_addr, data_in, data_out, data_wr
);
  // INPUT
  input clk;
  input rst_n;
  input [31:0] inst;
  input [31:0] data_in;
  // OUTPUT
  output reg data_wr;
  output reg [31:0] data_out;
  output reg [31:0] data_addr;
  output reg [31:0] inst_addr;
endmodule //
