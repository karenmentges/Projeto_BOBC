module testbench;

parameter ck, inicio, pronto, rst;
parameter [15:0] X = ;
parameter [15:0] A = ;
parameter [15:0] B = ;
parameter [15:0] C = ;

wire [15:0] Resultado;

projeto(ck, inicio, pronto, rst, X, A, B, C, Resultado);

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