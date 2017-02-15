module instmem(inst, inst_addr, IMclk);
input IMclk;
input [31:0] inst_addr;
output [31:0] inst;
reg [31:0] inst;

reg [31:0] memory [127:0];

initial begin
    // These contains

    memory[0] = 32'b0000000000000000000000000010000;
    memory[1] = 32'b100011;
    memory[2] = 32'b101011;
    memory[3] = 32'b000100;
    memory[4] = 32'b000101;
    memory[5] = 32'b000000;
    memory[6] = 32'b000000;

    end

always @(inst_addr)
    begin
        inst = memory[inst_addr];
    end

endmodule
