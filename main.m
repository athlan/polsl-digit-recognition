images = loadMNISTImages('dataset/mnist/train-images-idx3-ubyte');
labels = loadMNISTLabels('dataset/mnist/train-labels-idx1-ubyte');

% now images is matrix 784 (28x28) rows and 60k cols
% we should transposite matrix to get images as rows instead of columns
images = images'; 

% TEST
% cut first row and translate it into matrix
img = images(1:1,:);
img = vec2mat(img, 28)';

% display image
imshow(img);

% display first 10 elements from label matrix
disp(labels(1:10));
