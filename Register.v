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
input wire    wr_en;
input wire    elk;
input wire    nrst;
// Output port declaration
output reg [31:0] rd_dataA;
output reg [31:0] rd_dataB;

endmodule
