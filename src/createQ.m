function [ Q ] = createQ( I, G )
%CREATEQ Create Q[1x16 x 32x32] matrix from I[36x36] and G[1x16 x 36x36] matrix
%   Detailed explanation goes here

    % G matrix should be truncated here by functon l()
    % 
    masksNumber = size(G,2);
    
    Q(1,masksNumber, size(G,3),size(G,4)) = 0; % mock

end
