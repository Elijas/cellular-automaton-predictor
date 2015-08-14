function [X_train, Y_train, X_test, Y_test] = step1_generate_samples
addpath('qo') % 'dec2binvec' function

noOfTrainingSamples = 2000;
gridSize            = 16;

%generator = @(cells_in) gameOfLife1D_1step(45, cells_in);
generator = @(cells_in) gameOfLife2D_1step(cells_in);

X_train = rand(noOfTrainingSamples, gridSize) > 0.5;
Y_train = generator(X_train);

% EXHAUSTIVE test
if false,
X_test = [];
for i=0:2^gridSize-1
    X_test = [X_test; dec2binvec(i, gridSize)];
endfor
endif
% RANDOM and CYCLED test
if true,
noOfRandTestSamples = 200;
noOfLoopTestSamples = 200;
X_test = rand(noOfRandTestSamples, gridSize) > 0.5;
for i=1:noOfLoopTestSamples
    X_test = [X_test; generator(X_test(end,:))];
endfor
endif
Y_test = generator(X_test);

save step1.out X_train Y_train X_test Y_test

endfunction

