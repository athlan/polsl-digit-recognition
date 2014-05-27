function [ F ] = digitRecognitionAlgorithmTest( H, I, const_r, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi, fillEmptyCellsValue )
%DIGITRECOGNITIONALGORITHM Summary of this function goes here
%   Detailed explanation goes here

    const_checkAsserts = true;
    const_matrixI_x = 36;
    const_matrixI_y = 36;

    % create G matricies
    G = createG(H, I, const_r);

    if(const_checkAsserts)
        assertSize = [const_matrixI_x, const_matrixI_y];
        assert(all(size(G) == assertSize), ...
            'Check G matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
            assertSize, size(G));
    end

    % create Q matricies
    Q = createQ(I, G, const_r);

    if(const_checkAsserts)
        assertSize = [const_matrixI_x - const_r*2, const_matrixI_y - const_r*2];
        assert(all(size(Q) == assertSize), ...
            'Check Q matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
            assertSize, size(Q));
    end

    % create F (features) matricies
    F = createF(Q, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi, fillEmptyCellsValue);
    
    F_x = floor(((const_matrixI_x - const_r*2) - const_v_x) / const_u_x) + 1;
    F_y = floor(((const_matrixI_y - const_r*2) - const_v_y) / const_u_y) + 1;

    if(const_checkAsserts)
        assertSize = [F_x, F_y];
        assert(all(size(F) == assertSize), ...
            'Check F matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
            assertSize, size(F));
    end

end
