function [OUT] = dummySplit(dummyProblem,SUDOKU_STRUCT)
OUT = nan(SUDOKU_STRUCT.RANGE,SUDOKU_STRUCT.RANGE,SUDOKU_STRUCT.RANGE);
for k = SUDOKU_STRUCT.INTERVAL
    K = sum(dummyProblem == k,3); % Sum through 3rd dimension
    OUT(:,:,k) = K*k;
end
OUT(OUT == 0) = NaN;
end

