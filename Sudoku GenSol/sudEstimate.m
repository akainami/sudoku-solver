function OUT = sudEstimate(SUDOKU_STRUCT,i,j)
%{
MIT License

Copyright (c) 2022 Atakan Öztürk

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
%}
OUT = nan(1,SUDOKU_STRUCT.RANGE);

% Extract Cells & Columns & Rows
iCell = ceil(i/SUDOKU_STRUCT.CELL_DIM_Y);
jCell = ceil(j/SUDOKU_STRUCT.CELL_DIM_X);
extrCell = SUDOKU_STRUCT.PROBLEM((iCell-1)*SUDOKU_STRUCT.CELL_DIM_Y+(1:SUDOKU_STRUCT.CELL_DIM_Y),...
    (jCell-1)*SUDOKU_STRUCT.CELL_DIM_X+(1:SUDOKU_STRUCT.CELL_DIM_X));

extrCellVec = reshape(extrCell,1,[]);
extrRow = SUDOKU_STRUCT.PROBLEM(i,:);
extrCol = SUDOKU_STRUCT.PROBLEM(:,j);

% Find missing values of extracted arrays
subtrCellVec = setxor(SUDOKU_STRUCT.INTERVAL, intersect(SUDOKU_STRUCT.INTERVAL,extrCellVec));
subtrRow = setxor(SUDOKU_STRUCT.INTERVAL, intersect(SUDOKU_STRUCT.INTERVAL,extrRow));
subtrCol = setxor(SUDOKU_STRUCT.INTERVAL, intersect(SUDOKU_STRUCT.INTERVAL,extrCol));

% Find common values of extracted arrays -> intersect()
first_intersect = intersect(subtrCol,subtrRow);
second_intersect = intersect(first_intersect, subtrCellVec);

% Replace to OUT
OUT(1:length(second_intersect)) = second_intersect;
end
