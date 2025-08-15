clc; clear; close all;

I = im2double(imread('skeleton.jpg'));

laplacian1 = laplacian(I);
sharpened = I - laplacian1;
sobel1 = sobel(I);

figure('Name','Manual Filtering Results');
subplot(2,2,1); imshow(I); title('a) Original');
subplot(2,2,2); imshow(laplacian1); title('b) Laplacian Filtered');
subplot(2,2,3); imshow(sharpened); title('c) Sharpened (a-b)');
subplot(2,2,4); imshow(sobel1); title('d) Sobel Edges of bone scan');

function output = laplacian(input)
    [rows, cols] = size(input);
    output = zeros(size(input));
    kernel = [0 1 0; 1 -4 1; 0 1 0]; 
    padded = padarray(input, [1 1], 0);
    
    for i = 2:rows+1
        for j = 2:cols+1
            neighborhood = padded(i-1:i+1, j-1:j+1);
            output(i-1,j-1) = sum(sum(neighborhood .* kernel));
        end
    end
    output = mat2gray(output);
end

function magnitude = sobel(input)
    [rows, cols] = size(input);
    Gx = zeros(size(input));
    Gy = zeros(size(input));
    kernel_x = [-1 0 1; -2 0 2; -1 0 1];
    kernel_y = [-1 -2 -1; 0 0 0; 1 2 1];
    padded = padarray(input, [1 1], 0);
    
    for i = 2:rows+1
        for j = 2:cols+1
            patch = padded(i-1:i+1, j-1:j+1);
            Gx(i-1,j-1) = sum(sum(patch .* kernel_x));
            Gy(i-1,j-1) = sum(sum(patch .* kernel_y));
        end
    end
    
    magnitude = sqrt(Gx.^2 + Gy.^2);
    magnitude = mat2gray(magnitude);
end