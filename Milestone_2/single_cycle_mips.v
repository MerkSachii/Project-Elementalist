module single_cycle_mips (
  clk,
  rst_n,
  inst_addr, inst, inst_temp,
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
  output reg [31:0] inst_temp;
  reg [31:0] mem_temp;

  regfile RegFile(wr_en,wr_addr,wr_data,rd_addrA,rd_addrB,rd_dataA,rd_dataB,clk,nrst);
  instruction Instruction(IMinst, IMinst_addr, clk);
  alu ALLAHU(inInst,clk,result,d_wr);
  DataMemory dm(clk, data_addr, data_wr, data_in, data_out);
initial begin
  inst_temp <= 32'd0;
end
// Reset Registers to 0 if rst_n = 0
always @(negedge rst_n) begin
  nrst = 0;
end

always @ (negedge clk) begin
	inst_addr = inst_temp + 32'd4;
end

always @(inst) begin
  inInst = inst;
  if(d_wr == 0) begin
    wr_data = result;
    wr_addr = inst[15:11];
  end
  else begin
    data_wr = d_wr;
    if(inst[31:27] == 6'b100011) begin
      mem_temp <= 32'b0;
      mem_temp[15:0] = inst[15:0];
      mem_temp = mem_temp + inst[25:21];
      wr_addr = inst[20:16];
      data_addr = temp;
    end
  end
end



endmodule //
