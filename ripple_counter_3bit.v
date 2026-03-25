module ripple_counter_3bit (
    input external_clk,
    input reset,
    output [2:0] q
);
    // First Flip-Flop (LSB) - Driven by external clock
    tff tf0 (.clk(external_clk), .reset(reset), .q(q[0]));

    // Second Flip-Flop - Driven by the output of the first
    tff tf1 (.clk(q[0]),         .reset(reset), .q(q[1]));

    // Third Flip-Flop (MSB) - Driven by the output of the second
    tff tf2 (.clk(q[1]),         .reset(reset), .q(q[2]));

endmodule