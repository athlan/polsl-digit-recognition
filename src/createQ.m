function [ Q ] = createQ( I, G, radius )
%CREATEQ Create Q[1x16 x 32x32] matrix from I[36x36] and G[1x16 x 36x36] matrix
%   Detailed explanation goes here

    % G matrix should be truncated here by functon l()
    % 
    masksNumber = size(G,2);
    
    Q(1,masksNumber, size(G,3) - 2*radius,size(G,4) - 2*radius) = 0; % mock
    L = G;
    L(L<0)=0;
    for j=1:size(G,2)
        tempTable(size(G,3),size(G,3)) = 0;
        tempTable(1:size(G,3),1:size(G,3)) = L(1:1,j,1:size(G,3),1:size(G,3));
        tempTable = I*tempTable;
        Q(1,j,1:size(G,3)-2*radius,1:size(G,3)-2*radius) = tempTable(1+ radius:size(tempTable,1)-radius,1+ radius:size(tempTable,1)-radius);
    end;

end
