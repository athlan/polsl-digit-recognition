% define constants
const_image_x = 28;
const_image_y = 28;
const_imageDatasetCount_train = 60000;
const_imageDatasetCount = 10000;

const_r = 2;
const_v_x = 8;
const_v_y = 8;
const_u_x = 3;
const_u_y = 3;
const_F_fi = 1;

const_matrixI_x = 36;
const_matrixI_y = 36;
const_matrixH_count = 16; % number of H masks
const_matrixH_x = 5;
const_matrixH_y = 5;

const_checkAsserts = true;
% end of constants

images_train = loadMNISTImages('dataset/mnist/train-images-idx3-ubyte');
labels_train = loadMNISTLabels('dataset/mnist/train-labels-idx1-ubyte');
images = loadMNISTImages('dataset/mnist/t10k-images-idx3-ubyte');
labels = loadMNISTLabels('dataset/mnist/t10k-labels-idx1-ubyte');

% now images is matrix 60k rows and 784 (28x28) cols
imagesCount_train = size(images_train, 2);
imagesCount = size(images, 2);

if(const_checkAsserts)
    assert(imagesCount_train == const_imageDatasetCount_train, 'Check dataset cardinality. Should be %d, but was %d', const_imageDatasetCount_train, imagesCount_train);
    assert(imagesCount == const_imageDatasetCount, 'Check dataset cardinality. Should be %d, but was %d', const_imageDatasetCount, imagesCount);
end

% create mask H matricies
H_masks = createH(const_matrixH_count, const_matrixH_x, const_matrixH_y);

F_result_train = runAlgorithm(images_train, H_masks, const_image_x, const_image_y, const_matrixI_x, const_matrixI_y, const_r, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi);
F_result = runAlgorithm(images, H_masks, const_image_x, const_image_y, const_matrixI_x, const_matrixI_y, const_r, const_v_x, const_v_y, const_u_x, const_u_y, const_F_fi);

fprintf('Completed\n');
clearvars -except F_result F_result_train labels labels_train

[ CLASS, ERR, POSTERIOR, LOGP, COEF ] = classify(F_result, F_result_train, labels_train, 'linear');
