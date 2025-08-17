%img read
originalImg = imread('img\hibiscus_flower.jpg');

%img display
figure;
subplot(4,3,1);
imshow(originalImg);
title('Original Image');
disp('Original color image display done');

%-----Channel Extraction Methods-----
%Direct indexing
R1 = originalImg(:,:,1); 
G1 = originalImg(:,:,2); 
B1 = originalImg(:,:,3);

subplot(4,3,4);
imshow(R1);
title('R1');
subplot(4,3,5);
imshow(G1);
title('G1');
subplot(4,3,6);
imshow(B1);
title('B1');

%Using imsplit
[R2,G2,B2] = imsplit(originalImg);
subplot(4,3,7);
imshow(R2);
title('R2');
subplot(4,3,8);
imshow(G2);
title('G2');
subplot(4,3,9);
imshow(B2);
title('B2');

%-----Channel Visualization Techniques-----
%Create color-highlighted versions
red_channel = originalImg; 
red_channel(:,:,2:3) = 0;
subplot(4,3,10); 
imshow(red_channel); 
title('Red Channel');

green_channel = originalImg; 
green_channel(:,:,[1 3]) = 0;
subplot(4,3,11); 
imshow(green_channel); 
title('Green Channel');

blue_channel = originalImg; 
blue_channel(:,:,1:2) = 0;
subplot(4,3,12); 
imshow(blue_channel); 
title('Blue Channel');
