//////////////
// design.sv//
//////////////
module fulladder(
    output Sum, Cout,
  input A, B, Cin);
  assign Sum=A ^ B ^ Cin;
  assign Cout=(A & B) |((A ^ B) & Cin);
    
endmodule
///////////////////////////////////////////////////////////

////////////////
//testbench.sv//
////////////////
module fulladder_tb();
wire Sum, Cout;
reg A, B, Cin;
  fulladder m1(Sum, Cout, A, B, Cin);
  initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0, fulladder_tb);
  end
  initial begin
    A=0; B=0; Cin=0;
   #20 A=0; B=0; Cin=1;
   #20 A=0; B=1; Cin=0;
   #20 A=0; B=1; Cin=1;
   #20 A=1; B=0; Cin=0;
   #20 A=1; B=0; Cin=1;
   #20 A=1; B=1; Cin=0;
   #20 A=1; B=1; Cin=1; 
   #30$stop;
    
  end
endmodule

////////////////////////////////////////////////////////////////
