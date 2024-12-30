`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Anjan Prasad
// Create Date: 10/20/2024 09:05:21 PM
// Module Name: tb
//////////////////////////////////////////////////////////////////////////////////


module tb;
reg Clk =0  ;  
reg Rst_n;
reg Rx ;
wire Tx;
wire [7:0] RxData;
UART_master DUT(Clk,Rst_n,Rx,Tx,RxData);
always #5 Clk=~Clk;
initial begin
Rst_n =0;Rx=0;




/* trying 1st Number */
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;



/* trying 2nd Number */
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;




/* trying 3rd Number */
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=0;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;
#104000 Rst_n =1;Rx=1;


#100 $finish;


end

endmodule
