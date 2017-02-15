module instruction(inst, pc, clk);
input clk;
input [31:0] pc;
output [31:0] inst;
reg [31:0] inst;

reg [31:0] memdata [127:0];

initial begin
    // ADD instruction
    memdata[0] = 32'b0000000000000000000000000010000;
    // LW instruction
    memdata[1] = 32'b100011;
    // SW instruction
    memdata[2] = 32'b101011;
    // BEQ instruction
    memdata[3] = 32'b000100;
    // BNE instruction
    memdata[4] = 32'b000101;
    // SUB instruction
    memdata[5] = 32'b000000;
    // SLT instruction
    memdata[6] = 32'b000000;

    end

always @(posedge clk)
    begin
        inst = memdata[pc];
    end

endmodule
