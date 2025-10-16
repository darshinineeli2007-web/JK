module jkflipflop (
    input J, K, clk, reset,
    output reg Q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        Q <= 1'b0;             // Asynchronous reset
    else begin
        if (J == 0 && K == 0)
            Q <= Q;             // No change
        else if (J == 0 && K == 1)
            Q <= 1'b0;          // Reset
        else if (J == 1 && K == 0)
            Q <= 1'b1;          // Set
        else if (J == 1 && K == 1)
            Q <= ~Q;            // Toggle
    end
end

endmodule
