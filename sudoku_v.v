module sudoku_v(enter,out);
	input [323:0] enter;
	output [323:0] out;
	
	reg [8:0] maybes [0:8][0:8];
	integer MC,x,y;
	
	initial begin
		x <= 0;
		y <= 0;
		MC <= 0;
	end
	
	
	always begin
		if(MC == 0) begin
			integer i,k;
			for(i = 0; i < 9; i = i + 1) begin : row
				for(k = 0; k < 9; k = k + 1) begin : column
					integer ex, why;
					ex = 4*(i*9+k);
					why = 4*(i*9+k)+3;
					case(enter[ex:why])
					4'b0000 : maybes[i][k] <= "111111111";
					4'b0001 : maybes[i][k] <= "000000001";
					4'b0010 : maybes[i][k] <= "000000010";
					4'b0011 : maybes[i][k] <= "000000100";
					4'b0100 : maybes[i][k] <= "000001000";
					4'b0101 : maybes[i][k] <= "000010000";
					4'b0110 : maybes[i][k] <= "000100000";
					4'b0111 : maybes[i][k] <= "001000000";
					4'b1000 : maybes[i][k] <= "010000000";
					4'b1001 : maybes[i][k] <= "100000000";
					endcase
			end
		end
		end
		
		else if(MC == 1) begin
			
			//for loop with all checking tasks
			
			
			
			integer n, i, g;
			n <= 0;
			for(i = 0; i < 9; i = i + 1) begin
				for(g = 0; g < 9; g = g + 1) begin
					if(isFinal(i,g) == 0)
						n <= n + 1;
				end
			end
			if (n == 81)
				MC <= 2; //this might not work
			else
				MC <= 1;
		end
		
		else if(MC == 2) begin
			//assign out pins using finnum task
		end
		
	end

	//rowchecker task
	task rowChecker; begin
		integer f;
		for(f = 0; f < 9; f = f + 1) begin
			if(f != y) begin
				if(isFinal(x,f) == 1) begin
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
				if(isFinal(f,y) == 1) begin
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
	
	//isFinal function
	function isFinal;
		input [3:0] x;
		input [3:0] y;
		integer count, f;
		begin
			count = 0;
			for(f = 0; f < 9; f = f + 1) begin
				if(maybes[x][y][f] == 1)
					count = count + 1;
			end
			if (count == 1)
				isFinal = 1;
			else
				isFinal = 0;
		end
	endfunction
	
	
	
	//squarechecker task
	//	task squareChecker; begin
		
		
		
		
	//         end
	//         endtask

	//rowpossibilities ??
	//colpossibilities ??
	//horiEightNine ??
	//vertEightNine ?? 
		
			
endmodule 
