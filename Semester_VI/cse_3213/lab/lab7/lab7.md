lab - 07
<pre>
Introduction to different image quality measurement algorithm like MSE, PSNR. Adding 
noise  manually,  measure  such  scale  then  perform  noise  remove  using  different  kernels. 
Compare reconstructed image quality. </pre>
---

## **1. Introduction to MSE & PSNR**

### **Mean Squared Error (MSE)**

The MSE measures the average squared difference between the original image and a reconstructed image.

If:

* $I_{orig}(i,j)$ = original image pixel value
* $I_{rec}(i,j)$ = reconstructed (processed) image pixel value
* $m, n$ = dimensions of image

**Formula:**

$$
MSE = \frac{1}{m \times n} \sum_{i=1}^m \sum_{j=1}^n \left[ I_{orig}(i,j) - I_{rec}(i,j) \right]^2
$$

---

### **Peak Signal-to-Noise Ratio (PSNR)**

PSNR measures image quality in **dB (decibels)**, higher values mean better quality.

**Formula:**

$$
PSNR = 10 \cdot \log_{10} \left( \frac{MAX_I^2}{MSE} \right)
$$

where $MAX_I$ = maximum pixel value (for 8-bit images, $MAX_I = 255$).

---

## **2. Adding Noise Manually**

We will:

1. Add Gaussian noise
2. Add Salt & Pepper noise
3. Measure MSE and PSNR

---

## **3. Removing Noise**

We will:

* Use **Average filter**
* Use **Median filter**
* Compare results

---

## **4. MATLAB Script**

```matlab
clc; clear; close all;

% Read original image
orig = imread('peppers.png');
gray = rgb2gray(orig);

% Add Gaussian Noise
gauss_noisy = imnoise(gray, 'gaussian', 0, 0.01);

% Add Salt & Pepper Noise
sp_noisy = imnoise(gray, 'salt & pepper', 0.02);

% ----- Define MSE Function -----
mse_func = @(A,B) mean((double(A(:)) - double(B(:))).^2);

% ----- Define PSNR Function -----
psnr_func = @(A,B) 10 * log10(255^2 / mse_func(A,B));

% Measure Quality for Noisy Images
mse_gauss = mse_func(gray, gauss_noisy);
psnr_gauss = psnr_func(gray, gauss_noisy);

mse_sp = mse_func(gray, sp_noisy);
psnr_sp = psnr_func(gray, sp_noisy);

fprintf('Gaussian Noise -> MSE: %.2f, PSNR: %.2f dB\n', mse_gauss, psnr_gauss);
fprintf('Salt & Pepper Noise -> MSE: %.2f, PSNR: %.2f dB\n', mse_sp, psnr_sp);

% ----- Noise Removal -----
% Average Filter (Gaussian noise removal attempt)
h = fspecial('average', [3 3]);
gauss_filtered = imfilter(gauss_noisy, h);

% Median Filter (Salt & Pepper noise removal)
sp_filtered = medfilt2(sp_noisy, [3 3]);

% Measure Quality After Filtering
mse_gauss_f = mse_func(gray, gauss_filtered);
psnr_gauss_f = psnr_func(gray, gauss_filtered);

mse_sp_f = mse_func(gray, sp_filtered);
psnr_sp_f = psnr_func(gray, sp_filtered);

fprintf('Gaussian Filtered -> MSE: %.2f, PSNR: %.2f dB\n', mse_gauss_f, psnr_gauss_f);
fprintf('Salt & Pepper Filtered -> MSE: %.2f, PSNR: %.2f dB\n', mse_sp_f, psnr_sp_f);

% ----- Display -----
figure;
subplot(2,3,1), imshow(gray), title('Original Gray');
subplot(2,3,2), imshow(gauss_noisy), title('Gaussian Noise');
subplot(2,3,3), imshow(sp_noisy), title('Salt & Pepper Noise');
subplot(2,3,4), imshow(gauss_filtered), title('Gaussian Noise Removed');
subplot(2,3,5), imshow(sp_filtered), title('Salt & Pepper Noise Removed');
```

---

## **5. Expected Output & Observations**

* Gaussian noise is better handled by **average (mean) filters**.
* Salt & Pepper noise is best removed with a **median filter**.
* After filtering, MSE should **decrease**, and PSNR should **increase** compared to noisy images.

---