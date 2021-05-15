//This code is for 4 bit synchronous up-down counter
/////////////////////////////////////////////////////////// 

///////////////
//Design Code//
///////////////
module syncupdown(output reg[3:0] count,input clk,rst,m);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        count<=0;
      else if(clk)
        begin
          if(m)
            count<=count+1;
          else
            count<=count-1;
        end
      else
        count<=0;
    end 
endmodule

////////////////////////////////////////////////////////////////////////////////////

////////////////
//testbench.sv//
////////////////
module syncupdown_tb();
  reg clk,rst,m;
  wire[3:0] count;
  syncupdown g1(count,clk,rst,m);
  
  initial begin
     $dumpfile("syncupdown_tb.vcd");
    $dumpvars(0,syncupdown_tb);
    clk=0;rst=1;m=1;
    #20 rst=0;
    #150 m=0;
    #150 $stop;
  end
  always #5 clk=~clk;
endmodule
/////////////////////////////////////////////////////////////////////////////////////
