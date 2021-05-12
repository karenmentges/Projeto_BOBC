module testbench;

    reg ck = 1'b0, inicio = 1'b0, pronto = 1'b0, rst = 1'b0;
    parameter [15:0] X = 16'b0000000000000010;
    parameter [15:0] A = 16'b0000000000000001;
    parameter [15:0] B = 16'b0000000000000011;
    parameter [15:0] C = 16'b0000000000000100;

    wire [15:0] Resultado;
    wire LED;

    projeto p(ck, inicio, pronto, rst, X, A, B, C, Resultado, LED);

    always #1 begin
        ck <= ~ck;
    end

    initial begin
        $dumpvars;
        inicio <= 0;
        pronto <= 0;
        rst <= 0;
        #2;
        inicio <= 1;
        #2;
        inicio <= 0;
        #18;
        pronto <= 1;
        #2;
        pronto <= 0;
        rst <= 1;
        $finish;

    end


endmodule