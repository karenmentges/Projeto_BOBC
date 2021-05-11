module reg(
    input [15:0] v1,
    input l,
    output [15:0] reg
);
    if(l == 1){
        assign reg = v1;
    }

endmodule