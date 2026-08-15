`default_nettype none
module PE
 #(
    parameter WIDTH = 8       //any value do you want
)(
input wire in_PE_clk,
input wire in_PE_rst,
input wire in_PE_valid,   
input wire [WIDTH-1:0]  in_PE_a,	
input wire [WIDTH-1:0]  in_PE_b,
output reg [WIDTH-1:0] out_PE_a,   
output reg [WIDTH-1:0]   out_PE_b,    
output reg [2*WIDTH-1:0] out_PE_acc  
);
	
always @(posedge in_PE_clk or negedge in_PE_rst)
 begin 
	 if(~in_PE_rst)
        begin 
	     out_PE_a<=0;
	     out_PE_b<=0;
    	 out_PE_acc<=0;
		 end
	    else 
		 begin
		 out_PE_a<=in_PE_a;
	     out_PE_b<=in_PE_b;
		  if(in_PE_valid)
		   begin
		   out_PE_acc<= out_PE_acc+(in_PE_a*in_PE_b);
		   end
		   else 
		   begin
		   out_PE_acc<= in_PE_a*in_PE_b;
		   
		   end
		 end
 end
endmodule