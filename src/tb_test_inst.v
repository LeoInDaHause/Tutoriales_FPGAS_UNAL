`timescale 1ns/1ns
`include "test_inst.v"

module tb_test_inst;

    reg [1:0] a, b;
    wire [1:0] o_and, o_or;
    wire [2:0] sum;

    test_inst dut (
        .a(a),
        .b(b),
        .o_and(o_and),
        .o_or(o_or),
        .sum(sum)
    );

    // Pruebas
    initial begin
        // Generacion de Ondas
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_test_inst);

        // Test case 1: a=0, b=0
        a = 2'b00;
        b = 2'b00;
        #10;
        
        // Test case 2: a=0, b=1
        a = 2'b00;
        b = 2'b01;
        #10;
        
        // Test case 3: a=1, b=0
        a = 2'b01;
        b = 2'b00;
        #10;
        
        // Test case 4: a=1, b=1
        a = 2'b01;
        b = 2'b01;
        #10;

        // Finish simulation
        $finish;
    end

endmodule