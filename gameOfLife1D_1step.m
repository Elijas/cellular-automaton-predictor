function cellsOut = gameOfLife1D_1step(rule, cellsIn)
gridSize = size(cellsIn, 2);
noOfGrids = size(cellsIn, 1);

cellsIn = [zeros(noOfGrids,1) cellsIn zeros(noOfGrids,1)]; %Prepare for edge cases
cellsOut = [];

for i=1:noOfGrids
    for j=1:gridSize
        cellsOut(i,j) = dec2binvec(rule,8)(8-(cellsIn(i,j)*4+cellsIn(i,j+1)*2+cellsIn(i,j+2)));
    endfor
endfor

endfunction

