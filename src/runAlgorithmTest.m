function [ F_result ] = runAlgorithmTest( images, H_masks, const_image_x, const_image_y, const_matrixI_x, const_matrixI_y, const_r, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi )
%RUNALGORITHMTEST Summary of this function goes here
%   Detailed explanation goes here

    % Consts for testing
    const_matrixH_count = 16; % number of H masks
    const_matrixH_x = 5;
    const_matrixH_y = 5;
    const_checkAsserts = true;
    
    if(const_checkAsserts)
        assertSize = [const_matrixH_count, const_matrixH_x, const_matrixH_y];
        assert(all(size(H_masks) == assertSize), ...
            'Check H matrix dimensions. Should be [%dx %dx%d], but was [%dx %dx%d]', ...
            assertSize, size(H_masks));
    end
    
    imagesCount = size(images, 2);
    matrixH_count = size(H_masks, 1);
    
    F_x = floor(((const_matrixI_x - const_r*2) - const_v_x) / const_u_x) + 1;
    F_y = floor(((const_matrixI_y - const_r*2) - const_v_y) / const_u_y) + 1;

    F_result = zeros(imagesCount, F_x*F_y * matrixH_count);

    j_max = imagesCount;
    for j=1:j_max,
        % select image (appropriate column)
        I_plus = images(:,j:j);

        % convert image vector into the 28x28 matix and transposite
        I_plus = vec2mat(I_plus, const_image_x);

        % Add padding - +4 pixels each side to get 36x36 images
        % from 28x28 images
        I_plus = padarray(I_plus, [(const_matrixI_x - const_image_x)/2, (const_matrixI_y - const_image_y)/2])';

        tmp_f = [];

        for h_idx = 1:matrixH_count % for each mask
            H = squeeze(H_masks(h_idx, :, :));
            
            % create G matricies
            G = createG(H, I_plus, const_r);

            if(const_checkAsserts)
                assertSize = [const_matrixI_x, const_matrixI_y];
                assert(all(size(G) == assertSize), ...
                    'Check G matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
                    assertSize, size(G));
            end

            % create Q matricies
            Q = createQ(I_plus, G, const_r);

            if(const_checkAsserts)
                assertSize = [const_matrixI_x - const_r*2, const_matrixI_y - const_r*2];
                assert(all(size(Q) == assertSize), ...
                    'Check Q matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
                    assertSize, size(Q));
            end

            % create F (features) matricies
            F = createF(Q, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi, 0);

            F_x = floor(((const_matrixI_x - const_r*2) - const_v_x) / const_u_x) + 1;
            F_y = floor(((const_matrixI_y - const_r*2) - const_v_y) / const_u_y) + 1;

            if(const_checkAsserts)
                assertSize = [F_x, F_y];
                assert(all(size(F) == assertSize), ...
                    'Check F matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
                    assertSize, size(F));
            end
            
            tmp_f = [tmp_f, F(:)'];
        end % for each mask
        F_result(j,:) = tmp_f;

        if (mod(j, 100) == 0)
            fprintf('Completed %d of %d (%.2f %%).\n', j, j_max, j/j_max*100);
        end
    end


end

