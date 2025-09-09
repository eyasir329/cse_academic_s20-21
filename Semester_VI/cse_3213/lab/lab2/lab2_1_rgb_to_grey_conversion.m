%img read
originalImg = imread('img\hibiscus_flower.jpg');

%img display
figure;
subplot(2,3,2); %row x col x activate pos
imshow(originalImg);
title('Original Image');
disp('Original color image display done');


%------RGB to Greyscale------
%an image is grayscale (single-channel) by examining the third dimension of its data array
%if size(originalImg, 3) == 1 
%    grayImage = originalImg;  % Already grayscale
%end

%using default rgb2gray method
gray_img = rgb2gray(originalImg);
subplot(2,3,4);
imshow(gray_img);
title('rgb2gray method');


%Save the image
%imwrite(greyimg, 'img\grey_flow.jpg');  % Save as JPEG
%disp('Grayscale image saved as "grey_flow.jpg"');

%----Grey using luminosity Method----
R = double(originalImg(:,:,1));  % Red channel
G = double(originalImg(:,:,2));  % Green channel
B = double(originalImg(:,:,3));  % Blue channel

% Apply luminosity weights
gray_lum = 0.2989*R + 0.5870*G + 0.1140*B;
gray_lum = uint8(gray_lum);
subplot(2,3,5);
imshow(gray_lum);
title('luminosity method');

%-----Grey using chrominance method-----
%Equal weights (simple average)
gray_avg = (R + G + B)/3;

% Emphasize blue channel
gray_blue = uint8(0.2*R + 0.3*G + 0.5*B);

subplot(2,3,6);
imshow(gray_blue);
title('chrominance method');

