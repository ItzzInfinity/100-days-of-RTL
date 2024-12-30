module UART_rs232_tx (Clk,Rst_n,TxEn,TxData,TxDone,Tx,Tick,NBits);	

input Clk, Rst_n, TxEn,Tick;	
input [3:0]NBits;		
input [7:0]TxData;		

output Tx;
output TxDone;


parameter  IDLE = 1'b0, WRITE = 1'b1;	
reg  State, Next;			
reg  TxDone = 1'b0;			
reg  Tx;				
reg write_enable = 1'b0;					
reg start_bit = 1'b1;			
reg stop_bit = 1'b0;			
reg [4:0] Bit = 5'b00000;		
reg [3:0] counter = 4'b0000;
reg [7:0] in_data=8'b00000000;	
reg [1:0] R_edge;			
wire D_edge;				

always @ (posedge Clk or negedge Rst_n)			
begin
if (!Rst_n)	State <= IDLE;				
else 		State <= Next;				
end

always @ (State or D_edge or TxData or TxDone) 
begin
    case(State)	
	IDLE:	if(D_edge)		Next = WRITE;		
		else			Next = IDLE;
	WRITE:	if(TxDone)		Next = IDLE;  
		else			Next = WRITE;
	default 			Next = IDLE;
    endcase
end

always @ (State)
begin
    case (State)
	WRITE: begin
		write_enable <= 1'b1;	
	end
	
	IDLE: begin
		write_enable <= 1'b0;	
	end
    endcase
end

always @ (posedge Tick)
begin

	if (!write_enable)				
	begin
	TxDone = 1'b0;
	start_bit <=1'b1;
	stop_bit <= 1'b0;
	end

	if (write_enable)				
	begin
	counter <= counter+1;				
	
	
	if(start_bit & !stop_bit)
	begin
	Tx <=1'b0;					
	in_data <= TxData;				
	end		

	if ((counter == 4'b1111) & (start_bit) )	
	begin		
	start_bit <= 1'b0;
	in_data <= {1'b0,in_data[7:1]};
	Tx <= in_data[0];
	end


	if ((counter == 4'b1111) & (!start_bit) &  (Bit < NBits-1))	
	begin		
	in_data <= {1'b0,in_data[7:1]};
	Bit<=Bit+1;
	Tx <= in_data[0];
	start_bit <= 1'b0;
	counter <= 4'b0000;
	end	

	if ((counter == 4'b1111) & (Bit == NBits-1) & (!stop_bit))	
	begin
	Tx <= 1'b1;	
	counter <= 4'b0000;	
	stop_bit<=1'b1;
	end

	if ((counter == 4'b1111) & (Bit == NBits-1) & (stop_bit) )	
	begin
	Bit <= 4'b0000;
	TxDone <= 1'b1;
	counter <= 4'b0000;
	//start_bit <=1'b1;
	end
	
	end
		

end

always @ (posedge Clk or negedge Rst_n)
begin

	if(!Rst_n)
	begin
	R_edge <= 2'b00;
	end
	
	else
	begin
	R_edge <={R_edge[0], TxEn};
	end
end
assign D_edge = !R_edge[1] & R_edge[0];

endmodule
