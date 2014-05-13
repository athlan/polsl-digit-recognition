function [ F ] = createF( Q, v_x, v_y, u_x, u_y, fi, fillEmptyCellsValue)
%CREATEF Create features F[9x9] matrixies
%   Detailed explanation goes here

    matrixF_x = floor((size(Q,1) - v_x) / u_x) + 1;
    matrixF_y = floor((size(Q,2) - v_y) / u_y) + 1;
    
    F(matrixF_x, matrixF_y) = 0;
    
    for X = 0:matrixF_x-1,
        for Y = 0:matrixF_y-1,
            tmp = 0;
            
            denominator_w = 0;
            for S = 0:v_x-1,
                for T = 0:v_y-1,
                    denominator_w = denominator_w + (abs(Q(u_x * X + S + 1, u_y* Y + T + 1))) ^ fi;
                end
            end
            
            for M = 0:v_x-1,
                for N = 0:v_y-1,
                    if (denominator_w == 0)
                        W = 0;
                    else
                        W = ((abs(Q(u_x * X + M + 1, u_y * Y + N + 1))) ^ fi) / denominator_w;
                    end
                    tmp = tmp + (W * (Q(u_x * X + M + 1, u_y * Y + N + 1)));
                end
            end

            F(X + 1, Y + 1 ) = tmp;
        end
    end
end
