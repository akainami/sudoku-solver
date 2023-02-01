function [SUDOKU_STRUCT,dummyProblem] = singleEstimate(SUDOKU_STRUCT,dummyProblem)
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
sizeDummy = size(dummyProblem);
for i = 1 : sizeDummy(1)
    for j = 1 : sizeDummy(2)
        if isnan(SUDOKU_STRUCT.PROBLEM(i,j))
            % Replace single estimations to the main grid
            if nancount(dummyProblem(i,j,:)) == 8
                est = reshape(dummyProblem(i,j,:),[],1);
                SUDOKU_STRUCT.PROBLEM(i,j) = rmmissing(est);
                dummyProblem(i,j,SUDOKU_STRUCT.PROBLEM(i,j)) = NaN;
            end
        end
    end
end
end

