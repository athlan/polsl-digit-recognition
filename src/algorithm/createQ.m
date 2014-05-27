function [ Q ] = createQ( I, G, radius )
%CREATEQ Create Q[32x32] matrix from I[36x36] and G[36x36] matrix
%   Detailed explanation goes here

    % G matrix should be truncated here by functon l()
    % 
    L = G;
    L(L<0)=0;
    tempTable = I.*L;
    Q = tempTable(1+ radius:size(tempTable,1)-radius,1+ radius:size(tempTable,2)-radius);

end
