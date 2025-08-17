%% ========================== BASIC IMAGE OPERATIONS ==========================
% Purpose: Demonstrate reading, writing, displaying, and analyzing images
%% -------------------- 1️⃣ Read, Write, Display --------------------
I = imread('cameraman.tif');       % Read grayscale image
info = imfinfo('cameraman.tif');   % Get image metadata
imwrite(I,'cameraman_copy.jpg','jpg'); % Save as JPEG
figure('Name','Image Display'); imshow(I); title('Original Image');

%% -------------------- 2️⃣ Display Multiple Images --------------------
B = imread('cell.tif');
C = imread('spine.tif');
D = imread('onion.png');            % RGB image
figure('Name','Multiple Images');
subplot(3,1,1), imshow(B), title('Cell Image');
subplot(3,1,2), imshow(C), title('Spine Image');
subplot(3,1,3), imshow(D), title('Onion Image');

%% -------------------- 3️⃣ Accessing and Modifying Pixels --------------------
% Grayscale pixel access
pixelValue = B(25,50);
B(25,50) = 255; % Modify pixel
figure, imshow(B), title('Modified Cell Image');

% RGB pixel access
Dpixel = D(25,50,:);        % RGB values
Dred   = D(25,50,1);        % Red channel
D(25,50,:) = [255,255,255]; % Set white
figure, imshow(D), title('Modified Onion Image');

%% -------------------- 4️⃣ Converting Image Types --------------------
Dgray = rgb2gray(D);
Dred   = D(:,:,1); Dgreen = D(:,:,2); Dblue = D(:,:,3);

figure('Name','Color Channels');
subplot(2,3,1), imshow(D), title('Original RGB');
subplot(2,3,2), imshow(Dgray), title('Grayscale');
subplot(2,3,4), imshow(Dred), title('Red Channel');
subplot(2,3,5), imshow(Dgreen), title('Green Channel');
subplot(2,3,6), imshow(Dblue), title('Blue Channel');

%% -------------------- 5️⃣ Pixel Arithmetic Operations --------------------
A = imread('cameraman.tif');
Abuild = zeros(size(A),'uint8'); % Create zero image
B = imadd(A,100);               % Add 100 to each pixel
C = imcomplement(A);            % Negative image

% Manual complement
Atemp = uint8(zeros(size(A))); 
Atemp = imadd(Atemp, 255);
D = imsubtract(Atemp,A);

% Display results
figure('Name','Pixel Operations');
subplot(2,2,1), imshow(A), title('Original');
subplot(2,2,2), imshow(B), title('Added 100');
subplot(2,2,3), imshow(C), title('Negative (imcomplement)');
subplot(2,2,4), imshow(D), title('Manual Negative');

%% -------------------- 6️⃣ Binary Operations --------------------
Abw = imbinarize(A); % Convert to binary
Bbw = imbinarize(B);
figure('Name','Binary Operations');
subplot(1,3,1), imshow(Abw), title('Original BW');
subplot(1,3,2), imshow(Bbw), title('Added BW');
subplot(1,3,3), imshow(xor(Abw,Bbw)), title('XOR');

%% ========================== Pixel Distribution ==========================
%% -------------------------- Histogram --------------------------------
I = imread('coins.png');
figure('Name','Histograms');
subplot(2,2,1), imshow(I), title('Original Image');
subplot(2,2,2), imhist(I), title('Histogram (Built-in)');

% Manual histogram
[n,m] = size(I);
histManual = zeros(1,256);
for i = 1:n
    for j = 1:m
        value = I(i,j);
        histManual(value+1) = histManual(value+1)+1;
    end
end
subplot(2,2,3), bar(0:255, histManual);
xlabel('Gray Level'), ylabel('Pixel Count'), title('Manual Histogram');

%% --------------------  Thresholding via Histogram --------------------
level = 100/255;
It = imbinarize(I, level);
subplot(2,2,4), imshow(It), title(['Thresholded Image (Level=' num2str(level*255) ')']);

%% --------------------  Contrast Stretching --------------------
I = imread('pout.tif');
Ics = imadjust(I,stretchlim(I,[0.05,0.95]),[]);
figure('Name','Contrast Stretching');
subplot(2,2,1), imshow(I), title('Original');
subplot(2,2,2), imshow(Ics), title('Contrast Stretched');
subplot(2,2,3), imhist(I), title('Original Histogram');
subplot(2,2,4), imhist(Ics), title('Stretched Histogram');

%% --------------------  Histogram Equalization --------------------
I = imread('pout.tif');          % Original image
Ieq = histeq(I);                 % Built-in histogram equalization
J = adapthisteq(I);              % Adaptive Histogram Equalization (CLAHE)

% -------------------- Manual Histogram Equalization --------------------
[n, m] = size(I);
num_pixels = n * m;

