//This code converts SR Flip Flop to JK Flip Flop
/////////////////////////////////////////////////////////// 

///////////////
//Design Code//
///////////////
module srff(output reg q, qbar, input s,r,clk,rst);
always @(negedge clk)
begin
	if (rst) begin q = 0; qbar = 1; end
	else
	begin
	case ({s,r})
	2'b00: begin q = q; qbar = qbar; end
	2'b01: begin q = 0; qbar = 1; end
	2'b10: begin q = 1; qbar = 0; end
	2'b11: begin q = 1'bx; qbar = 1'bx; end
	endcase
end
end
endmodule

module jkff(inout q,qbar,input j,k,clk,rst);
	wire s1,r1;
	and g1(s1,j,qbar);
	and g2(r1,k,q);
	srff m1(q,qbar,s1,r1,clk,rst);
endmodule
//////////////////////////////////////////////////////////////////////

////////////////
//testbench.sv//
////////////////
module jkff_tb;
reg j,k,clk,rst;
wire q,qbar;
  jkff h1(q,qbar,j,k,clk,rst);
initial begin
  	$dumpfile("jkff.vcd");
  	$dumpvars(0,jkff_tb);
	clk = 0; rst = 1; j = 0; k = 0;
	#5 rst = 0;
	#120 $stop;
end
always #5 clk = ~clk;
always #10 j = ~j;
always #20 k = ~k;
endmodule
