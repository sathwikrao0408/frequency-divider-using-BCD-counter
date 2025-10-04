module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); 
    wire [3:0]q0,q2,q1;
    
    assign c_enable[0] = 1;
    assign c_enable[1] = (q0 == 4'd9);
    assign c_enable[2] = (q1 == 4'd9 && c_enable[1]);
    assign OneHertz = (q2 == 4'd9 && c_enable[2]);

    bcdcount counter0 (clk, reset, c_enable[0],q0);
    bcdcount counter1 (clk, reset, c_enable[1],q1);
    bcdcount counter2 (clk, reset, c_enable[2],q2);
    
endmodule

/* THIS IS REFERENCE BCD COUNTER, FOR HDLbits THIS WILL ALREADY BE PRESENT. ADD ONLY THE ABOVE CODE

module BCD #(parameter cnt = 4'd9)(
    input clk,
    input reset,
    input en,
    output reg [3:0] q);

    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0; 
        end
        else if (en) begin 
            if (q == cnt) begin
                q <= 4'b0; 
            end
            else begin
                q <= q + 4'b1;
            end end end 
endmodule */
