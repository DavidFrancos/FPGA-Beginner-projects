module uart_comm (
    input wire clk,
    output reg tx
);

reg [23:0] timer = 0;
reg [7:0] letter [5:0];
initial  begin
    tx = 1;
    letter[0] = "H";
    letter[1] = "e";  
    letter[2] = "l";  //01100010
    letter[3] = "l";  
    letter[4] = "o";    
    letter[5] = "\n";
end
reg start = 1;
reg stop = 0;
reg [3:0] sending = 0;
reg [2:0] index = 0;

always @(posedge clk) begin
    timer <= timer + 1;
    if (timer >= 104) begin
        timer <= 0;
        if (index == 6) tx <= 1;
        else if (start) begin
            tx <= 0;  
            start <= 0;
        end
        else if (stop) begin    
            stop <= 0;
            sending <= 0;
            start <= 1;
        end
        else begin
            if (sending < 8) begin
                tx <= letter[index][0];  
                letter[index] <= letter[index] >> 1;
                sending <= sending + 1;
            end
            else begin
                stop <= 1;
                tx <= 1;
                index <= index + 1;
            end
        end
    end
end

endmodule