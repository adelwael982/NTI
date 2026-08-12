module gray_seg (
    input [3:0] gray,
    output [6:0] seg
); 
wire [3:0] binary;
binary_seven m1(
.binary(binary),
.seg(seg)
);
gray_to_binary_4 m2(
.gray(gray),
.binary(binary)
);
endmodule
