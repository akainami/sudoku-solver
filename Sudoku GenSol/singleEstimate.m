function [SUDOKU_STRUCT,dummyProblem] = singleEstimate(SUDOKU_STRUCT,dummyProblem)
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