% Compute histogram
hist_vals = zeros(1,256);
for i = 1:n
    for j = 1:m
        hist_vals(I(i,j)+1) = hist_vals(I(i,j)+1) + 1;
    end
end

% PDF and CDF
pdf = hist_vals / num_pixels;
cdf = cumsum(pdf);

% Transformation function
T = uint8(255 * cdf);

% Apply transformation
I_manual = zeros(size(I), 'uint8');
for i = 1:n
    for j = 1:m
        I_manual(i,j) = T(I(i,j)+1);
    end
end

% -------------------- Display --------------------
figure('Name','Histogram Equalization Comparison');
subplot(2,3,1), imshow(I), title('Original Image');
subplot(2,3,2), imshow(Ieq), title('Histogram Equalized (Built-in)');
subplot(2,3,3), imshow(I_manual), title('Manual Histogram Equalized');
subplot(2,3,4), imhist(I), title('Original Histogram');
subplot(2,3,5), imhist(Ieq), title('Built-in Equalized Histogram');
subplot(2,3,6), imhist(I_manual), title('Manual Equalized Histogram');

%% --------------------  Histogram Equalization on Color Image --------------------
I = imread('autumn.tif');
Ihsv = rgb2hsv(I);
V = histeq(Ihsv(:,:,3));
Ihsv(:,:,3) = V;
Iout = hsv2rgb(Ihsv);

figure('Name','Color Histogram Equalization');
subplot(1,2,1), imshow(I), title('Original RGB Image');
subplot(1,2,2), imshow(Iout), title('Histogram Equalized (Value Channel)');

%% ========================== POINT PROCESSING TECHNIQUES ==========================
% Purpose: Demonstrate different point operations on grayscale images
% Techniques included:
% 1. Negative Image
% 2. Thresholding
% 3. Logarithmic Transform
% 4. Exponential Transform
% 5. Power-Law (Gamma) Transform
% 6. Gamma Correction
% 7. Contrast Stretching (Basic Gray-Level Transformation)
% 8. Piecewise Linear Transformation
% 9. Gray Level Slicing
% 10. Bit-Plane Slicing

%% Read the grayscale image
I = imread('cameraman.tif'); % Standard 256x256 test image

figure('Name','Point Processing Techniques','NumberTitle','off');

%% -------------------- 1️⃣ Negative Image --------------------
% Formula: s = L-1 - r
% Purpose: Enhance dark details; invert intensities.
Neg = imcomplement(I);
subplot(3,4,1), imshow(I), title('Original Image');
subplot(3,4,2), imshow(Neg), title('Negative Image');

%% -------------------- 2️⃣ Thresholding --------------------
% Formula: BW = 1 if r > T, else 0
% Purpose: Segment image into foreground/background
thresh = 100;
BW = I > thresh;
subplot(3,4,3), imshow(BW), title(['Thresholding (T=' num2str(thresh) ')']);

%% -------------------- 3️⃣ Logarithmic Transform --------------------
% Formula: s = c*log(1 + r)
% Purpose: Brighten dark regions while compressing high intensity
Id = im2double(I);
c = 255 / log(1 + max(Id(:)));
LogT = c*log(1 + Id);
subplot(3,4,4), imshow(uint8(LogT)), title('Log Transform');

%% -------------------- 4️⃣ Exponential Transform --------------------
% Formula: s = c*((1+alpha)^r - 1)
% Purpose: Enhance bright pixels exponentially, opposite of log
Exp1 = 4*((1+0.4).^(Id)-1);
subplot(3,4,5), imshow(Exp1), title('Exponential Transform');

%% -------------------- 5️⃣ Power-Law (Gamma) Transform --------------------
% Formula: s = c * r^gamma
% Gamma <1: brightens dark regions
% Gamma >1: darkens bright regions
Gamma1 = 2*(Id.^0.5);
Gamma2 = 2*(Id.^2.0);
subplot(3,4,6), imshow(Gamma1), title('Gamma < 1 (Brighten)');
subplot(3,4,7), imshow(Gamma2), title('Gamma > 1 (Darken)');

%% -------------------- 6️⃣ Gamma Correction --------------------
% imadjust allows mapping input gray levels with gamma factor
GammaCorr = imadjust(I,[0 1],[0 1],1/3); % Gamma = 1/3 brightens image
subplot(3,4,8), imshow(GammaCorr), title('Gamma Correction (\gamma=1/3)');

%% -------------------- 7️⃣ Contrast Stretching --------------------
% Formula: linear scaling between min/max intensities
% Purpose: Increase overall image contrast
Contrast = imadjust(I, stretchlim(I), []);
subplot(3,4,9), imshow(Contrast), title('Contrast Stretching');

