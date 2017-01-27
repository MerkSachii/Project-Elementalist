//`timescale 1ns/100ps
`include "register.v"

module register_tb();

	reg [4:0]  wr_addr = 0;
	reg [4:0]  rd_addrA = 0;
	reg [4:0]  rd_addrB = 0;
	reg elk, nrst, wr_en;
	
	wire [31:0] wr_data, rd_dataA, rd_dataB;

	integer ctr;

	// assign all wires here
	assign {wr_data, rd_dataA, rd_dataB} = 0;

	// Main Function
	initial begin
		$dumpfile("register.vcd");
		$dumpvars(0, register_tb);
		elk = 1; // clock started at 1

		for(ctr = 0; ctr < 25; ctr++)
		begin
			#1 
			rd_addrA = rd_addrA + 1;
			$display("Counter: %d", ctr);
			$display("Read Address A: %0h", rd_addrA);
			
			#10
			nrst = 1;
		end

		$finish;
	end

	// Clock Ticking Function
	always begin
		#5 elk = ~elk;
	end

	register reg_file(wr_en, wr_addr, wr_data, rd_addrA, 
		rd_addrB, rd_dataA, rd_dataB, elk, nrst);

endmodule