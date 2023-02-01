function dummyProblem = method_3(dummyProblem, SUDOKU_STRUCT)
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
for k = SUDOKU_STRUCT.INTERVAL
    for i = 1 : SUDOKU_STRUCT.RANGE
        for j = 1 : SUDOKU_STRUCT.RANGE
            holder = dummyProblem(i,j,k);
            if ~isnan(holder)
                [extrDummy,~,~] = extractCell(i,j,SUDOKU_STRUCT,dummyProblem(:,:,k));
                if sum(sum(isnan(extrDummy))) == SUDOKU_STRUCT.CELL_DIM_X*SUDOKU_STRUCT.CELL_DIM_Y-1
                    dummyProblem(i,j,:) = NaN;
                    dummyProblem(i,j,k) = k;
                end
            end
        end
    end
end
end
