module alu (inst, clk);
  input clk;
  // 32-bit Instuction
  input [31:0] inst;

  reg [4:0]   rs;
  reg [4:0]   rt;
  reg [4:0]   rd;
  reg [5:0]   funct;
  reg [15:0]  addr;

  always @ ( * ) begin

    // Check if Arithmethic Op
    if(inst[31:26] == 6'b000000) begin
      // Split instructions
      rs = inst[25:21];
      rt = inst[20:16];
	    rd = inst[15:11];
      funct = inst[5:0];

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
      rs = inst[25:21];
    	rt = inst[20:16];
    	addr = inst[15:0];
    end
  end



endmodule //
