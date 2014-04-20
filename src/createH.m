function [ H ] = createH( numberOfMasks, maskWidth, maskHeight )
%CREATEH Create H[16 x 5x5] matricies
%   It assumes arguments fit (16 x 5 x 5) size and creates (in
%   static way) matrix of templates.

    matrixH(numberOfMasks, maskHeight,maskWidth) = 0;
    %all operations are based on first matrix in a row
    %first row
    matrix1 = [-1 0 1 0 0; -1 0 1 0 0; -1 0 1 0 0; -1 0 1 0 0; -1 0 1 0 0];
    matrixH(1,:,:) = matrix1;
    matrix2 = fliplr(matrix1); 
    matrixH(2,:,:) = matrix2;
    matrix3 = rot90(matrix1, 3);
    matrixH(3,:,:) = matrix3;
    matrix4 = rot90(matrix1);
    matrixH(4,:,:) = matrix4;
    %second row
    matrix5 = [0 0 -2 0 1; 0 -1 0 1 0; -2 0 1 0 0; 0 1 0 0 0; 1 0 0 0 0];
    matrixH(5,:,:) = matrix5;
    matrix6 = rot90(matrix5, 2);
    matrixH(6,:,:) = matrix6;
    matrix7 = rot90(matrix5);
    matrixH(7,:,:) = matrix7;
    matrix8 = rot90(matrix5, 3);
    matrixH(8,:,:) = matrix8;
    %third row
    matrix9 = [0 -8 -8 -8 0; -1 0 2 0 -1; -1 0 2 0 -1; -1 0 2 0 -1; -1 0 2 0 -1];
    matrixH(9,:,:) = matrix9;
    matrix10 = flipud(matrix9); %flip from up to down
    matrixH(10,:,:) = matrix10;
    matrix11 = rot90(matrix9);
    matrixH(11,:,:) = matrix11;
    matrix12 = rot90(matrix9, 3);
    matrixH(12,:,:) = matrix12;
    
    %fourth row
    matrix13 = [0 0 -1 -8 -8; 0 -1 0 2 -8; -2 0 2 0 -1; 0 2 0 -1 0; 2 0 -2 0 0];
    matrixH(13,:,:) = matrix13;
    matrix14 = rot90(matrix13, 2);
    matrixH(14,:,:) = matrix14;
    matrix15 = rot90(matrix13);
    matrixH(15,:,:) =  matrix15;
    matrix16 = rot90(matrix13, 3)
    matrixH(16,:,:) = matrix16;
    
    
    H = matrixH;

end