%% -------------------- 8️⃣ Piecewise Linear Transformation --------------------
% Purpose: Apply different slopes for different intensity ranges
% Example: stretch mid-range, saturate extremes
Piecewise = imadjust(I,[0.3 0.7],[0 1]);
subplot(3,4,10), imshow(Piecewise), title('Piecewise Linear');

%% -------------------- 9️⃣ Gray Level Slicing --------------------
% Purpose: Highlight specific intensity range, suppress others
Slice = (I > 100 & I < 180) * 255;
subplot(3,4,11), imshow(uint8(Slice)), title('Gray Level Slicing (100-180)');

%% -------------------- 🔟 Bit-Plane Slicing --------------------
% Purpose: Extract significant bit-planes to analyze image details
% 8th bit-plane shows most significant features
bp = bitget(I,8);
subplot(3,4,12), imshow(logical(bp)), title('Bit-Plane Slicing (8th Bit)');

%% ================ Spatial Filtering in Image Enhancement ===================
% This script demonstrates neighborhood operations and spatial filters
% for image enhancement and noise removal.

%% Input Image
I = imread("cameraman.tif");
figure('Name','Original Image');
imshow(I), title('Original Image');

%% ---------------- Neighbourhood Operations ----------------
figure('Name','Neighborhood Operations');

% Max filter
func = @(x) max(x(:));
J = nlfilter(I,[3 3],func);
subplot(2,2,1), imshow(J), title('Max Filter (3x3)');

% Min filter
func = @(x) min(x(:));
K = nlfilter(I,[3 3],func);
subplot(2,2,2), imshow(K), title('Min Filter (3x3)');

% Simple mean filter
func = @(x) uint8(mean(x(:)));
L = nlfilter(I,[3 3],func);
subplot(2,2,3), imshow(L), title('Mean Filter (3x3)');

% Median filter
M = medfilt2(I,[3 3]);
subplot(2,2,4), imshow(M), title('Median Filter (3x3)');

%% ---------------- Noise Addition ----------------
Isp = imnoise(I,"salt & pepper",0.03);
Ig  = imnoise(I,"gaussian",0.02);

figure('Name','Noise Models');
subplot(1,3,1), imshow(I), title('Original');
subplot(1,3,2), imshow(Isp), title('Salt & Pepper Noise');
subplot(1,3,3), imshow(Ig), title('Gaussian Noise');

%% ---------------- Mean (Averaging) Filter ----------------
k = ones(3,3)/9;
Io   = imfilter(I,k);
Iosp = imfilter(Isp,k);
Iog  = imfilter(Ig,k);

figure('Name','Mean Filtering (3x3)');
subplot(1,3,1), imshow(Io),   title('Original + Mean Filter');
subplot(1,3,2), imshow(Iosp), title('Salt & Pepper + Mean Filter');
subplot(1,3,3), imshow(Iog),  title('Gaussian + Mean Filter');

%% Effect of Increasing Filter Size
figure('Name','Increasing Filter Size - Mean Filter');
for n = 1:3
    fsize = 3 + 2*(n-1); % 3, 5, 7
    k = ones(fsize,fsize)/(fsize*fsize);
    If = imfilter(I,k);
    subplot(1,3,n), imshow(If);
    title(sprintf('Mean Filter %dx%d',fsize,fsize));
end

%% ---------------- Weighted Averaging Filter ----------------
w = [1 2 1; 2 4 2; 1 2 1]/16; % Gaussian-like weights
Iw = imfilter(I,w);
figure('Name','Weighted Smoothing Filter');
imshow(Iw), title('Weighted 3x3 Filter');

%% ---------------- Median vs Mean ----------------
Isp_med = medfilt2(Isp,[3 3]);
Isp_avg = imfilter(Isp,ones(3,3)/9);

figure('Name','Median vs Mean for Salt & Pepper');
subplot(1,2,1), imshow(Isp_avg), title('Mean Filter');
subplot(1,2,2), imshow(Isp_med), title('Median Filter');

%% ---------------- Order-Statistic Filter ----------------
Io   = ordfilt2(I,25,ones(5,5));     % Max in 5x5
Imin = ordfilt2(I,1,ones(5,5));      % Min in 5x5
Imid = ordfilt2(I,13,ones(5,5));     % Median approx (5x5)

figure('Name','Order-Statistic Filtering');
subplot(1,3,1), imshow(Io),   title('Max Filter (5x5)');
subplot(1,3,2), imshow(Imin), title('Min Filter (5x5)');
subplot(1,3,3), imshow(Imid), title('Median (5x5)');

%% ---------------- Gaussian Filter ----------------
k = fspecial("gaussian",[5 5],2);
Io   = imfilter(I,k);
Iosp = imfilter(Isp,k);
Iog  = imfilter(Ig,k);

figure('Name','Gaussian Filtering');
subplot(1,3,1), imshow(Io),   title('Original + Gaussian Filter');
subplot(1,3,2), imshow(Iosp), title('Salt & Pepper + Gaussian Filter');
subplot(1,3,3), imshow(Iog),  title('Gaussian + Gaussian Filter');

