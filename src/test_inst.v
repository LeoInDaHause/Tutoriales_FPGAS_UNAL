module test_inst (
    input wire [1:0] a,
    input wire [1:0] b,

    output wire [1:0] o_and,
    output wire [1:0] o_or,
    output wire [2:0] sum
);

assign o_and = a & b;
assign o_or = a | b;
assign sum = a + b;
    
endmodule