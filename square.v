module square(first,load,possibilities,fin,finnum);
	input[13:0] first;
	input load;
	output reg[8:0] possibilities;
	output reg fin;
	output reg[3:0] finnum;
	
	
always@(load)
	if(load == 1)
		begin
		finnum = first[13:10];
		fin = first[9];
		possibilities = first[8:0];
		end
endmodule 