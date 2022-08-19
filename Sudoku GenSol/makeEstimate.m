function [dummyProblem] = makeEstimate(SUDOKU_STRUCT,dummyProblem)
sizeDummy = size(dummyProblem);
for i = 1 : sizeDummy(1)
    for j = 1 : sizeDummy(2)
        if isnan(SUDOKU_STRUCT.PROBLEM(i,j))
            % Estimations for i,j nodes
            est = sudEstimate(SUDOKU_STRUCT,i,j);
            dummyProblem(i,j,:) = est;
        end
    end
end
end

