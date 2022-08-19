function dummyProblem = method_2(dummyProblem, SUDOKU_STRUCT)
cellrows = 1 : SUDOKU_STRUCT.CELL_DIM_X;
cellcolumns = 1 : SUDOKU_STRUCT.CELL_DIM_Y;

for k = SUDOKU_STRUCT.INTERVAL
    for i = 1 : SUDOKU_STRUCT.RANGE
        for j = 1 : SUDOKU_STRUCT.RANGE
            holder = dummyProblem(i,j,k);
            if ~isnan(holder)
                [extrDummy,iArr, jArr] = extractCell(i,j,SUDOKU_STRUCT,dummyProblem(:,:,k));
                % Check Rows
                inCelli = i - SUDOKU_STRUCT.CELL_DIM_X*(max(iArr)/...
                    SUDOKU_STRUCT.CELL_DIM_X-1);
                if sum(sum(isnan(extrDummy(cellrows( cellrows ~= inCelli),:)))) == ...
                        SUDOKU_STRUCT.CELL_DIM_X*(SUDOKU_STRUCT.CELL_DIM_Y-1)
                    dummyProblem(i,:,k) = NaN;
                    dummyProblem(iArr,jArr,k) = extrDummy;
                end
                % Check Columns
                
                inCellj = j - SUDOKU_STRUCT.CELL_DIM_Y*(max(jArr)/...
                    SUDOKU_STRUCT.CELL_DIM_Y-1);
                if sum(sum(isnan(extrDummy(:, cellcolumns(cellcolumns ~= inCellj))))) == ...
                        SUDOKU_STRUCT.CELL_DIM_Y*(SUDOKU_STRUCT.CELL_DIM_X-1)
                    dummyProblem(:,j,k) = NaN;
                    dummyProblem(iArr,jArr,k) = extrDummy;
                end
            end
        end
    end
end
end