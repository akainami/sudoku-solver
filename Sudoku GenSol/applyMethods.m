function [STRUCT,dummyProblem] = applyMethods(dummyProblem, STRUCT)
% Integrate Methods here
global M1 M2 M3 M4 iterBool
if iterBool == true
    if M1
        dummyProblem = method_1(dummyProblem, STRUCT);
    end
    if M2
        dummyProblem = method_2(dummyProblem, STRUCT); % WIP
    end
    if M3
        dummyProblem = method_3(dummyProblem, STRUCT);
    end
else
    if M4
        dummyProblem = method_4(dummyProblem, STRUCT);
    end
end
end

