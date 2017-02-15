module instruction(inst, pc, clk);
input clk;
input [31:0] inst_addr;
output [31:0] inst;
reg [31:0] inst;

reg [31:0] memdata [127:0];

initial begin
    // These contains

    memdata[0] = 32'b0000000000000000000000000010000;
    memdata[1] = 32'b100011;
    memdata[2] = 32'b101011;
    memdata[3] = 32'b000100;
    memdata[4] = 32'b000101;
    memdata[5] = 32'b000000;
    memdata[6] = 32'b000000;

    end

always @(inst_addr)
    begin
        inst = memdata[inst_addr];
    end

endmodule
