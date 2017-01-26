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

reg [31:0] Registers [0:31];

initial begin
        Registers[0] <= 32'h00000000;
        Registers[8] <= 32'h00000000;
        Registers[9] <= 32'h00000000;
        Registers[10] <= 32'h00000000;
        Registers[11] <= 32'h00000000;
        Registers[12] <= 32'h00000000;
        Registers[13] <= 32'h00000000;
        Registers[14] <= 32'h00000000;
        Registers[15] <= 32'h00000000;
        Registers[16] <= 32'h00000000;
        Registers[17] <= 32'h00000000;
        Registers[18] <= 32'h00000000;
        Registers[19] <= 32'h00000000;
        Registers[20] <= 32'h00000000;
        Registers[21] <= 32'h00000000;
        Registers[22] <= 32'h00000000;
        Registers[23] <= 32'h00000000;
        Registers[24] <= 32'h00000000;
        Registers[25] <= 32'h00000000;
        Registers[29] <= 32'd252;
        Registers[31] <= 32'b0;
end

always @(*) // This is for executing code that does not care about positive or negative edge of the clock
begin

and

endmodule
