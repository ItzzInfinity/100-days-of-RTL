
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/30/2024 07:24:27 AM
// Module Name: watchdog_timer_
//////////////////////////////////////////////////////////////////////////////////


module watchdog_timer_ (clock, resetn, pet, timeout);
input clock,
resetn,
pet;
output reg timeout;
localparam PERIOD = 30;
reg [5:0] counter;
always @(posedge clock or negedge resetn)
     if(! resetn) begin counter <= PERIOD;
        timeout <= 1 'b0;
end

else begin 
 if (pet) begin
 timeout<=1'b0;
end
else if (counter == 0)
     timeout <= 1 'b1; 
else counter<=counter-1'b1;
     counter <= PERIOD;
end 
endmodule
