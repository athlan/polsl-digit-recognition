function W  = calculateW(M, N, X, Y, Q, v_x, v_y, u_x, u_y, fi) % windowSizeWidth to jest v  % windowSizeHeight to jest u

    denominator = 0;

    for S = 0:v_x-1,
        for T = 0:v_y-1,
           denominator = denominator + (abs(Q(u_x * X + S + 1, u_y* Y + T + 1))) ^ fi;
        end
    end
    
    numerator =  (abs(Q(u_x * X + M + 1, u_y * Y + N + 1))) ^ fi;
    W = numerator / denominator;
end