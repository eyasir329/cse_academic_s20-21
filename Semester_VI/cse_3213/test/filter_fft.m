I = im2double(im2gray(imread("kobi.png"))); % grayscale
[rows, cols] = size(I);

F = fft2(I);
F_shift = fftshift(F);

% Correct meshgrid: columns first, rows second
[u,v] = meshgrid(-floor(cols/2):floor((cols-1)/2), -floor(rows/2):floor((rows-1)/2));

% Distance from center
D = sqrt(u.^2 + v.^2);

% Ideal Low-Pass Filter
D0 = 50;         % cutoff
H = double(D <= D0); % mask same size as image

% Apply filter
I_LPF = real(ifft2(ifftshift(F_shift .* H)));

% Gaussian Low-Pass Filter
G = exp(-(D.^2) ./ (2.*(D0^2)));
G_LPF = real(ifft2(ifftshift(F_shift.*G)));

n = 2;   % order for Butterworth
% Butterworth Law-Pass Filter
B = 1./(1+(D/D0).^(2.*n));
B_LPF = real(ifft2(ifftshift(F_shift.*B)));

% Display
figure;
subplot(2,4,1), imshow(I, []), title('Original Image');
subplot(2,4,2), imshow(I_LPF, []), title('Ideal Low-Pass Filtered');
subplot(2,4,3), imshow(G_LPF, []), title('Gaussian Low-Pass Filtered');
subplot(2,4,4), imshow(B_LPF, []), title('Gaussian Low-Pass Filtered');
