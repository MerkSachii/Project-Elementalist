module register(
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
input        wr_en;
input wire    elk;
input wire    nrst;
// Output port declaration
output reg [31:0] rd_dataA;
output reg [31:0] rd_dataB;

integer ctr;

reg [31:0] Registers [0:31];

initial begin
        Registers[0] <= 32'h00000000;
        Registers[1] <= 32'h11111110;
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
  rd_dataA = #1 Registers[rd_addrA];
  $display("Eto yung result ng rd_dataA=%h", rd_dataA);
end

always @(rd_addrB) // This is for executing code that does not care about positive or negative edge of the clock
begin
  rd_dataB = #1 Registers[rd_addrB];
  $display("Eto yung result ng rd_dataB=%h", rd_dataB);
end

always @(posedge elk)
begin
  if(wr_en == 1)
    Registers[wr_addr] = wr_data; // for testing only

  if(nrst == 1)
  begin

    for(ctr = 1; ctr < 32; ctr++)
    begin
      Registers[ctr] <= 32'h00000000;
    end // end for loop

    for(ctr = 1; ctr < 5; ctr++)
      $display("R[%d]: %h", ctr, Registers[ctr]);

  end // end if statement

end // end always positive edge

endmodule
