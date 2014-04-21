function [ Q ] = createQ( I, G, radius )
%CREATEQ Create Q[32x32] matrix from I[36x36] and G[36x36] matrix
%   Detailed explanation goes here

    % G matrix should be truncated here by functon l()
    % 
    
    Q(size(G,1) - 2*radius,size(G,2) - 2*radius) = 0; % mock
    L = G;
    L(L<0)=0;
    
    tempTable(size(G,1),size(G,1)) = 0;
    tempTable(1:size(G,1),1:size(G,1)) = L(1:size(G,1),1:size(G,1));
    tempTable = I*tempTable;
    Q(1:size(G,1)-2*radius,1:size(G,1)-2*radius) = tempTable(1+ radius:size(tempTable,1)-radius,1+ radius:size(tempTable,1)-radius);

end
