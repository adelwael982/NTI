module gray_to_binary #(
    parameter bits=4
) (
    input [bits-1:0] gray,
    output reg [bits-1:0] binary
);
integer k;
always @(*) begin
   binary[bits-1]=gray[bits-1];
   for (k =bits-2 ;k>=0 ;k=k-1 ) begin
    binary[k]=gray[k]^binary[k+1];
   end 
end
endmodule
