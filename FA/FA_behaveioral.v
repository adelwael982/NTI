module gate (
    input wire a,b,cin,
    output reg sum,carry
);
always @(*) begin
   {carry,sum}=a+b+cin; 
end
endmodule

