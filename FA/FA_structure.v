module full_adder(
input z0,z1,z2,
output s1,c1
);
wire s0;
wire c0;
wire c01;
half_addr p1(
    .x(z1),
    .y(z2),
    .c(c0),
    .s(s0)
);

half_addr p2(
.x(z0),
.s(s1),
.y(s0),
.c(c01)
);
or(c1,c0,c01);
endmodule
