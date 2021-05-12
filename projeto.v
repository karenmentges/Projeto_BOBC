module projeto(
    input ck,
    input inicio,
    input rst,
    input [15:0] X,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] Resultado,
    output pronto,
    output overflow
);

    wire lx, h, ls, lh;
    wire [1:0] m0, m1, m2; 

    controle c(ck, inicio, rst, lx, m0, m1, m2, h, ls, lh, pronto);
    operativo op(ck, rst, lx, m0, m1, m2, h, ls, lh, pronto, X, A, B, C, Resultado);

endmodule