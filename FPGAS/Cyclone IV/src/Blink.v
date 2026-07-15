module Blink (
    input clk,    // Clock de la FPGA (generalmete 50 Mhz)
	 
    output led    // Pin del led
);

    reg [24:0] contador = 0; // Contador de 25 Bits
	 assign led = contador[24]; // Asignamos el led a el contador para que parpadee

    always @(posedge clk) begin
        contador <= contador + 1'b1;
    end
   
endmodule