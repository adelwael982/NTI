module gray_behave  (
    input  [3:0] binary,
    output reg [3:0] gray           
);

always @(*) begin
    case (binary)
       0 : gray=0;
       'b0001: gray='b0001;
       'b0010: gray='b0011;
       'b0011: gray='b0010;
       'b0100: gray='b0110;
       'b0101: gray='b0111;
       'b0110: gray='b0101;
       'b0111: gray='b0100;
       'b1000: gray='b1100;
       'b1001: gray='b1101;
       'b1010: gray='b1111;
       'b1011: gray='b1110;
       'b1100: gray='b1010;
       'b1101: gray='b1011;
       'b1110: gray='b1001;
       'b1111: gray='b1000;
        default: gray=0;
    endcase
end

endmodule

