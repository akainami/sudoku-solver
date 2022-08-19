function OUT = sudEstimate(SUDOKU_STRUCT,i,j)

OUT = nan(1,SUDOKU_STRUCT.RANGE);

% Extract Cells & Columns & Rows
iCell = ceil(i/SUDOKU_STRUCT.CELL_DIM_Y);
jCell = ceil(j/SUDOKU_STRUCT.CELL_DIM_X);
extrCell = SUDOKU_STRUCT.PROBLEM((iCell-1)*SUDOKU_STRUCT.CELL_DIM_Y+(1:SUDOKU_STRUCT.CELL_DIM_Y),...
    (jCell-1)*SUDOKU_STRUCT.CELL_DIM_X+(1:SUDOKU_STRUCT.CELL_DIM_X));

extrCellVec = reshape(extrCell,1,[]);
extrRow = SUDOKU_STRUCT.PROBLEM(i,:);
extrCol = SUDOKU_STRUCT.PROBLEM(:,j);

% Find missing values of extracted arrays
subtrCellVec = setxor(SUDOKU_STRUCT.INTERVAL, intersect(SUDOKU_STRUCT.INTERVAL,extrCellVec));
subtrRow = setxor(SUDOKU_STRUCT.INTERVAL, intersect(SUDOKU_STRUCT.INTERVAL,extrRow));
subtrCol = setxor(SUDOKU_STRUCT.INTERVAL, intersect(SUDOKU_STRUCT.INTERVAL,extrCol));

% Find common values of extracted arrays -> intersect()
first_intersect = intersect(subtrCol,subtrRow);
second_intersect = intersect(first_intersect, subtrCellVec);

% Replace to OUT
OUT(1:length(second_intersect)) = second_intersect;
end