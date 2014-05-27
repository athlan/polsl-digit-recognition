function [ F_result ] = runAlgorithm( images, H_masks, const_image_x, const_image_y, const_matrixI_x, const_matrixI_y, const_r, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi )
%RUNALGORITHM Summary of this function goes here
%   Detailed explanation goes here

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
            F = digitRecognitionAlgorithm(H, I_plus, const_r, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi, 0);
            tmp_f = [tmp_f, F(:)'];
        end % for each mask
        F_result(j,:) = tmp_f;

        if (mod(j, 100) == 0)
            fprintf('Completed %d of %d (%.2f %%).\n', j, j_max, j/j_max*100);
        end
    end

end
