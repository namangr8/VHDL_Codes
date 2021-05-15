//This code is for 4 bit synchronous down counter
/////////////////////////////////////////////////////////// 

///////////////
//Design Code//
///////////////
module syncdown(output reg[3:0] count,input clk,rst);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        count<=15;
      else if(clk)
        count<=count-1;
       else
        count<=15;
    end 
endmodule

/////////////////////////////////////////////////////////////////////////

////////////////
//testbench.sv//
////////////////
module syncdown_tb();
  reg clk,rst;
  wire[3:0] count;
  syncdown g1(count,clk,rst);
  
  initial begin
    $dumpfile("syncdown_tb.vcd");
    $dumpvars(0,syncdown_tb);
    clk=0;rst=1;
    #20 rst=0;
    #150 $stop;
  end
  always #5 clk=~clk;
endmodule
  
///////////////////////////////////////////////////////////////////////
