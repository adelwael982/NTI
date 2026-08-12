module half_addr(
  input wire x,y,
  output wire s,c
  );
assign s=x^y;
assign c=x&y;
endmodule
