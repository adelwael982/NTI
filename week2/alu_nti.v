module alu 
#(parameter WIDTH=8)(
input [WIDTH-1:0] in_a,in_b,
input [2:0] opcode,
output reg [WIDTH-1:0] alu_out,
output reg a_is_zero
);
localparam 
HLT = 'b000,
SKZ = 'b001,
ADD = 'b010,
AND = 'b011,
XOR = 'b100,
LDA = 'b101,
STO = 'b110,
JMP = 'b111
;
wire [WIDTH-1:0] Add;
wire [WIDTH-1:0] And;
wire [WIDTH-1:0] Xor;
assign Add=in_a+in_b;
assign And=in_a&in_b;
assign Xor=in_a^in_b;
always @(*) begin
   alu_out={WIDTH{1'b0}}; 
   a_is_zero=1'b0;
   if(in_a=={WIDTH{1'b0}})
   a_is_zero=1'b1;
   else begin
    case (opcode)
     HLT   : alu_out=in_a;
     SKZ   : alu_out=in_a;
     ADD   : alu_out=Add;
     AND   : alu_out=And;
     XOR   : alu_out=Xor;
     LDA   : alu_out=in_b;
     STO   : alu_out=in_a;
     JMP   : alu_out=in_a;
    endcase
   end
end
endmodule
