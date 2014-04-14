I(1:36,1:36)=1;
G(1:1,1:16,1:36,1:36) = 0;
for i=1:16
    for j=1:36
        for k=1:36
            G(1,i,j,k) = 1000*i +10*j + k;
        end
    end
end
 q = createQ(I,G);
 q;