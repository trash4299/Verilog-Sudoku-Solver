module sudoku_v(enter,out);
	input [323:0] enter;
	output [323:0] out;
	
	reg [8:0] maybes [0:8][0:8];
	reg finals [0:8][0:8];
	integer MC,x,y;
	
	initial begin
		integer i,k;
		for(i = 0; i < 9; i = i + 1) begin : row
			for(k = 0; k < 9; k = k + 1) begin : column
				reg[8:0] temp;
				//make a case statement setting up possibilities for enter[4*(i*9+k):4*(i*9+k)+3];
			end
		end
		x <= 0;
		y <= 0;
		MC <= 0;
	end
	
	
	always begin
		if(MC == 0) begin
			
			//for loop with all checking tasks
			
			
			
			integer n, i, g;
			n <= 0;
			for(i = 0; i < 9; i = i + 1) begin
				for(g = 0; g < 9; g = g + 1) begin
					if(finals[i][g] == 0)
						n <= n + 1;
				end
			end
			if (n == 81)
				MC <= 1; //this might not work
			else
				MC <= 0;
		end
		
		else if(MC == 1) begin
			//assign out pins using finnum task
		end
	end
	
	
	//setfinal task
	task setFinal; begin
		if(finals[x][y] == 0) begin
			integer jello, i;
			jello <= 0;
			for(i = 0; i < 9; i = i + 1) begin
				if(maybes[x][y][i] == 1)
					jello <= jello + 1;
			end
			if(jello == 1)
				finals[x][y] <= 1;
		end
	end
	endtask

	//rowchecker task
	task rowChecker; begin
		integer f;
		for(f = 0; f < 9; f = f + 1) begin
			if(f != y) begin
				if(finals[x][f] == 1) begin
					case(f) //figure out how to find the finnum
						4'b0000 : break;
						4'b0001 : if(maybes[x][y][0] == 1) maybes[x][y][0] <= 0;
						4'b0010 : if(maybes[x][y][1] == 1) maybes[x][y][1] <= 0;
						4'b0011 : if(maybes[x][y][2] == 1) maybes[x][y][2] <= 0;
						4'b0100 : if(maybes[x][y][3] == 1) maybes[x][y][3] <= 0;
						4'b0101 : if(maybes[x][y][4] == 1) maybes[x][y][4] <= 0;
						4'b0110 : if(maybes[x][y][5] == 1) maybes[x][y][5] <= 0;
						4'b0111 : if(maybes[x][y][6] == 1) maybes[x][y][6] <= 0;
						4'b1000 : if(maybes[x][y][7] == 1) maybes[x][y][7] <= 0;
						4'b1001 : if(maybes[x][y][8] == 1) maybes[x][y][8] <= 0;
					endcase
				end
			end
		end
	end
	endtask


	//colchecker task
	task colChecker; begin
		integer f;
		for(f = 0; f < 9; f = f + 1) begin
			if(f != x) begin
				if(finals[f][y] == 1) begin
					case(f) //figure out how to find the finnum
						4'b0000 : break;
						4'b0001 : if(maybes[x][y][0] == 1) maybes[x][y][0] <= 0;
						4'b0010 : if(maybes[x][y][1] == 1) maybes[x][y][1] <= 0;
						4'b0011 : if(maybes[x][y][2] == 1) maybes[x][y][2] <= 0;
						4'b0100 : if(maybes[x][y][3] == 1) maybes[x][y][3] <= 0;
						4'b0101 : if(maybes[x][y][4] == 1) maybes[x][y][4] <= 0;
						4'b0110 : if(maybes[x][y][5] == 1) maybes[x][y][5] <= 0;
						4'b0111 : if(maybes[x][y][6] == 1) maybes[x][y][6] <= 0;
						4'b1000 : if(maybes[x][y][7] == 1) maybes[x][y][7] <= 0;
						4'b1001 : if(maybes[x][y][8] == 1) maybes[x][y][8] <= 0;
					endcase
				end
			end
		end
	end
	endtask
	
	//final number finder task with x y inputs
	//should extract it from possibilities
	
	
	
	
	//squarechecker task
	//	task squareChecker; begin
		
		
		
		
	//         end
	//         endtask

	//rowpossibilities ??
	//colpossibilities ??
	//horiEightNine ??
	//vertEightNine ?? 
		
			
endmodule 
