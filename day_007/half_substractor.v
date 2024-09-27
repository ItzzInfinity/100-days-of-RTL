/* Half Substractor */

module half_substractor ( 
   input X, 
   input Y, 
   output D,
	output Bout);
	assign Bout = ~X && Y;
	assign D = (X ^ Y);
	endmodule
