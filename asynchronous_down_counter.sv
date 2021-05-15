//This code is for 4 bit asynchronous down counter
/////////////////////////////////////////////////////////// 

///////////////
//Design Code//
//////////////
module asyncdown(output reg[3:0] count,input clk,rst);
  always@(posedge rst)
    count=0;
  always@(posedge clk)
    count[0]=~count[0];
  always@(posedge count[0])
    count[1]=~count[1];
  always@(posedge count[1])
    count[2]=~count[2];
  always@(posedge count[2])
   count[3]=~count[3];
endmodule

////////////////////////////////////////////////////////////////////////
////////////////
//testbench.sv//
////////////////
module asyncdown_tb();
  reg clk,rst;
  wire[3:0] count;
  asyncdown g1(count,clk,rst);
  
  initial begin
     $dumpfile("asyncdown_tb.vcd");
    $dumpvars(0,asyncdown_tb);
    clk=0;rst=1;
    #20 rst=0;
    #150 $stop;
  end
  always #5 clk=~clk;
endmodule

///////////////////////////////////////////////////////////////////////////
