function cellsOut = gameOfLife2D_1step(cellsIn) 
% Note: Only rectangular matrices given as horizontal vectors are supported
gridSideLength = sqrt(size(cellsIn, 2));
noOfGrids = size(cellsIn, 1);

cellsOut = [];

for i=1:noOfGrids
    gridOut = [];

    grid = reshape(cellsIn(i,:), gridSideLength, gridSideLength);
    grid = [zeros(size(grid,1),1) grid zeros(size(grid,1),1)];
    grid = [zeros(1,size(grid,2));grid;zeros(1,size(grid,2))];

    for j=1:gridSideLength
        for k=1:gridSideLength
            neighbourNo = ...
                grid(j,k)   +  grid(j,k+1)   + grid(j,k+2)   + ...
                grid(j+1,k) +                + grid(j+1,k+2) + ...
                grid(j+2,k) +  grid(j+2,k+1) + grid(j+2,k+2);
            if (neighbourNo < 2 || neighbourNo > 3)
                gridOut(j,k) = 0;
            else
                gridOut(j,k) = 1;
            endif;
        endfor
    endfor

    cellsOut = [cellsOut; gridOut(:)'];
endfor

endfunction
