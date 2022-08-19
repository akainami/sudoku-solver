function dummyProblem = method_3(dummyProblem, SUDOKU_STRUCT)
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