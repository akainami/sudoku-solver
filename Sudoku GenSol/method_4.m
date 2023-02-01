function dummyProblem = method_4(dummyProblem, SUDOKU_STRUCT)
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
for iN = 1 : SUDOKU_STRUCT.RANGE
    for jN = 1 : SUDOKU_STRUCT.RANGE
        if isnan(SUDOKU_STRUCT.PROBLEM(iN,jN))
            SUDOKU_STRUCT.PROBLEM(iN,jN) = 0;
        end
    end
end
SUDOKU_STRUCT.PROBLEM = trialerrorsolver(SUDOKU_STRUCT.PROBLEM);

%% Cell Estimator by Cleve Moller
function X = trialerrorsolver(X)
[C,s,e] = candidates(X);
while ~isempty(s) && isempty(e)
    X(s) = C{s};
    [C,s,e] = candidates(X);
end
% Return for impossible puzzles.
if ~isempty(e)
    return
end
% Recursive backtracking.
if any(X(:) == 0)
    Y = X;
    z = find(X(:) == 0,1);    % The first unfilled cell.
    for r = [C{z}]            % Iterate over candidates.
        X = Y;
        X(z) = r;              % Insert a tentative value.
        X = trialerrorsolver(X);         % Recursive call.
        if all(X(:) > 0)       % Found a solution.
            return
        end
    end
end
% ------------------------------
    function [C,s,e] = candidates(X)
        C = cell(9,9);
        tri = @(k) 3*ceil(k/3-1) + (1:3);
        for j = 1:9
            for i = 1:9
                if X(i,j)==0
                    z = 1:9;
                    z(nonzeros(X(i,:))) = 0;
                    z(nonzeros(X(:,j))) = 0;
                    z(nonzeros(X(tri(i),tri(j)))) = 0;
                    C{i,j} = nonzeros(z)';
                end
            end
        end
        L = cellfun(@length,C);   % Number of candidates.
        s = find(X==0 & L==1,1);
        e = find(X==0 & L==0,1);
    end % candidates
end % sudoku
fprintf('Solved! \n');
end

