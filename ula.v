module ula(
    input [15:0] v1,
    input [15:0] v2,
    input h,
    output [15:0] r
);

    assign r = h ? v1 * v2 : v1 + v2;

endmodule