%% ---------------- Image Padding ----------------
Ip = padarray(I,[20 20],'replicate','both');
figure('Name','Image Padding');
subplot(1,2,1), imshow(I),  title('Original');
subplot(1,2,2), imshow(Ip), title('Replicate Padding (20 px)');

%% =========== First & Second Derivative Filters for Image Enhancement ===========
% Load image
I = imread('cameraman.tif');   % Replace with bone scan if needed
I = im2double(I);
figure, subplot(3,3,1), imshow(I), title('Original');

%% ---- First Derivative Filters ----
% Sobel Edge Detection
sobel_edges = edge(I, 'sobel');
subplot(3,3,2), imshow(sobel_edges), title('First Derivative: Sobel');

% Prewitt Edge Detection
prewitt_edges = edge(I, 'prewitt');
subplot(3,3,3), imshow(prewitt_edges), title('First Derivative: Prewitt');

%% ---- Second Derivative Filters ----
% Laplacian Filter
h_lap = fspecial('laplacian', 0.2);
lap_img = imfilter(I, h_lap, 'replicate');
lap_enhanced = I - lap_img; % Sharpened with Laplacian
subplot(3,3,4), imshow(lap_img, []), title('Second Derivative: Laplacian');
subplot(3,3,5), imshow(lap_enhanced, []), title('Laplacian Sharpened');

% Laplacian of Gaussian (LoG)
log_edges = edge(I, 'log');
subplot(3,3,6), imshow(log_edges), title('Second Derivative: LoG');

%% ---- Combined Enhancement ----
% Sobel + Laplacian (example combination)
combined = im2double(sobel_edges) + mat2gray(lap_enhanced);
subplot(3,3,7), imshow(combined, []), title('Combined (Sobel + Laplacian)');

% Power-law enhancement after Laplacian
gamma = 0.5; % adjust gamma
power_enhanced = imadjust(lap_enhanced, [], [], gamma);
subplot(3,3,8), imshow(power_enhanced, []), title('Power-Law after Laplacian');

% Original vs Final
subplot(3,3,9), imshowpair(I, power_enhanced, 'montage');
title('Original vs Enhanced');

%% =============== Bone Scan Image Enhancement  ===================
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

%% ================== Frequency Domain Filtering ==================
% Purpose: Demonstrate smoothing (low-pass) and sharpening (high-pass)
% in the frequency domain using Ideal, Butterworth, and Gaussian filters.
%
% Frequency domain filtering:
% - Smoothing (Low-pass): Removes high-frequency noise, blurs edges.
% - Sharpening (High-pass): Enhances edges, highlights fine details.
%
% Filter types:
% 1. Ideal: sharp cutoff, may cause ringing (Gibbs effect)
% 2. Butterworth: smooth cutoff, parameterized by order n
% 3. Gaussian: smoothest cutoff, no ringing
%
% - Low-pass filters remove noise but blur edges.
% - High-pass filters enhance edges, useful for sharpening.
% - Ideal filters cause ringing, Butterworth reduces ringing, Gaussian is smoothest.
% - Cutoff frequency D0 controls the degree of smoothing/sharpening.


%% ------------------- 1️⃣ Load Image -------------------
I = imread('cameraman.tif');
I = im2double(I);
[rows, cols] = size(I);

figure('Name','Original Image','NumberTitle','off');
imshow(I), title('Original Image');

%% ------------------- 2️⃣ Compute FFT -------------------
F = fft2(I);           % 2D Fourier Transform
F_shift = fftshift(F); % Shift zero-frequency to center

[u,v] = meshgrid(-floor(cols/2):floor((cols-1)/2), -floor(rows/2):floor((rows-1)/2));
D = sqrt(u.^2 + v.^2); % Distance from center

%% ------------------- 3️⃣ Low-Pass Filters (Smoothing) -------------------
D0 = 30; % cutoff frequency
n = 2;   % order for Butterworth

% Ideal Low-Pass
H_ideal_LP = double(D <= D0);
I_ideal_LP = real(ifft2(ifftshift(F_shift .* H_ideal_LP)));

% Butterworth Low-Pass
H_butt_LP = 1 ./ (1 + (D./D0).^(2*n));
I_butt_LP = real(ifft2(ifftshift(F_shift .* H_butt_LP)));

% Gaussian Low-Pass
H_gauss_LP = exp(-(D.^2)./(2*D0^2));
I_gauss_LP = real(ifft2(ifftshift(F_shift .* H_gauss_LP)));

