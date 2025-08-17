I = im2double(im2gray(imread("cameraman.tif")));
[rows,cols] = size(I);
subplot(2,3,1), imshow(I);

prewitt_x = [-1 0 1;-1 0 1;-1 0 1];
prewitt_y = [-1 -1 -1;0 0 0;1 1 1];
%{
sobel_x = [-1 0 1;-2 0 2;-1 0 1];
sobel_y = [-1 -2 -1;0 0 0;1 2 1];

robert_x = [-1 0;0 1];
robert_y = [1 0;0 -1];
%}
Gx = zeros(rows,cols);
Gy = zeros(rows,cols);
I_padded = padarray(I,[1,1],"replicate");

for i = 2:rows+1
    for j = 2:cols+1
        Neighbor = I_padded(i-1:i+1,j-1:j+1);
        Gx(i-1,j-1) = sum(sum(Neighbor.*prewitt_x));
        Gy(i-1,j-1) = sum(sum(Neighbor.*prewitt_y));
    end
end

G = sqrt(Gx.^2 + Gy.^2);
threshold = 0.15*max(G(:));
BW = G>threshold;

subplot(2,3,2), imshow(BW);
subplot(2,3,3), imshow(Gx,[]);
subplot(2,3,4), imshow(Gy,[]);

%k = fspecial("prewitt");
%L = imfilter(I,k,"replicate");
%subplot(2,3,5), imshow(L);
