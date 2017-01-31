`include "register.v"
module register_tb();
	reg elk;
	reg nrst;
	reg[4:0] rd_addrA;
	reg[4:0] rd_addrB;
	reg[4:0] wr_addr; 
	reg wr_en;
	reg[31:0] wr_data;


	reg[31:0] R[31:0];
	reg tempA, tempB;
	output wire [31:0] rd_dataA;
	output wire [31:0] rd_dataB;
	
	
initial begin
	$dumpfile("register.vcd");
	$dumpvars(0, elk, nrst, rd_addrA, rd_addrB, wr_addr, wr_en, wr_data, rd_dataA, rd_dataB);
	elk =1;
	
	#20
	wr_en = 1;
	wr_addr = 32'd8;
	wr_data = 32'd11425652;
	#1
	rd_addrA = wr_addr;	
	
	#25
	wr_en = 1;
	wr_addr = 32'd9;
	wr_data = 32'd11425653;
	#1
	rd_addrB = wr_addr;
	
	#10
	nrst = 1;
	#5
	nrst = 0;
	rd_addrA = wr_addr;	
	rd_addrB = wr_addr;
	
	#30
	
	$finish;
end


always begin
	
	#5 elk = ~elk; //toggle clock every 5 ticks

end

register U_register(wr_en, wr_addr, wr_data, rd_addrA, rd_addrB, rd_dataA, rd_dataB, elk, nrst);

endmodule