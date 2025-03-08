module binary_timer (
    input wire clk,
    output reg led0,led1,led2);

reg [23:0] clkCounter = 0;
reg [2:0] secCounter = 0;

always @(posedge clk) begin
    clkCounter <= clkCounter+1;
    if (clkCounter == 24'd11999999) begin
        clkCounter <= 0;
        secCounter <= secCounter>7? 0:secCounter+1; 
    end
    {led2,led1,led0} <= secCounter;
end

endmodule