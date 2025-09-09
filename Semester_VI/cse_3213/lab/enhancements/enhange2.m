%% Manual Spatial Filtering: Original, Laplacian, and Sobel
clc; clear; close all;

% 1. Load and prepare image
I = im2double(imread('cameraman.tif')); % Classic test image
figure('Name','Original Image'); 
imshow(I); title('Original Image');

% Apply filters
laplacian_result = manual_laplacian(I);
sobel_result = manual_sobel(I);

% Display results
figure('Name','Filter Comparisons');
subplot(1,3,1); imshow(I); title('Original');
subplot(1,3,2); imshow(laplacian_result); title('Laplacian Sharpened');
subplot(1,3,3); imshow(sobel_result); title('Sobel Edge Magnitude');

% Edge handling visualization (for Laplacian)
figure('Name','Edge Handling Methods');
zero_padded = manual_laplacian(I); % Default (zero-padded)
replicated = manual_laplacian(padarray(I,[1 1],'replicate')); 
symmetric = manual_laplacian(padarray(I,[1 1],'symmetric'));
subplot(1,3,1); imshow(zero_padded); title('Zero Padding');
subplot(1,3,2); imshow(replicated); title('Replication');
subplot(1,3,3); imshow(symmetric); title('Symmetric');

%% Function Definitions (Must appear at end of script)

function output = manual_laplacian(input)
    [rows, cols] = size(input);
    output = zeros(rows, cols);
    kernel = [0 1 0; 1 -4 1; 0 1 0]; % Positive Laplacian
    
    for i = 2:rows-1
        for j = 2:cols-1
            % Extract 3x3 neighborhood
            neighborhood = input(i-1:i+1, j-1:j+1);
            % Convolution operation
            output(i,j) = sum(sum(neighborhood .* kernel));
        end
    end
    
    % Normalize and sharpen: g(x,y) = f(x,y) - ∇²f
    output = input - output; 
    output = im2uint8(mat2gray(output)); % Convert to 8-bit for display
end

function [magnitude] = manual_sobel(input)
    [rows, cols] = size(input);
    Gx = zeros(rows, cols);
    Gy = zeros(rows, cols);
    
    % Sobel kernels
    kernel_x = [-1 0 1; -2 0 2; -1 0 1];
    kernel_y = [-1 -2 -1; 0 0 0; 1 2 1];
    
    for i = 2:rows-1
        for j = 2:cols-1
            patch = input(i-1:i+1, j-1:j+1);
            Gx(i,j) = sum(sum(patch .* kernel_x));
            Gy(i,j) = sum(sum(patch .* kernel_y));
        end
    end
    
    magnitude = sqrt(Gx.^2 + Gy.^2);
    magnitude = im2uint8(mat2gray(magnitude)); % Convert to 8-bit
end