module projeto(
    input ck,
    input inicio,
    input pronto,
    input rst,
    input [15:0] X,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] Resultado,
    output LED
);

wire lx, h, ls, lh, done;
wire [1:0] m0, m1, m2; 

controle c(ck, inicio, pronto, rst, lx, m0, m1, m2, h, ls, lh, done);
operativo op(ck, rst, lx, m0, m1, m2, h, ls, lh, done, X, A, B, C, Resultado);

if(pronto == 1){
    assign LED = 1;
}
else{
    assign LED = 0;
}

endmodule1