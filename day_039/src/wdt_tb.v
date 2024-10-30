`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/30/2024 07:31:00 AM
// Module Name: wdt_tb
//////////////////////////////////////////////////////////////////////////////////


module wdt_tb;

reg clock=0, resetn=1, pet=0;
wire timeout;
watchdog_timer_ WDT(clock, resetn, pet, timeout);

  always clock=#5 ~clock;
  task reset; 
    begin 
    #10;
    resetn=0; 
    #10; 
    resetn=1; 
    end 
  endtask 
initial begin
    reset; #320; pet=1; 
    #10; 
    pet=0; 

    #250;
    pet=1; #10;
    $finish; 
end

endmodule
