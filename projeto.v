module projeto(
    input [7:0] X,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] Resultado
);

reg ck = 0, inicio = 0, pronto = 0, rst = 0;

wire lx, h, ls, lh, done;
wire [1:0] m0, m1, m2; 
// wire Resultado;

controle c(ck, inicio, pronto, rst, lx, m0, m1, m2, h, ls, lh, done);
operativo op(ck, rst, lx, m0, m1, m2, h, ls, lh, done, X, A, B, C, Resultado);

///////////////////////////////////////

wire done1, done2;

wire [5:0] barramento1;

swap s1(
    barramento1,
    ck,
    rst,
    w,
    done1
);

swap2 s2(
    ck,
    rst,
    w,
    done2
);

always #2 ck <= ~ck;

initial begin
    $dumpvars;
    rst <= 1;
    #10;
    rst <= 0;
    #10;
    w <= 1;
    #4;
    w <= 0;
    # 20;
    $finish;

end


endmodule