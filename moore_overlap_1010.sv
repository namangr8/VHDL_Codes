// This code will detect the sequence 1010 in overlap sequence
//////////////////////////////////////////////////////////////////

/////////////
//design.sv//  
///////////// 

module moore_overlap(output reg Y,input A,clk,rst);
  reg[2:0]cst,nst;
  parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
  always@(cst or A)
    begin
      case(cst)
        S0:begin nst=A? S1:cst;Y=1'b0;end
        
        S1:begin nst=A? cst: S2;Y=1'b0;end
        
        S2:begin nst=A? S3:S2;Y=1'b0;end
        S3:begin nst=A? S1:S4;Y=1'b0;end
        S4:begin nst=A? S3:S0;
          Y=A?1'b0:1'b1;end
        default: nst=S0;
      endcase
    end
  always@(posedge clk or posedge rst)
    begin
      if(rst)cst<=S0;
      else cst<=nst;
    end  
endmodule

///////////////////////////////////////////////////////////////

////////////////
//testbench.sv//
////////////////

module moore_overlap_tb;
  reg A,clk,rst;
  wire Y;
  moore_overlap m1(Y, A, clk, rst);
  initial begin
    $dumpfile("moore_olp.vcd");
    $dumpvars(0,moore_overlap_tb);
    
    clk=0;
    rst=1;
    A=0;
    #10 rst=0; A=1;
    #200 $stop;
  end
  always #10 A=~A;
    always #5 clk=~clk;
endmodule
////////////////////////////////////////////////////////////////
