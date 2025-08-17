I = im2gray(imread('bonescan.png'));
I = im2double(I);
figure, subplot(3,4,1), imshow(I), title('Original Image');

% Step 1: Laplacian filter for edge detection
h_lap = fspecial('laplacian', 0.2);
A = imfilter(I, h_lap, 'replicate');
subplot(3,4,2), imshow(A, []), title('A: Laplacian');

% Step 2: Sharpened image (Original + Laplacian)
B = I - A;  % Correct sharpening: I + (I - blurred) ≈ 2I - blurred
subplot(3,4,3), imshow(B, []), title('B: Sharpened (I-A)');

% Step 3: Sobel edge detection (keep as binary)
C = edge(I, 'sobel');
subplot(3,4,4), imshow(C), title('C: Sobel Edges');

% Step 4: Smooth edges with 5x5 averaging filter
h_avg = fspecial('average', [5 5]);
D = imfilter(double(C), h_avg, 'replicate'); % Convert C to double for filtering
subplot(3,4,5), imshow(D, []), title('D: Smoothed Edges');

% Step 5: Create edge mask by multiplying edge map with smoothed version
E = C .* D;  % Emphasize strong edges that persist after smoothing
subplot(3,4,6), imshow(E, []), title('E: Edge Mask (C×D)');

% Step 6: Combine Laplacian with edge mask (not sharpened image)
F = A .* E;  % Apply edge mask to Laplacian
subplot(3,4,7), imshow(F, []), title('F: Masked Laplacian (A×E)');

% Step 7: Add masked Laplacian to original image for selective sharpening
G = I + F;  % Sharpening only at edge locations
subplot(3,4,8), imshow(G, []), title('G: Selectively Sharpened (I+F)');

% Step 8: Gamma correction for final enhancement
gamma = 0.5;  % Brighten the image
Final = imadjust(G, [], [], gamma);
subplot(3,4,9), imshow(Final, []), title(['Final (γ=', num2str(gamma), ')']);

% Comparison
subplot(3,4,10), imshowpair(I, Final, 'montage');
title('Original vs Enhanced');