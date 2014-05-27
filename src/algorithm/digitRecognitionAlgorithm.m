function [ F ] = digitRecognitionAlgorithm( H, I, const_r, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi, fillEmptyCellsValue )
%DIGITRECOGNITIONALGORITHM Summary of this function goes here
%   Detailed explanation goes here

    % create G matricies
    G = createG(H, I, const_r);

    % create Q matricies
    Q = createQ(I, G, const_r);

    % create F (features) matricies
    F = createF(Q, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi, fillEmptyCellsValue);
end