figure('Name','Low-Pass Filters','NumberTitle','off');
subplot(2,2,1), imshow(I), title('Original');
subplot(2,2,2), imshow(I_ideal_LP, []), title('Ideal Low-Pass');
subplot(2,2,3), imshow(I_butt_LP, []), title('Butterworth Low-Pass');
subplot(2,2,4), imshow(I_gauss_LP, []), title('Gaussian Low-Pass');

%% ------------------- 4️⃣ High-Pass Filters (Sharpening) -------------------
% High-pass = 1 - Low-pass

% Ideal High-Pass
H_ideal_HP = 1 - H_ideal_LP;
I_ideal_HP = real(ifft2(ifftshift(F_shift .* H_ideal_HP)));

% Butterworth High-Pass
H_butt_HP = 1 - H_butt_LP;
I_butt_HP = real(ifft2(ifftshift(F_shift .* H_butt_HP)));

% Gaussian High-Pass
H_gauss_HP = 1 - H_gauss_LP;
I_gauss_HP = real(ifft2(ifftshift(F_shift .* H_gauss_HP)));

figure('Name','High-Pass Filters','NumberTitle','off');
subplot(2,2,1), imshow(I), title('Original');
subplot(2,2,2), imshow(I_ideal_HP, []), title('Ideal High-Pass');
subplot(2,2,3), imshow(I_butt_HP, []), title('Butterworth High-Pass');
subplot(2,2,4), imshow(I_gauss_HP, []), title('Gaussian High-Pass');

%% ================== Image Restoration & Noise Filtering ==================
% Purpose: Demonstrate image noise types and restoration methods using 
% different spatial and frequency domain filters.
% Methods Included:
% 1. Noise Types: Gaussian, Salt & Pepper, Speckle
% 2. Linear Spatial Filters: Arithmetic Mean, Geometric, Harmonic, Contraharmonic
% 3. Order-Statistic Filters: Median, Max, Min, Midpoint, Alpha-Trimmed Mean
% 4. Frequency Domain Filter: Band-Reject Filter for periodic noise
% 5. Adaptive Filters: Adaptive local and median filters
%
%Notes:
%Spatial Linear Filters:
%    * Arithmetic mean: smooths Gaussian noise.
%    * Geometric mean: better for multiplicative noise.
%    * Harmonic mean: removes salt noise.
%    * Contraharmonic mean: removes salt or pepper depending on Q.
%Order-Statistic Filters:
%    * Median: removes salt & pepper.
%    * Max / Min: emphasize bright/dark points.
%    * Midpoint: removes extremes.
%    * Alpha-trimmed mean: removes extremes while smoothing.
%Frequency Domain Filter:
%    * Band-reject filter removes periodic noise.
%Adaptive Filters:
%    * Wiener2 for local variance adjustment.
%    * Adaptive median preserves edges.
    
%% ------------------- 1️⃣ Load Image -------------------
I = imread('cameraman.tif');
I = im2double(I);

figure('Name','Original Image','NumberTitle','off');
imshow(I), title('Original Image');

%% ------------------- 2️⃣ Add Noise -------------------
I_gauss = imnoise(I,'gaussian',0,0.01);          % Gaussian noise
I_sp   = imnoise(I,'salt & pepper',0.02);       % Salt & Pepper noise
I_speck= imnoise(I,'speckle',0.04);             % Speckle (multiplicative)

figure('Name','Noisy Images','NumberTitle','off');
subplot(1,3,1), imshow(I_gauss), title('Gaussian Noise');
subplot(1,3,2), imshow(I_sp), title('Salt & Pepper Noise');
subplot(1,3,3), imshow(I_speck), title('Speckle Noise');

%% ------------------- 3️⃣ Linear Spatial Filters -------------------
% --- Arithmetic Mean Filter ---
h = fspecial('average',3); % 3x3 averaging kernel
I_arith = imfilter(I_gauss,h,'replicate');

% --- Geometric Mean Filter ---
[m,n] = size(I);
I_geo = zeros(m,n);
for i=2:m-1
    for j=2:n-1
        patch = I_gauss(i-1:i+1,j-1:j+1);
        I_geo(i,j) = exp(mean(log(patch(:)+eps))); % eps to avoid log(0)
    end
end

% --- Harmonic Mean Filter ---
I_harm = zeros(m,n);
for i=2:m-1
    for j=2:n-1
        patch = I_gauss(i-1:i+1,j-1:j+1);
        I_harm(i,j) = 9 / sum(1./(patch(:)+eps));
    end
end

% --- Contraharmonic Mean Filter (Q = 1.5 for pepper noise removal) ---
Q = 1.5;
I_contra = zeros(m,n);
for i=2:m-1
    for j=2:n-1
        patch = I_sp(i-1:i+1,j-1:j+1);
        I_contra(i,j) = sum(patch(:).^(Q+1)) / sum(patch(:).^Q);
    end
end

