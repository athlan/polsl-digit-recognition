function [ F ] = createF( Q, v_x, v_y, u_x, u_y, fi, fillEmptyCellsValue)
%CREATEF Create features F[1x16 x 9x9] matrixies
%   Detailed explanation goes here

    masksNumber = size(Q,2);
    
    matrixF_x = floor((size(Q,3) - v_x - 1) / u_x);
    matrixF_y = floor((size(Q,3) - v_y - 1) / u_y);
    
    F(1,masksNumber, matrixF_x,matrixF_y) = 0;

end
