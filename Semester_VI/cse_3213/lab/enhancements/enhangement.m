%% Spatial Enhancement Pipeline (Fixed Version)
% Combines: Smoothing + Sharpening + Edge Detection + Histogram Equalization
clc; clear; close all;

%% 1. Load and Prepare Image
I = im2double(imread('skeleton.jpg')); % Replace with your image
figure('Name','Original Image'); imshow(I); title('Original');

%% 2. Noise Reduction (Adaptive Smoothing)
smooth_method = 'bilateral';
switch smooth_method
    case 'gaussian'
        smoothed = imgaussfilt(I, 1.5);
    case 'median'
        smoothed = medfilt2(I, [3 3]);
    case 'bilateral'
        smoothed = imbilatfilt(I, 0.2, 3);
end

%% 3. Sharpening (Highpass Filtering)
sharp_method = 'laplacian';
switch sharp_method
    case 'laplacian'
        laplacian_kernel = [0 -1 0; -1 4 -1; 0 -1 0];
        sharpened = smoothed - imfilter(smoothed, laplacian_kernel, 'replicate');
    case 'unsharp'
        sharpened = imsharpen(smoothed, 'Radius',1.5, 'Amount',1.2);
end

%% 4. Edge Enhancement
edge_method = 'sobel'; % Changed to 'sobel' to ensure edge_mag exists
switch edge_method
    case {'sobel','prewitt'}
        [Gx, Gy] = imgradientxy(sharpened, edge_method);
        edge_mag = sqrt(Gx.^2 + Gy.^2);
        edges = edge_mag > 0.15*max(edge_mag(:));
    case 'canny'
        edges = edge(sharpened, 'canny', [0.1 0.2]);
        edge_mag = double(edges); % Create dummy edge_mag for canny
end

se = strel('disk', 1);
enhanced_edges = imdilate(edges, se);

%% 5. Contrast Adjustment
contrast_method = 'adapthisteq';
switch contrast_method
    case 'histeq'
        contrast_enhanced = histeq(sharpened);
    case 'adapthisteq'
        contrast_enhanced = adapthisteq(sharpened, 'ClipLimit',0.02, 'NumTiles',[8 8]);
    case 'gamma'
        contrast_enhanced = imadjust(sharpened, [], [], 0.5);
end

%% 6. Final Fusion (Now Works for All Edge Methods)
% Method 1: Edge-enhanced
final_edges = min(contrast_enhanced + 0.3*enhanced_edges, 1);

% Method 2: Mask-based
masked = contrast_enhanced .* (1 + 0.5*enhanced_edges);

% Method 3: Weighted average (uses edge_mag which now always exists)
final_weighted = 0.7*contrast_enhanced + 0.3*edge_mag/max(edge_mag(:));

%% 7. Visualization
figure('Name','Processing Stages');
subplot(2,3,1); imshow(smoothed); title('Smoothed');
subplot(2,3,2); imshow(sharpened); title('Sharpened');
subplot(2,3,3); imshow(edges); title('Edge Detection');
subplot(2,3,4); imshow(contrast_enhanced); title('Contrast Enhanced');
subplot(2,3,5); imshow(final_edges); title('Edge-Enhanced');
subplot(2,3,6); imshow(final_weighted); title('Weighted Fusion');

figure('Name','Final Comparisons');
montage({I, final_edges, final_weighted}, 'Size',[1 3]);
title('Original | Edge-Enhanced | Weighted Fusion');