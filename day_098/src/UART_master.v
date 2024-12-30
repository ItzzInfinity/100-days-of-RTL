module UART_master(
    	Clk,
    	Rst_n,   
    	Rx,    
    	Tx,
	    RxData,
	); 

/////////////////////////////////////////////////////////////////////////////////////////
input           Clk             ; 
input           Rst_n           ; 
input           Rx              ; 
output          Tx              ; 
output [7:0]    RxData          ; 
/////////////////////////////////////////////////////////////////////////////////////////
wire [7:0]    	TxData     	; 
wire          	RxDone      ; 
wire          	TxDone      ; 
wire            tick			  ; 
wire          	TxEn        ;
wire 				    RxEn			  ;
wire [3:0]      NBits    	  ;
wire [15:0]   	BaudRate    ; 

assign 		RxEn = 1'b1	;
assign 		TxEn = 1'b1	;
assign 		BaudRate = 16'd325; 	//baud rate set to 9600 
assign 		NBits = 4'b1000	;	





/////////////////////////////////////////////////////////////////////////////////////////

UART_rs232_rx I_RS232RX(
    	.Clk(Clk)             	,
   	    .Rst_n(Rst_n)         ,
    	.RxEn(RxEn)           	,
    	.RxData(RxData)       	,
    	.RxDone(RxDone)       	,
    	.Rx(Rx)               	,
    	.Tick(tick)           	,
    	.NBits(NBits)
    );














UART_rs232_tx I_RS232TX(
   	.Clk(Clk)            	,
    .Rst_n(Rst_n)         ,
    .TxEn(TxEn)           ,
    .TxData(TxData)      	,
   	.TxDone(TxDone)      	,
   	.Tx(Tx)               ,
   	.Tick(tick)           ,
   	.NBits(NBits)
    );

UART_BaudRate_generator I_BAUDGEN(
    	.Clk(Clk)               ,
    	.Rst_n(Rst_n)           ,
    	.Tick(tick)             ,
    	.BaudRate(BaudRate)
    );



endmodule


















