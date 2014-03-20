% Change the filenames if you've saved the files under different names
% On some platforms, the files might be saved as 
% train-images.idx3-ubyte / train-labels.idx1-ubyte
images = loadMNISTImages('dataset/mnist/train-images-idx3-ubyte');
labels = loadMNISTLabels('dataset/mnist/train-labels-idx1-ubyte');
 
% We are using display_network from the autoencoder code
display(images(:,1:3)); % Show the first 3 images
disp(labels(1:10));
