module instruction(IMinst, IMinst_addr, clk);
input clk;
input [31:0] IMinst_addr;
output [31:0] IMinst;
reg [31:0] IMinst;

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
        IMinst = memdata[IMinst_addr];
    end

endmodule
