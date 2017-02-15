module instmem(inst, inst_addr, pc, clk);
// INPUT
input clk;
input [31:0] pc;
// OUTPUT
output reg [31:0] inst;
output reg [31:0] inst_addr;

reg [31:0] meminst [127:0];

initial begin
    // ADD instruction
    meminst[0] = 32'b0000000000000000000000000010000;
    // LW instruction
    meminst[1] = 32'b100011;
    // SW instruction
    meminst[2] = 32'b101011;
    // BEQ instruction
    meminst[3] = 32'b000100;
    // BNE instruction
    meminst[4] = 32'b000101;
    // SUB instruction
    meminst[5] = 32'b000000;
    // SLT instruction
    meminst[6] = 32'b000000;

    end

always @(posedge clk)
    begin
        inst = meminst[pc];
    end

endmodule
