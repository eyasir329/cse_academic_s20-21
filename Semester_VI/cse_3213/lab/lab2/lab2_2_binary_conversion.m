%img read
originalImg = imread('img\hibiscus_flower.jpg');

%img display
figure;
subplot(4,3,1);
imshow(originalImg);
title('Original Image');
disp('Original color image display done');

gray_img = rgb2gray(originalImg);
subplot(4,3,2);s
imshow(gray_img);
title('Gray Image');

%-----RGB to binary-----

threshold1 = 128;  % Mid-range value
binary_img1 = rgb2gray(originalImg) > threshold1;
subplot(4,3,4);
imshow(binary_img1);
title('RGB to binary -> Mid-range');

threshold2 = 0.7 * max(originalImg(:));  % 70% of max intensity
binary_img2 = rgb2gray(originalImg) > threshold2;
subplot(4,3,5);
imshow(binary_img2);
title('70%');

threshold3 = mean(originalImg(:)); %mean intensity threshold
binary_img3 = rgb2gray(originalImg) > threshold3;
subplot(4,3,6);
imshow(binary_img3);
title('mean');

%-----Grey to  binary-----
%Grey to binary using threshold

%fixed threshold
threshold = 150;  % Experiment with values
binary_fixed = gray_img > threshold;
subplot(4,3,7);
imshow(binary_fixed);
title('Grey to binary Image');

%Otsu's Automatic Thresholding
level = graythresh(gray_img);  % Returns normalized threshold (0-1)
binary_otsu = imbinarize(gray_img, level);
subplot(4,3,8);
imshow(binary_otsu);s
title('Otsus Automatic Thresholding');

%Adaptive Thresholding
binary_adapt = imbinarize(gray_img, 'adaptive');
subplot(4,3,9);
imshow(binary_adapt);
title('Adaptive Thresholding');
