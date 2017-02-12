module instruction(inst, pc, clk);
input clk;
input [31:0] pc;
output [31:0] inst;
reg [31:0] inst;

reg [31:0] memdata [127:0]

initial begin
    // ADD instruction
    memdata[0] = 32'0000000000000000000000000010000;
    // LW instruction
    memdata[1] = 32'100011;
    // SW instruction
    memdata[2] = 32'101011;
    // BEQ instruction
    memdata[3] = 32'000100;
    // BNE instruction
    memdata[4] = 32'000101;
    // SUB instruction
    memdata[5] = 32'000000;
    // SLT instruction
    memdata[6] = 32'000000;

    end

always @(posedge clk)
    begin
        inst = memdata[pc];
    end

endmodule
