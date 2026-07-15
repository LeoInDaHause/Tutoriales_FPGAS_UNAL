`include "./blink.v"

module top (
    // 25MHz clock input
    input  clk, // Unimos el clk con el nombre que esta en pcf

    // Led output
    output red_led // 
);

  blink my_blink (
      .clk(clk),
      .led(led)
  );

endmodule
