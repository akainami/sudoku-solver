clc; clear all; close; tic;
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
