`default_nettype none
module controller (
    input wire zero,
    input wire [2:0] opcode,phase,
    output reg sel ,rd,ld_ir,halt,inc_pc,ld_ac,wr,ld_pc,data_e 
);
localparam integer
HLT = 3'b000,
SKZ = 3'b001,
ADD = 3'b010,
AND = 3'b011,
XOR = 3'b100,
LDA = 3'b101,
STO = 3'b110,
JMP = 3'b111
;
localparam integer
INST_ADDR = 3'b000,
INST_FETCH = 3'b001,
INST_LOAD = 3'b010,
IDLE = 3'b011,
OP_ADDR = 3'b100,
OP_FETCH = 3'b101,
ALU_OP = 3'b110,
STORE = 3'b111
;
always @(*) begin
    sel =0;
    rd=0;
    ld_ir=0;
    halt=0;
    inc_pc=0;
    ld_ac=0;
    wr=0;
    ld_pc=0;
    data_e=0;
    case (phase)
      INST_ADDR  :  sel=1;
      INST_FETCH  :  begin sel=1;rd=1;end
      INST_LOAD  :  begin sel=1;rd=1;ld_ir=1; end
      IDLE  :  begin sel=1;rd=1;ld_ir=1;end
      OP_ADDR  :  begin inc_pc=1; halt=(opcode==HLT); end
      OP_FETCH  :  begin rd=(opcode==ADD|opcode==AND|opcode==XOR|opcode==LDA);  end
      ALU_OP  : begin rd=(opcode==ADD|opcode==AND|opcode==XOR|opcode==LDA);  
                      inc_pc=(opcode==SKZ)&&zero;  
                      ld_pc=(opcode==JMP);    
                      data_e=(opcode==STO); end
      STORE  :  begin rd=(opcode==ADD|opcode==AND|opcode==XOR|opcode==LDA);  
                      wr=(opcode==STO);
                      ld_ac=(opcode==ADD|opcode==AND|opcode==XOR|opcode==LDA);
                      ld_pc=(opcode==JMP);    
                      data_e=(opcode==STO);end
    endcase
end
endmodule
