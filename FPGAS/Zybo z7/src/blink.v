`timescale 1ns / 1ps
module blink(
    input clk,
    output reg[2:0] led_rgb
    );
    
integer contador = 0;

always @(posedge  clk)

    begin
    if (contador >= 320000000)
        contador <= 0;
    else
        contador <= contador + 1;   
    end

always @(posedge  clk)
    
    begin
    if (contador == 0)
        led <= 3'b001;//Rojo

    else if (contador == 80000000)
        led <= 3'b011;//Amarillo

    else if (contador == 160000000)
        led <= 3'b010;//Verde

    else if (contador == 240000000)
        led <= 3'b011;//Amarillo
    end
    
endmodule