function main(stepNo=0)
addpath(genpath(pwd))
load step1.out
load step2.out

if (stepNo==1 || stepNo==0)
    [X_train, Y_train, X_test, Y_test] = step1_generate_samples; endif
if (stepNo==2 || stepNo==0)
    [nn_params, nn_lsizes] = step2_train_nn(X_train, Y_train); endif
if (stepNo==3 || stepNo==0)
    [accuracy, is_perfect] = step3_test_nn(X_test, Y_test, nn_params, nn_lsizes); endif

endfunction

