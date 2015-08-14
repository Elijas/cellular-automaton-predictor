function [accuracy, is_perfect] = step3_test_nn(X_test, Y_test, nn_params, nn_lsizes)
addpath('nn')

H_test = [];
for i=1:size(Y_test,1)
    H_test = [H_test; round(nnFeedForward(nn_params, nn_lsizes, X_test(i,:)))];
endfor

comparison = (Y_test==H_test)(:);
accuracy = mean(comparison)*100;
is_perfect = min(comparison);
printf("Accuracy: %.2f%% | Identical?: %d\n", accuracy, is_perfect);

endfunction

