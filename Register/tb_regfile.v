`timescale 1ns/1ps
`define CLK_PERIOD 50
`define NO_VECTORS 31 
`include "regfile.v"

module tb_regfile;
  
  reg [63:0] key1 [0:255];
  reg [43:0] key2 [0:255];
  initial begin
    $readmemh("key_rf1.txt",key1);
    //$readmemh("key_rf2.txt",key2);
  end

  //test
  /*integer i;
  initial begin
    for (i=0; i<10; i=i+1)
      $display("%x",key[i]);
  end*/

  reg clk,nrst;
  reg [4:0] rd_addrA,rd_addrB,wr_addr;
  reg wr_en;
  reg [31:0] wr_data;
  wire [31:0] rd_dataA,rd_dataB;
  
  regfile UUT(
    .rd_addrA(rd_addrA),
    .rd_addrB(rd_addrB),
    .clk(clk),
    .nrst(nrst),
    .wr_addr(wr_addr),
    .wr_en(wr_en),
    .wr_data(wr_data),
    .rd_dataA(rd_dataA),
    .rd_dataB(rd_dataB)
  );

  always
    #(`CLK_PERIOD*0.5) clk = ~clk;

  integer i,j;
  integer check;
  /*integer add,sub,band,bor,bnot;
  integer fz,fc,fv;
  reg [43:0] answer;*/
  initial begin

    //$vcdplusfile("tb_regfile.vpd");
    //$vcdpluson;

    //init
    clk = 0;
    nrst = 0;
    rd_addrA = 0;
    rd_addrB = 0;
    wr_addr = 0;
    wr_en = 0;
    wr_data = 0;

    #(`CLK_PERIOD*10);
    #(`CLK_PERIOD*0.8);
    nrst = 1'b1;

    #(`CLK_PERIOD);
    wr_en = 1'b1;
    wr_addr = 0;
    wr_data = 32'hFFFFFFFF;
    #(`CLK_PERIOD);
    wr_en = 0;
    #(`CLK_PERIOD);
    for (i=1; i<(`NO_VECTORS+1); i=i+1) begin 
      wr_en = 1'b1;
      wr_addr = wr_addr + 1; 
      wr_data = key1[i-1];
      #(`CLK_PERIOD);
      wr_en = 0;
      #(`CLK_PERIOD);
    end 
    wr_data = 0;

    check = 0;
    #(`CLK_PERIOD*10);
    rd_addrA = 0;
    #(`CLK_PERIOD);
    //$display("%X",rd_dataA);
    if (rd_dataA == 0)
      check = check + 1;
    else
      $display("Problem: PortA, addr %d",rd_addrA);
    for (i=0; i<(`NO_VECTORS); i=i+1) begin
      rd_addrA = rd_addrA + 1;
      #(`CLK_PERIOD);
      //$display("%X",rd_dataA);
      if (rd_dataA == key1[i])
        check = check + 1;
      else
        $display("Problem: PortA, addr %d",rd_addrA);
    end
    
    #(`CLK_PERIOD*10);
    rd_addrB = 0;
    #(`CLK_PERIOD);
    //$display("%X",rd_dataB);
    if (rd_dataB == 0)
      check = check + 1;
    else
      $display("Problem: PortB, addr %d",rd_addrB);
    for (i=0; i<(`NO_VECTORS); i=i+1) begin
      rd_addrB = rd_addrB + 1;
      #(`CLK_PERIOD);
      //$display("%X",rd_dataB);
      if (rd_dataB == key1[i])
        check = check + 1;
      else
        $display("Problem: PortB, addr %d",rd_addrB);
    end

    $display(" ");
    $display("Correct: %d",check);
    $display("Score: %f",((check/64.0)*20));
    $display(" ");

    /*j = 0;
    //loop: add (000)
    sel = 3'b000;
    for (i=0; i<`NO_VECTORS; i=i+1) begin
      {opA,opB} = key1[i];
      #(`CLK_PERIOD);
      answer = key2[j];
      if (res == answer[43:12])
        add = add + 1;
      if (z == answer[8])
        fz = fz + 1;
      if (c == answer[4])
        fc = fc + 1;
      else begin
        $display("%X",key1[i]);
      end
      if (v == answer[0])
        fv = fv + 1; 
      j = j + 1;
    end*/
   
    /*$display("Add:      %d/15",add);
    $display("Sub:      %d/15",sub);
    $display("And:      %d/15",band);
    $display("Or:       %d/15",bor);
    $display("Not:      %d/15",bnot);
    $display("Zero:     %d/75",fz);
    $display("Carry:    %d/75",fc);
    $display("Overflow: %d/75",fv);

    $display("ALU add: %d pts",add/3.0); 
    $display("ALU sub: %d pts",sub/3.0);
    $display("ALU bit: %d pts",(band+bor+bnot)/9.0);
    $display("ALU flg: %d pts",(fz/75)+(2*(fc/75))+(2*(fv/75)));
    */

    #(`CLK_PERIOD);
    $finish;
  end 

`ifdef SDF
  initial begin
    //$sdf_annotate("../mapped/regfile_mapped.sdf",regfile);
    $sdf_annotate("../check/regfile_mapped.sdf",regfile);
  end
`endif
    
endmodule
