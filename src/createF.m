function [ F ] = createF( Q, windowSize_x, windowSize_y, fi )
%CREATEF Create features F[1x16 x 9x9] matrixies
%   Detailed explanation goes here

    masksNumber = size(Q,2);
    F(1,masksNumber, 1,1) = 0;

end
