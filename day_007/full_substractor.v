/* Full Substractor */

module full_substractor( 
   input X,Y,Bin, 
   output D,Bout);
	assign Bout = (~X && Y)||(~X && Bin)||(Y && Bin);
	assign D = (X ^ Y ^  Bin);
	endmodule