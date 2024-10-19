module demux_2_to_1(

input a,
input sel,
output y1,y2
  );
//  assign y1 = a &  sel;
//  assign y2 = a & ~sel;
 assign {y1,y2} = sel?{1'b0,a}: {a,1'b0};
endmodule