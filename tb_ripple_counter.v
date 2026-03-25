module tb_ripple_counter;
    reg clk;
    reg reset;
    wire [2:0] q;

    // Instantiate the counter
    ripple_counter_3bit uut (
        .external_clk(clk),
        .reset(reset),
        .q(q)
    );

    // Generate Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0; // Release reset
        
        #200 $finish; // Run for enough time to see the full count
    end

    initial begin
        $monitor("Time=%0t | Reset=%b | Count(QC QB QA)=%b (%0d)", $time, reset, q, q);
    end
endmodule