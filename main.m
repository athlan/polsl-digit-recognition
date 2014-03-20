images = loadMNISTImages('dataset/mnist/train-images-idx3-ubyte');
labels = loadMNISTLabels('dataset/mnist/train-labels-idx1-ubyte');

% now images is matrix 784 (28x28) rows and 60k cols
% we should transposite matrix to get images as rows instead of columns
images = images'; 

figure(1)
% TEST
% cut first row and translate it into matrix
for j=1:10,
    img = images(j:j,:);
    img = vec2mat(img, 28)';

    % Add padding - +4 pixels each side to get 36x36 images
    % from 28x28 images
    img = padarray(img, [4 4]);
    % display image
    subplot(2,5,j)
    imshow(img);
end

% display first 10 elements from label matrix
disp(labels(1:10));
