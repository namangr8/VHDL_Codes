# Design Code
#######################

module mealy_nonoverlap(output reg Y,input A,clk,rst);
  reg[1:0]cst,nst;
  parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
  always@(cst or A)
    begin
      case(cst)
        S0:if(A==1'b0)begin nst=S1;Y=1'b0;end
        else begin nst=cst;Y=1'b0;end
        
        S1:if(A==1'b1)begin nst=S2;Y=1'b0;end
        else begin nst=cst;Y=1'b0;end
        
        S2:if(A==1'b0)begin nst=S3;Y=1'b0;end
        else begin nst=S0;Y=1'b0;end
       
        S3:if(A==1'b1)begin nst=S0;Y=1'b1;end
        else begin nst=S1;Y=1'b0;end
        default:nst=S0;
      endcase
    end
  always@(posedge clk or posedge rst)
    begin
      if(rst)cst<=S0;
      else cst<=nst;
    end 
endmodule

####################################################################

# Testbench Code
#####################
module mealy_nonoverlap_tb;
  reg A,clk,rst;
  wire Y;
  mealy_nonoverlap m1(Y, A, clk, rst);
  initial begin
    $dumpfile("mealy_nonovlp.vcd");
    $dumpvars(0,mealy_nonoverlap_tb);
  end
  initial begin
    
    clk=0;
    rst=1;
    A=0;
    #10 rst=0; A=1;
    #200 $stop;
  end
  always #10 A=~A;
    always #5 clk=~clk;
endmodule
####################################################################
