%img read
originalImg = imread('img\hibiscus_flower.jpg');

%img display
figure;
subplot(2,3,1); %row x col x activate pos
imshow(originalImg);
title('Original Color Image');

%convert RGB to Greyscale
%an image is grayscale (single-channel) by examining the third dimension of its data array
if size(originalImg, 3) == 1 
    grayImage = originalImg;  % Already grayscale
end

greyimg = rgb2gray(originalImg);
subplot(2,3,2);
imshow(greyimg);
title('Gray Image');

% Save the image
imwrite(greyimg, 'img\grey_flow.jpg');  % Save as JPEG
disp('Grayscale image saved as "grey_flow.jpg"');

