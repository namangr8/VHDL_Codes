#This code is for full subtractor using 2 Half Subtractor
 ###########################################################

#Design Code
###############
 
module half_subtractor(

input a,b,

output difference,borrow,

wire x);

assign difference=a^b;

assign x=~a;
  
assign borrow=x&b;
  
endmodule


module full_subtractor(
input A, B, C,
output Diff, Bout, 
wire p, q, r);
  
half_subtractor u4(A, B, p, q);

  half_subtractor u5(p, C, Diff, r);

assign Bout=q|r;
endmodule

################################################################

# testbench.sv
##############
module full_subtractor_tb();
wire x;
reg A, B, C;
  full_subtractor m1(A, B, C,Diff, Bout,p, q, r);
  initial begin
    $dumpfile("full_subtractor.vcd");
    $dumpvars(0, full_subtractor_tb);
  end
  initial begin
    A=0; 

   B=0; 

   C=0;

   #100 $finish;

  end
always #40 A=~A;

always #20 B=~B;

always #10 C=~C;

 

endmodule



