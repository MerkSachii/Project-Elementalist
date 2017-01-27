//`timescale 1ns/100ps
`include "Register.v"

/*
Test Process: (only modify R1-R4 registers)

> Registers that are associated with rd_addrA:
R1, R2

> Registers that are associated with rd_addrB:
R3, R4

> At start of program these are the values:
R1 = 11111110;
R2 = 22222220;
R3 = 33333330;
R4 = 44444440;

> Every 2 seconds, the values of all registers increase by 1

> Every 10 seconds, all reg values will reset via nrst variable

> program should run for 30 seconds

*/

module register_tb();

	reg [4:0]  wr_addr = 0;
	reg [4:0]  rd_addrA = 0;
	reg [4:0]  rd_addrB = 0;
	reg elk, nrst, wr_en;
	reg [31:0] Registers [0:31];
	
	wire [31:0] wr_data, rd_dataA, rd_dataB;

	integer prog_ctr, reg_ctr;

	// assign all wires here
	assign {wr_data, rd_dataA, rd_dataB} = 0;

	// Main Function
	initial begin
		$dumpfile("register.vcd");
		$dumpvars(0, register_tb);

		Registers[1] = 32'h11111110;
		Registers[2] = 32'h22222220;
		Registers[3] = 32'h33333330;
		Registers[4] = 32'h44444440;

		for(prog_ctr = 1; prog_ctr <= 4; prog_ctr++)
			$display("R[%d]: %h", prog_ctr, Registers[prog_ctr]);

		$display("End of initialization"); // ~debugging~
		
		for(prog_ctr = 0; prog_ctr < 20; prog_ctr++)
		begin
			#2 
			// add all reg values by 1
			$display("Counter: %d", prog_ctr);
			for(reg_ctr = 1; reg_ctr < 5; reg_ctr++)
			begin
				rd_addrA = reg_ctr; // if assigned
				Registers[rd_addrA] = Registers[rd_addrA] + 1; // if used
			end

			#10
			elk = 1;
			nrst = 0;
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