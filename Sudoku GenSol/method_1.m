% 
function dummyProblem = method_1(dummyProblem, SUDOKU_STRUCT)
for i = 1 : SUDOKU_STRUCT.CELL_DIM_X
    for j = 1 : SUDOKU_STRUCT.CELL_DIM_Y
        for k = SUDOKU_STRUCT.INTERVAL
            extrCell = extractCell(i,j,SUDOKU_STRUCT,SUDOKU_STRUCT.PROBLEM);
            extrCell(isnan(extrCell)) = 0;
            if length(find(extrCell)) == 1
                [row,col]=find(extrCell);
                dummyProblem(...
                    (i-1)*SUDOKU_STRUCT.CELL_DIM_Y+row,...
                    (j-1)*SUDOKU_STRUCT.CELL_DIM_X+col,:)...
                    = NaN;
                dummyProblem(...
                    (i-1)*SUDOKU_STRUCT.CELL_DIM_Y+row,...
                    (j-1)*SUDOKU_STRUCT.CELL_DIM_X+col,k)...
                    = k;
            end
        end
    end
end
end