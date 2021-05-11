module reg(
    input rst,
    input [15:0] v1,
    input l,
    output [15:0] reg
);
    if(l == 1){
        assign reg = v1;
    }

    if(rst == 1){
        assign reg = 15'b0000000000000000;
    }

endmodule