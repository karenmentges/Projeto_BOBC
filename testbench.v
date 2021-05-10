module testbench;

parameter X = 2, A = 3, B = 4, C = 5;
reg ck = 0, inicio = 0, pronto = 0, rst = 0;

wire lx, h, ls, lh, done;
wire [1:0] m0, m1, m2; 

input ck,
    input rst,
    input lx,
    input [1:0] m0,
    input [1:0] m1,
    input [1:0] m2,
    input h,
    input ls,
    input lh,
    input done,
    input [7:0] X,
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    output [15:0] Resultado

controle c();
operativo op();

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