figure('Name','Linear Filters','NumberTitle','off');
subplot(2,2,1), imshow(I_arith), title('Arithmetic Mean Filter');
subplot(2,2,2), imshow(I_geo), title('Geometric Mean Filter');
subplot(2,2,3), imshow(I_harm), title('Harmonic Mean Filter');
subplot(2,2,4), imshow(I_contra), title('Contraharmonic Filter');

%% ------------------- 4️⃣ Order-Statistic Filters -------------------
% Median Filter (removes salt & pepper noise)
I_median = medfilt2(I_sp,[3 3]);

% Max Filter (emphasizes bright points)
I_max = ordfilt2(I_sp,9,ones(3));

% Min Filter (removes bright noise)
I_min = ordfilt2(I_sp,1,ones(3));

% Midpoint Filter
I_mid = 0.5*(I_max + I_min);

% Alpha-trimmed mean (alpha = 2)
alpha = 2;
I_alpha = zeros(m,n);
for i=2:m-1
    for j=2:n-1
        patch = sort(I_sp(i-1:i+1,j-1:j+1));
        I_alpha(i,j) = mean(patch(alpha+1:end-alpha));
    end
end

figure('Name','Order-Statistic Filters','NumberTitle','off');
subplot(2,3,1), imshow(I_median), title('Median Filter');
subplot(2,3,2), imshow(I_max), title('Max Filter');
subplot(2,3,3), imshow(I_min), title('Min Filter');
subplot(2,3,4), imshow(I_mid), title('Midpoint Filter');
subplot(2,3,5), imshow(I_alpha), title('Alpha-Trimmed Mean');

% Manual (Max, Min, Median, Midpoint)
I_sp = imread('eight.tif');         % Example noisy image
I_sp = im2double(I_sp);             % Convert to double for computation
[rows, cols] = size(I_sp);

padI = padarray(I_sp, [1 1], 'replicate');  % Pad image for 3x3 window

% Initialize output images
I_median_manual = zeros(rows, cols);
I_max_manual    = zeros(rows, cols);
I_min_manual    = zeros(rows, cols);
I_mid_manual    = zeros(rows, cols);

for i = 2:rows+1
    for j = 2:cols+1
        window = padI(i-1:i+1, j-1:j+1);     % Extract 3x3 neighborhood
        vals = window(:);                     % Flatten to 1D
        % Median filter
        I_median_manual(i-1,j-1) = median(vals);
        % Max filter
        I_max_manual(i-1,j-1) = max(vals);
        % Min filter
        I_min_manual(i-1,j-1) = min(vals);
        % Midpoint filter
        I_mid_manual(i-1,j-1) = 0.5 * (max(vals) + min(vals));
    end
end

% Display results
figure;
subplot(2,3,1), imshow(I_sp, []), title('Original Noisy Image');
subplot(2,3,2), imshow(I_median_manual, []), title('Median Filter (Manual)');
subplot(2,3,3), imshow(I_max_manual, []), title('Max Filter (Manual)');
subplot(2,3,4), imshow(I_min_manual, []), title('Min Filter (Manual)');
subplot(2,3,5), imshow(I_mid_manual, []), title('Midpoint Filter (Manual)');

%% ------------------- 5️⃣ Frequency Domain Filter -------------------
% Band-reject filter for periodic noise
I_fft = fft2(I);
I_fft_shift = fftshift(I_fft);

[rows,cols] = size(I);
[u,v] = meshgrid(-floor(cols/2):floor((cols-1)/2), -floor(rows/2):floor((rows-1)/2));
D = sqrt(u.^2 + v.^2);
D0 = 30; W = 10; % reject band radius & width
H = 1./(1 + ((D.*W)./(D.^2 - D0^2 + eps)).^(2)); % Butterworth Band-Reject

I_filt = real(ifft2(ifftshift(I_fft_shift.*H)));

figure('Name','Frequency Domain Filtering','NumberTitle','off');
imshow(I_filt, []), title('Band-Reject Filter Applied');

%% ------------------- 6️⃣ Adaptive Filters -------------------
% Adaptive Local Noise Reduction (mean & variance)
I_adapt = wiener2(I_gauss,[5 5]); % MATLAB built-in adaptive filter

% Adaptive Median Filter (removes salt & pepper noise, preserves edges)
I_adapt_med = medfilt2(I_sp,[5 5]); % window size 5x5

figure('Name','Adaptive Filters','NumberTitle','off');
subplot(1,2,1), imshow(I_adapt), title('Adaptive Local Filter (Wiener)');
subplot(1,2,2), imshow(I_adapt_med), title('Adaptive Median Filter');

