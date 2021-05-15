module syncup(output reg[3:0] count,input clk,rst);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        count<=0;
      else if(clk)
        count<=count+1;
       else
        count<=0;
    end 
endmodule

/////////////////////////////////////////////////////////////////

module syncup_tb();
  reg clk,rst;
  wire[3:0] count;
  syncup g1(count,clk,rst);
  
  initial begin
    $dumpfile("syncup_tb.vcd");
    $dumpvars(0,syncup_tb);
    clk=0;rst=1;
    #20 rst=0;
    #150 $stop;
  end
  always #5 clk=~clk;
endmodule
  
///////////////////////////////////////////////////////////////
