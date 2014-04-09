% define constants
const_image_x = 28;
const_image_y = 28;
const_imageDatasetCount = 60000;

const_r = 2;
const_F_windowSize_x = 3;
const_F_windowSize_y = 3;
const_F_fi = 1;

const_matrixI_x = 36;
const_matrixI_y = 36;
const_matrixH_count = 16; % number of H masks
const_matrixH_x = 5;
const_matrixH_y = 5;

const_checkAsserts = true;
% end of constants

images = loadMNISTImages('dataset/mnist/train-images-idx3-ubyte');
labels = loadMNISTLabels('dataset/mnist/train-labels-idx1-ubyte');

% now images is matrix 60k rows and 784 (28x28) cols
imagesCount = size(images, 2);

if(const_checkAsserts)
    assert(imagesCount == const_imageDatasetCount, 'Check dataset cardinality. Should be %d, but was %d', const_imageDatasetCount, imagesCount);
    assert(size(images, 1) == const_image_x * const_image_y, 'Check image dimensions (assume there are square). Should be %d, but was ', const_image_x * const_image_y, size(images, 1));
end

for j=1:10,
    % select image (appropriate column)
    I_plus = images(:,j:j);
    
    % convert image vector into the 28x28 matix and transposite
    I_plus = vec2mat(I_plus, const_image_x);
    
    % Add padding - +4 pixels each side to get 36x36 images
    % from 28x28 images
    I_plus = padarray(I_plus, [(const_matrixI_x - const_image_x)/2, (const_matrixI_y - const_image_y)/2])';
    
    % start algorithm here!
    I_minus = 1 - I_plus;
    
    % create mask H matricies
    H = createH(const_matrixH_count, const_matrixH_x, const_matrixH_y);
    
    if(const_checkAsserts)
        assertSize = [1, const_matrixH_count, const_matrixH_x, const_matrixH_y];
        assert(all(size(H) == assertSize), ...
            'Check H matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
            assertSize, size(H));
    end
    
    % create G matricies
    G_plus = createG(H, I_plus, const_r);
    G_minus = createG(H, I_minus, const_r);
    
    if(const_checkAsserts)
        assertSize = [1, const_matrixH_count, const_matrixI_x - const_r*2, const_matrixI_y - const_r*2];
        assert(all(size(G_plus) == assertSize), ...
            'Check G matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
            assertSize, size(G_plus));
    end
    
    % create Q matricies
    Q_plus = createQ(I_plus, G_plus);
    Q_minus = createQ(I_minus, G_minus);
    
    if(const_checkAsserts)
        assertSize = [1, const_matrixH_count, const_matrixI_x - const_r*2, const_matrixI_y - const_r*2];
        assert(all(size(Q_plus) == assertSize), ...
            'Check Q matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
            assertSize, size(Q_plus));
    end
    
    % create F (features) matricies
    F_plus = createF(Q_plus);
    F_minus = createF(Q_minus);
    
    %if(const_checkAsserts)
    %    assertSize = [1, const_matrixH_count, const_matrixH_x + const_r*2, const_matrixH_x + const_r*2];
    %    assert(all(size(F_plus) == assertSize), ...
    %        'Check F matrix dimensions. Should be [%dx%d x %dx%d], but was [%dx%d x %dx%d]', ...
    %        assertSize, size(F_plus));
    %end
    
    % TODO: here the F matrix should be saved
end
