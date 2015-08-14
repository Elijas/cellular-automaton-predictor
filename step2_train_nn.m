function [nn_params, nn_lsizes] = step2_train_nn(X,y)
addpath('nn')

nn_lambda = 0.00001;
nn_lsizes = [size(X,2) 50 50 size(y,2)];
nn_options = optimset('MaxIter', 4000);
nn_params = fmincg(@(p) nnCostFunction(p, nn_lsizes, X, y, nn_lambda), nnInitParams(nn_lsizes), nn_options);

save step2.out nn_lsizes nn_params

endfunction