%% ================== Points, Lines, and Edges Detection ==================
% Purpose: Detect points, lines, and edges in images.
% Methods included:
%   1. Point Detection (custom kernel)
%   2. Line Detection (custom kernel)
%   3. First-Order Edge Detection: Roberts, Prewitt, Sobel (built-in + manual)
%   4. Second-Order Edge Detection: Laplacian, Laplacian of Gaussian (LoG)
%   5. Edge Enhancement: Laplacian Sharpening
%
% Notes:
% - Point Detection: highlights isolated bright/dark pixels using custom Laplacian kernel.
% - Line Detection: custom kernels detect horizontal and vertical line structures.
% - First-Order Edge Detection: Roberts, Prewitt, Sobel detect gradient magnitude.
% - Second-Order Edge Detection: Laplacian and LoG detect zero-crossings.
% - Edge Enhancement: subtracting Laplacian emphasizes edges in the original image.
% - Manual implementations illustrate convolution and gradient calculations; built-in functions are optimized for speed.

%% ------------------- 1️⃣ Point Detection -------------------
I = imread('rice.png');           % Grayscale image
I = double(I);

% Custom point detection kernel
h_point = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Apply filter
I_points = imfilter(I, h_point, 'replicate');

figure('Name','Point and Line Detection','NumberTitle','off');
subplot(2,3,1), imshow(uint8(I)), title('Original Image');
subplot(2,3,2), imshow(I_points, []), title('Points Detected');

%% ------------------- 2️⃣ Line Detection -------------------
% Custom horizontal line detection kernel
h_line_h = [-1 -1 -1; 2 2 2; -1 -1 -1];
I_lines_h = imfilter(I, h_line_h, 'replicate');

% Vertical lines kernel (transpose of horizontal kernel)
h_line_v = h_line_h';
I_lines_v = imfilter(I, h_line_v, 'replicate');

subplot(2,3,3), imshow(I_lines_h, []), title('Horizontal Lines');
subplot(2,3,4), imshow(I_lines_v, []), title('Vertical Lines');

%% ------------------- 3️⃣ First-Order Edge Detection -------------------
% Built-in edge detection
IE_roberts = edge(I, 'roberts');
IE_prewitt = edge(I, 'prewitt');
IE_sobel   = edge(I, 'sobel');

figure('Name','Built-in Edge Detection','NumberTitle','off');
subplot(2,2,1), imshow(uint8(I)), title('Original Image');
subplot(2,2,2), imshow(IE_roberts), title('Roberts Edge');
subplot(2,2,3), imshow(IE_prewitt), title('Prewitt Edge');
subplot(2,2,4), imshow(IE_sobel), title('Sobel Edge');

% Manual edge detection
I = im2double(imread('cameraman.tif'));
[rows, cols] = size(I);

% Roberts kernels
roberts_x = [-1 0; 0 1];
roberts_y = [0 -1; 1 0];

G_roberts = zeros(rows-1, cols-1);

for i = 1:rows-1
    for j = 1:cols-1
        region = I(i:i+1, j:j+1);
        Gx = sum(sum(region .* roberts_x));
        Gy = sum(sum(region .* roberts_y));
        G_roberts(i,j) = sqrt(Gx^2 + Gy^2);
    end
end

figure;
imshow(G_roberts, []); 
title('Roberts Edge (Manual)');

% Prewitt kernels
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];

G_prewitt = zeros(rows-2, cols-2);

for i = 2:rows-1
    for j = 2:cols-1
        region = I(i-1:i+1, j-1:j+1);
        Gx = sum(sum(region .* prewitt_x));
        Gy = sum(sum(region .* prewitt_y));
        G_prewitt(i-1,j-1) = sqrt(Gx^2 + Gy^2);
    end
end

threshold = 0.15 * max(G_prewitt(:));
BW_prewitt = G_prewitt > threshold;

figure;
subplot(1,2,1), imshow(G_prewitt, []), title('Prewitt Gradient');
subplot(1,2,2), imshow(BW_prewitt), title('Prewitt Binary Edge');

% Sobel kernels
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

G_sobel = zeros(rows-2, cols-2);

for i = 2:rows-1
    for j = 2:cols-1
        region = I(i-1:i+1, j-1:j+1);
        Gx = sum(sum(region .* sobel_x));
        Gy = sum(sum(region .* sobel_y));
        G_sobel(i-1,j-1) = sqrt(Gx^2 + Gy^2);
    end
end

figure;
imshow(G_sobel, []); 
title('Sobel Edge (Manual)');

%% ------------------- 4️⃣ Second-Order Edge Detection -------------------
% Laplacian
I_gray = rgb2gray(imread("peppers.png"));
k_lap = fspecial("laplacian");
I_lap = imfilter(double(I_gray), k_lap, "symmetric");

figure;
subplot(1,2,1), imagesc(I_gray), title('Original Image');
subplot(1,2,2), imagesc(I_lap), colormap("gray"), title('Laplacian');

% Laplacian of Gaussian (LoG)
I_log = double(imread('cameraman.tif'));
h_log = fspecial('log', [7 7], 0.5);  % 7x7 kernel, sigma=0.5
I_log_filtered = imfilter(I_log, h_log, 'replicate');

