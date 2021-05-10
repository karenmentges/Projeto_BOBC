module controle (
    input ck,
    input inicio,
    input pronto,
    input rst,
    output lx,
    output[1:0] m0,
    output[1:0] m1,
    output[1:0] m2,
    output h,
    output ls,
    output lh,
    output done
);

reg [1:0] state = 0; // inicializa em A

parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6, H = 7, I = 8, J = 9;


always @(posedge ck or rst) begin //Clock na borda de subida
    if(rst == 1)
        assign lx = 1'b0; 
        assign m0 = 2'b00;
        assign m1 = 2'b00;
        assign m2 = 2'b00;
        assign h = 1'b0;
        assign ls = 1'b0;
        assign lh = 1'b0;
        assign done = 1'b0;
        state <= A;
    else begin
        case (state)
            A : begin
                assign lx = 1'b1; 
                assign m0 = 2'b01; 
                assign m1 = 2'b00;
                assign m2 = 2'b00; 
                assign h = 1'b1; 
                assign ls = 1'b0; 
                assign lh = 1'b0; 
                assign done = 1'b0;
                state <= B;
            end
            B : begin
                assign lx = 1'b0;
                assign m0 = 2'b01;
                assign m1 = 2'b00;
                assign m2 = 2'b00;
                assign h = 1'b1;
                assign ls = 1'b0;
                assign lh = 1'b1;
                assign done = 1'b0;
                state <= C;
            end
            C : begin
                assign lx = 1'b0;
                assign m0 = 2'b10;
                assign m1 = 2'b00;
                assign m2 = 2'b11;
                assign h = 1'b0;
                assign ls = 1'b0;
                assign lh = 1'b0;
                assign done = 1'b0;
                state <= D;
            end
            D : begin
                assign lx = 1'b0;
                assign m0 = 2'b10;
                assign m1 = 2'b00;
                assign m2 = 2'b11;
                assign h = 1'b0;
                assign ls = 1'b0;
                assign lh = 1'b1;
                assign done = 1'b0;
                state <= E;
            end
            E : begin
                assign lx = 1'b0;
                assign m0 = 2'b00;
                assign m1 = 2'b01;
                assign m2 = 2'b11;
                assign h = 1'b1;
                assign ls = 1'b0;
                assign lh = 1'b0;
                assign done = 1'b0;
                state <= F;
            end
            F : begin
                assign lx = 1'b0;
                assign m0 = 2'b00;
                assign m1 = 2'b01;
                assign m2 = 2'b11;
                assign h = 1'b1;
                assign ls = 1'b0;
                assign lh = 1'b1;
                assign done = 1'b0;
                state <= G;
            end
            G : begin
                assign lx = 1'b0;
                assign m0 = 2'b11;
                assign m1 = 2'b00;
                assign m2 = 2'b11;
                assign h = 1'b0;
                assign ls = 1'b0;
                assign lh = 1'b0;
                assign done = 1'b0;
                state <= H;
            end
            H : begin
                assign lx = 1'b0;
                assign m0 = 2'b11;
                assign m1 = 2'b00;
                assign m2 = 2'b11;
                assign h = 1'b0;
                assign ls = 1'b1;
                assign lh = 1'b0;
                assign done = 1'b0;
                state <= I;
            end
            I : begin
                assign lx = 1'b0;
                assign m0 = 2'b00;
                assign m1 = 2'b00;
                assign m2 = 2'b00;
                assign h = 1'b0;
                assign ls = 1'b0;
                assign lh = 1'b0;
                assign done = 1'b1;
                state <= J;
            end
            J : begin
                assign lx = 1'b0; 
                assign m0 = 2'b00;
                assign m1 = 2'b00;
                assign m2 = 2'b00;
                assign h = 1'b0;
                assign ls = 1'b0;
                assign lh = 1'b0;
                assign done = 1'b0;
                state <= A;
            end
        endcase    
    end
end
endmodule