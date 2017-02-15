module DataMemory(clk, data_addr, data_wr, data_in, data_out);
input wire clk;
input wire [31:0] data_addr, data_out;
input wire data_wr;
output reg [31:0] data_in;
reg [255:0] memSpace [7:0];

always @(data_addr) begin
  data_in[31:24] <= memSpace[data_addr];
  data_in[23:16] <= memSpace[data_addr + 1];
  data_in[15:8]  <= memSpace[data_addr + 2];
  data_in[7:0]   <= memSpace[data_addr + 3];
end

always @ (posedge clk) begin
  if(data_wr == 1'b1) begin
  memSpace[data_addr] <= data_out[31:24];
  memSpace[data_addr+1] <= data_out[23:16];
  memSpace[data_addr+2] <= data_out[15:8];
  memSpace[data_addr+3] <= data_out[7:0];

  data_in[31:24] <= data_out[31:24];
  data_in[23:16] <= data_out[23:16];
  data_in[15:8] <= data_out[15:8];
  data_in[7:0] <= data_out[7:0];
  end
end

endmodule
