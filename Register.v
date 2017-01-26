module register_file(
  wr_en, wr_addr, wr_data,
  rd_addrA, rd_addrB,
  rd_dataA, rd_dataB,
  elk,
  nrst
);

// Input port declaration
input [4:0]   rd_addrA;
input [4:0]   rd_addrB;
input [4:0]   wr_addr;
input [31:0]  wr_data;
input         wr_en;
input         elk;
input         nrst;
// Output port declaration
output     [31:0] rd_dataA;
output      [31:0] rd_dataB;

endmodule
