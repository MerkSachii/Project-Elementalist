module regfile(
  wr_en, wr_addr, wr_data,
  rd_addrA, rd_addrB,
  rd_dataA, rd_dataB,
  clk,
  nrst
);

// Input port declaration
input [4:0]   rd_addrA;
input [4:0]   rd_addrB;
input [4:0]   wr_addr;
input [31:0]  wr_data;
input        wr_en;
input wire    clk;
input wire    nrst;
// Output port declaration
output reg [31:0] rd_dataA;
output reg [31:0] rd_dataB;

integer ctr;

reg [31:0] Registers [0:31];

initial begin
        Registers[0] <= 32'h00000000;
        Registers[1] <= 32'h00000000;
        Registers[2] <= 32'h00000000;
        Registers[3] <= 32'h00000000;
        Registers[4] <= 32'h00000000;
        Registers[5] <= 32'h00000000;
        Registers[6] <= 32'h00000000;
        Registers[7] <= 32'h00000000;
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

always @(rd_addrA) // This is for executing code that does not care about positive or negative edge of the clock
begin
  rd_dataA = Registers[rd_addrA];
  $display("addr: %d", rd_addrA);
  $display("This is the result of rd_dataA=%d", rd_dataA);
  if(rd_addrA == 0)
    rd_dataA = 0;
end

always @(rd_addrB) // This is for executing code that does not care about positive or negative edge of the clock
begin
  rd_dataB = Registers[rd_addrB];
  $display("addr: %d", rd_addrB);
  $display("This is the result of rd_dataB=%d", rd_dataB);
  if(rd_addrB == 0)
    rd_dataB = 0;
end

always @(posedge clk)
begin
  if(wr_en == 1)
    if(wr_addr == 0)
      $display("That is not allowed");
    else
      Registers[wr_addr] <= wr_data; // for testing only

  if(nrst == 0)
  begin

    for(ctr = 0; ctr < 32; ctr++)
    begin
      Registers[ctr] <= 32'h00000000;
    end // end for loop

    for(ctr = 0; ctr < 32; ctr++)
      $display("R[%d]: %h", ctr, Registers[ctr]);

  end // end if statement

end // end always positive edge

endmodule
