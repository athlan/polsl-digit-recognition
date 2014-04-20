function [ G ] = createG( H, I, radius )
%CREATEG Create G[36x36] matrix
%   Creates G matrix based on specified template H and picture I, using
%   windows with radius = radius.
    
    
    imageHeight = size(I, 1);
    imageWidth = size(I, 2);
    matrixG(imageHeight,imageWidth) = 0; % mock
      
    for i = 1+radius:imageWidth-radius
        for j = 1+radius:imageHeight-radius
            value = 0;
            for m = -radius:radius
                for n = -radius:radius
                    if m > 1 && n > 1
                        value = value + H(m+radius+1,n+radius+1)*I(i+m,j+n);
                    else 
                        value = value + 0;
                    end
                end
            end
            matrixG(i-radius, j-radius) = value;
        end
    end
    G = matrixG;
end
