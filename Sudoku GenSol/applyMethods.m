function [STRUCT,dummyProblem] = applyMethods(dummyProblem, STRUCT)
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

