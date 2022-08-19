function [extractedCell,iArray, jArray] = extractCell(i,j,SUDOKU_STRUCT,ARRAY)
iCell = ceil(i/SUDOKU_STRUCT.CELL_DIM_Y);
jCell = ceil(j/SUDOKU_STRUCT.CELL_DIM_X);
iArray = (iCell-1)*SUDOKU_STRUCT.CELL_DIM_Y+1:iCell*SUDOKU_STRUCT.CELL_DIM_Y;
jArray = (jCell-1)*SUDOKU_STRUCT.CELL_DIM_X+1:jCell*SUDOKU_STRUCT.CELL_DIM_X;
extractedCell = ARRAY(iArray,jArray);
end