module button_counter(
    input wire clk,
    input wire button,
    output reg led0,led1,led2,led3);


reg [2:0] counter = 0;


always@(posedge button) begin
    counter <= counter >= 7? 0:counter+1;
    {led2,led1,led0} <= counter;
end
endmodule