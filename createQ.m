function [ Q ] = createQ( I , G )

%Q(1:5,1:5) = 0;
%l = G;
%l(l<0) = 0;
%for j=1:16
%    tempTable(1:9,1:9) = 0;
%    tempTable(1:9,1:9) =l(1:1,j,1:9,1:9);
%    tempTable = I*tempTable;
%    Q(1:5,1:5) = tempTable(3:7,3:7);
%end

Q(1:1,1:size(G,2),1:32,1:32) = 0;
l = G;
l(l<0) = 0;
for j=1:size(G,2)
    tempTable(1:36,1:36) = 0;
    tempTable(1:36,1:36) = l(1:1,j,1:36,1:36);
    tempTable = I*tempTable;
    Q(1,j,1:32,1:32) = tempTable(3:34,3:34);
end

end

