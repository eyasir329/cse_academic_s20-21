%img read
originalImg = imread('img\hibiscus_flower.jpg');

%img display
figure;
subplot(2,3,1); %row x col x activate pos
imshow(originalImg);
title('Original Color Image1');

subplot(2,3,2);
imshow(originalImg);
title('Original Color Image2');

subplot(2,3,3);
imshow(originalImg);
title('Original Color Image3');

% Save the image
imwrite(originalImg, 'img\ori_flow.jpg');  % Save as JPEG

% Adjust figure window size for better viewing
set(gcf, 'Position', [100 100 800 400]); % [x y width height]

%Stands for Get Current Figure
%The Position vector [x y width height] controls the figure window's location and size:
%x - Horizontal distance from left edge of screen to inner left edge of figure pixels
%y - Vertical distance from bottom edge of screen to inner bottom edge of figure pixels

%check img property
%disp(['image size: ',num2str(size(originalImg))]);%height x width x channel
%disp(['image class: ',class(originalImg)]);

%display img info
%whos originalImg;