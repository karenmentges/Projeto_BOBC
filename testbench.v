module testbench;

parameter ck, inicio, pronto, rst;
parameter [15:0] X = ;
parameter [15:0] A = ;
parameter [15:0] B = ;
parameter [15:0] C = ;

wire [15:0] Resultado;
wire LED;

projeto p(ck, inicio, pronto, rst, X, A, B, C, Resultado, LED);


always #1 ck <= ~ck;

initial begin
    $dumpvars;
    #1
    inicio <= 0;
    pronto <= 0;
    rst <= 0;
    #3;
    inicio <= 1;
    #5;
    inicio <= 0;
    #19;
    pronto <= 1;
    #21;
    pronto <= 0;
    rst <= 1;
    $finish;

end


endmodule