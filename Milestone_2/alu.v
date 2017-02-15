module alu (inInst, clk, result, d_wr);
  input clk;
  // 32-bit Instuction
  input [31:0] inInst;

  reg [4:0]   rs;
  reg [4:0]   rt;
  reg [4:0]   rd;
  reg [5:0]   funct;
  reg [15:0]  addr;
  output [31:0] result;
  reg [31:0] result;
  output reg d_wr;
  reg [31:0] mem_temp;

  initial begin
    d_wr = 0;
  end
  always @ ( * ) begin

    // Check if Arithmethic Op
    if(inInst[31:26] == 6'b000000) begin
      // Split instructions
      rs = inInst[25:21];
      rt = inInst[20:16];
	    rd = inInst[15:11];
      funct = inInst[5:0];

      // Addition
      if (funct == 6'b100000) begin

      end
      // Subtraction
      else if (funct == 6'b100010) begin

      end
      // SLT
      else if (funct == 6'b101010) begin

      end
    end

    // Check if Memory Op
    else begin
      // Split Instruction
      rs = inInst[25:21];
    	rt = inInst[20:16];
    	addr = inInst[15:0];

      if(inInst[31:26] == 6'b100011) begin
        mem_temp <= 32'b0;
        mem_temp[15:0] = inInst[15:0];
        result = mem_temp + inInst[25:21];


      end
    end
  end



endmodule //
