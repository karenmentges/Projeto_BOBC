module testbench;

    parameter [15:0] X = 16'b0000000000010111;
    parameter [15:0] A = 16'b0000000000100110;
    parameter [15:0] B = 16'b0000000101001101;
    parameter [15:0] C = 16'b0001001100100110;
    
    reg ck = 1'b0;
    reg inicio;
    reg rst;
    wire pronto;
    wire overflow;
    wire [15:0] resultado;

    projeto p(ck, inicio, rst, X, A, B, C, pronto, overflow, resultado);

    always #1 begin
        ck <= ~ck;
    end

    initial begin
        $dumpvars;
        inicio <= 0;
        rst <= 0;
        #2;
        inicio <= 1;
        #2;
        inicio <= 0;
        #25;
        rst <= 1;
        #2
        rst <= 0;
        $finish;
    end


endmodule