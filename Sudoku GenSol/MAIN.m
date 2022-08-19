clc; clear all; close; tic;
% Sudoku Solver v0.3.22_0406
%{
BY ATAKAN OZTURK, KARABUK
 == SUDOKU SOLVER ==
 - Can solve 2-D Grids
 - Solves for INTERVAL values
 - Can solve for different cell dimensions
%}

%% Puzzle Settings
INTERVAL = 1 : 9;  % Puzzle Range i.e. numbers in range 1-9
CELL_DIM_X = 3; % Cell size by rows
CELL_DIM_Y = 3; % Cell size by columns

SUDOKU_STRUCT = struct('INTERVAL',INTERVAL,...
    'RANGE',length(INTERVAL),...
    'CELL_DIM_X',CELL_DIM_X,...
    'CELL_DIM_Y',CELL_DIM_Y,...
    'PROBLEM',table2array(readtable('sudoku.csv')));

%% Solver Settings
% M# represents methods, shortens iterations
% but may increase computation time

global M1 M2 M3 M4 iterBool;
M1 = true; % Cell-Alone Removal
M2 = true; % Vector-wise Removal on row/column
M3 = true; % Depth-Estimation-Cell-Alone Removal
M4 = false; % Random Estimator

%% Solver
sizeCase = size(SUDOKU_STRUCT.PROBLEM);
dummyProblem = NaN(sizeCase(1),sizeCase(2),SUDOKU_STRUCT.RANGE);
oldDummy = dummyProblem;
iterBool = true;
iter = 1;
while (iterBool)
    %% Make estimations
    dummyProblemRaw = makeEstimate(SUDOKU_STRUCT, dummyProblem);
    
    %% Split dummyProblem by numbers
    dummyProblem = dummySplit(dummyProblemRaw, SUDOKU_STRUCT);
    
    %% Remove estimations
    [SUDOKU_STRUCT,dummyProblem] = applyMethods(dummyProblem, SUDOKU_STRUCT);
    
    %% Replace estimations
    [SUDOKU_STRUCT,dummyProblem] = singleEstimate(SUDOKU_STRUCT, dummyProblem);
    
    %% Break
    if isequal(dummyProblem(~isnan(dummyProblem)),oldDummy(~isnan(oldDummy)))
        fprintf('First Phase Stuck, Beginning Iteration. \n');
        iterBool = false;
        break
    end
    if nancount(SUDOKU_STRUCT.PROBLEM) == 0
        fprintf('Solved! \n');
        break
    end
    
    %% Record section
    oldDummy = dummyProblem;
    iter = iter + 1;
    
end

%% Final Method
[SUDOKU_STRUCT,dummyProblem] = applyMethods(dummyProblem, SUDOKU_STRUCT);

%% Make it App!

% deploytool

%% Termination
clearvars -except SUDOKU_STRUCT;