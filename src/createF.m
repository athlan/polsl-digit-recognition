function [ F ] = createF( Q, v_x, v_y, u_x, u_y, fi, fillEmptyCellsValue)
%CREATEF Create features F[1x16 x 9x9] matrixies
%   Detailed explanation goes here

    masksNumber = size(Q,2);
    
    matrixF_x = floor((size(Q,3) - v_x) / u_x) + 1;
    matrixF_y = floor((size(Q,4) - v_y) / u_y) + 1;
    
    F(1,masksNumber, matrixF_x,matrixF_y) = 0;
    
    for X = 0:matrixF_x-1,
        for Y = 0:matrixF_y-1,
            tmp = 0;
            
            for M = 0:v_x-1,
                for N = 0:v_y-1,
                     W = createW(M, N, X, Y, Q, v_x, v_y, u_x, u_y, fi);
                     tmp = tmp + (W * (Q(u_x * X + M + 1, u_y * Y + N + 1)));
                end
            end
            
            F( X + 1, Y + 1 ) = tmp;
        end
    end

end
