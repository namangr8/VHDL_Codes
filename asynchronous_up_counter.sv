//This code is for 4 bit asynchronous up counter
/////////////////////////////////////////////////////////// 

///////////////
//Design Code//
//////////////

module asyncup(output reg[3:0] count,input clk,rst);
  always@(posedge rst)
    count=15;
  always@(posedge clk)
    count[0]=~count[0];
  always@(posedge ~count[0])
    count[1]=~count[1];
  always@(posedge ~count[1])
    count[2]=~count[2];
  always@(posedge ~count[2])
   count[3]=~count[3];
endmodule
////////////////////////////////////////////////////////////////
////////////////
//testbench.sv//
////////////////
module asyncup_tb();
  reg clk,rst;
  wire[3:0] count;
  asyncup g1(count,clk,rst);
  
  initial begin
     $dumpfile("asyncup_tb.vcd");
    $dumpvars(0,asyncup_tb);
    clk=1;rst=1;
    #20 rst=0;
    #150 $stop;
  end
  always #5 clk=~clk;
endmodule
///////////////////////////////////////////////////////////////////