figure;
subplot(1,2,1), imshow(uint8(I_log)), title('Original Image');
subplot(1,2,2), imshow(I_log_filtered, []), title('Laplacian of Gaussian');

%% ------------------- 5️⃣ Edge Enhancement -------------------
A = im2double(imread("cameraman.tif"));
h_sharp = fspecial("laplacian",0.3);
B = imfilter(A, h_sharp, "replicate");
C = imsubtract(A,B);

figure;
subplot(1,3,1), imshow(A), title('Original Image');
subplot(1,3,2), imshow(B), title('Laplacian');
subplot(1,3,3), imshow(C), title('Edge Sharpened');

%% ===========================  Thresholding  ============================
% Purpose: Demonstrate various thresholding techniques
% Methods included:
%   1. Global thresholding (fixed + Otsu)
%       * A single threshold value is applied to the entire image.
%       * Best when illumination is uniform.
%       * Example: Manual threshold, Otsu's method.
%   2. Local thresholding (adaptive)
%       * Threshold is computed for each pixel based on a local neighborhood.
%       * Useful when lighting is uneven.
%       * MATLAB: adaptthresh + imbinarize.
%   3. Basic adaptive thresholding (local mean)
%       * Similar to local thresholding but simpler rules, e.g., mean or median of neighborhood.
%       * Often called "adaptive mean thresholding".
%   4. Thresholding Using Histogram

I = imread('rice.png');          % Read grayscale image
[n, m] = size(I);

%% Display Original Image
figure;
subplot(2,3,1), imshow(I), title('Original Image');

%% ️ Manual Loop-Based Thresholding
threshold = 125;                 % fixed global threshold
I_loop = I;                       % copy of original
for i = 1:n
    for j = 1:m
        if I_loop(i,j) > threshold
            I_loop(i,j) = 1;      % binary 1
        else
            I_loop(i,j) = 0;      % binary 0
        end
    end
end
subplot(2,3,2), imshow(I_loop, []), title('Manual Thresholding');

%%  Vectorized Thresholding
BW_vector = I > threshold;       % fast, matrix-based
subplot(2,3,3), imshow(BW_vector), title('Vectorized Thresholding');

%%  Global Thresholding (Otsu)
level_otsu = graythresh(I);       % normalized [0,1]
BW_otsu = imbinarize(I, level_otsu);
subplot(2,3,4), imshow(BW_otsu), title('Otsu Thresholding');

%%  Local Thresholding (Adaptive)
T_local = adaptthresh(I, 0.5);   % sensitivity 0.5, default neighborhood 11x11
BW_local = imbinarize(I, T_local);
subplot(2,3,5), imshow(BW_local), title('Local Thresholding (Adaptive)');

%%  Basic Adaptive Thresholding (Local Mean)
window = fspecial('average', [15 15]);   % 15x15 mean filter
local_mean = imfilter(double(I), window, 'replicate');
BW_basic_adapt = I > uint8(local_mean);  % compare pixel to local mean
subplot(2,3,6), imshow(BW_basic_adapt), title('Basic Adaptive (Mean) Threshold');
%% ------------------- Thresholding Using Histogram -------------------
% 1. Histogram-based thresholding is useful when the image has two distinct peaks (bimodal).
% 2. Manual threshold from histogram: select intensity between peaks.
% 3. Otsu's method automates this process by maximizing between-class variance.
% 4. For images with uneven illumination, consider adaptive thresholding.

I = imread('rice.png');          % Read grayscale image
[n, m] = size(I);

%% 1️⃣ Display Original Image and Histogram
figure;
subplot(2,2,1), imshow(I), title('Original Image');

% Compute histogram manually
hist_manual = zeros(1,256);
for i = 1:n
    for j = 1:m
        value = I(i,j);
        hist_manual(value+1) = hist_manual(value+1) + 1; % MATLAB indices start at 1
    end
end

% Plot histogram
subplot(2,2,2)
bar(0:255, hist_manual)
xlabel('Gray Level'), ylabel('Pixel Count')
title('Manual Histogram')

%% 2️⃣ Threshold Selection from Histogram
% Example: pick threshold where histogram valley occurs
% (for rice.png, a typical value is ~100)
threshold_hist = 100;

% Apply threshold
BW_hist = I > threshold_hist;

subplot(2,2,3), imshow(BW_hist), title(['Thresholded Image (T = ' num2str(threshold_hist) ')'])

%% 3️⃣ Automatic Histogram-Based Threshold (Otsu)
level_otsu = graythresh(I);       % normalized [0,1]
BW_otsu = imbinarize(I, level_otsu);

subplot(2,2,4), imshow(BW_otsu), title('Otsu Thresholding (Automatic)')

%% ------------------- --------------------------- -------------------