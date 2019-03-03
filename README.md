# Verilog-Sudoku-Solver

Verilog sudoku solver based on my non-recursive Java sudoku solver. To begin, I need to decide how to setup the data. Do I want to do a single vector that is 81 cells times the bit length long or do I try to figure out how to do 2D arrays. I am using Quartus and the software requires using the specifications of a device. However, I am not very familiar with the limitations of this software so it might take longer to research everything I need to do.

With my non recursive, each Square had 9 booleans for possible numbers, a final number, and another boolean saying if it was final. The booleans can be 1 bit long and the final numbers only go up to nine so 4 bits long.
