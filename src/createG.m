function [ G ] = createG( H, I, radius )
%CREATEG Create G[1x16 x 32x32] matricies
%   Detailed explanation goes here

    numberOfMasks = size(H, 2);
    
    % this is temporary mock code:
    imageHeight = size(I, 1);
    imageWidth = size(I, 2);
    G(1,numberOfMasks, imageHeight - radius*2,imageWidth - radius*2) = 0; % mock

end

