lab - 06
<pre>
Image Correlation and Convolution. Perform correlation and convolution with different size 
kernel. Check and compare the outputs. 
</pre>
---

## **1. Introduction**

### **Correlation**

* Measures similarity between a kernel (template) and an image region.
* The kernel slides over the image **without flipping**.
* Useful for **template matching**.

Mathematical form for correlation:

$$
R(x,y) = \sum_{i=-m}^m \sum_{j=-n}^n f(x+i, y+j) \cdot h(i,j)
$$

where $f$ is the image, $h$ is the kernel.

---

### **Convolution**

* Similar to correlation, **but the kernel is flipped** both horizontally and vertically before sliding.
* Common in filtering, edge detection, blurring, sharpening.

Mathematical form for convolution:

$$
C(x,y) = \sum_{i=-m}^m \sum_{j=-n}^n f(x+i, y+j) \cdot h(-i,-j)
$$

---

**Key Difference:**

* Convolution = Correlation with a **flipped kernel**.
* For symmetric kernels (e.g., Gaussian blur), convolution and correlation give the same result.

---

## **2. MATLAB Functions**

* **Correlation**:

  * `corr2(A, B)` → scalar correlation coefficient between two matrices
  * `imfilter(image, kernel, 'corr')` → correlation as sliding window
* **Convolution**:

  * `conv2(A, B, 'same')` → convolution keeping same size
  * `imfilter(image, kernel, 'conv')` → convolution using sliding window

---

## **3. Example Kernels**

We can test with:

1. **3×3 averaging kernel** (blur)
2. **5×5 Gaussian kernel** (smoother blur)
3. **3×3 Sobel kernel** (edge detection)

---

## **4. MATLAB Implementation**

```matlab
clc; clear; close all;

% Load grayscale image
img = rgb2gray(imread('peppers.png'));

% Define kernels
avg3 = ones(3,3) / 9;  % 3x3 averaging
avg5 = ones(5,5) / 25; % 5x5 averaging

sobel_x = [-1 0 1; -2 0 2; -1 0 1]; % edge detection in X

% --- Correlation ---
corr_avg3 = imfilter(img, avg3, 'corr', 'replicate');
corr_avg5 = imfilter(img, avg5, 'corr', 'replicate');
corr_sobel = imfilter(img, sobel_x, 'corr', 'replicate');

% --- Convolution ---
conv_avg3 = imfilter(img, avg3, 'conv', 'replicate');
conv_avg5 = imfilter(img, avg5, 'conv', 'replicate');
conv_sobel = imfilter(img, sobel_x, 'conv', 'replicate');

% --- Display results ---
figure('Name','Correlation vs Convolution Comparison');

subplot(3,3,1); imshow(img); title('Original');

subplot(3,3,2); imshow(corr_avg3); title('Correlation 3x3 Avg');
subplot(3,3,3); imshow(conv_avg3); title('Convolution 3x3 Avg');

subplot(3,3,4); imshow(corr_avg5); title('Correlation 5x5 Avg');
subplot(3,3,5); imshow(conv_avg5); title('Convolution 5x5 Avg');

subplot(3,3,6); imshow(corr_sobel, []); title('Correlation Sobel X');
subplot(3,3,7); imshow(conv_sobel, []); title('Convolution Sobel X');

% --- Difference images ---
diff_avg3 = imabsdiff(corr_avg3, conv_avg3);
diff_avg5 = imabsdiff(corr_avg5, conv_avg5);
diff_sobel = imabsdiff(corr_sobel, conv_sobel);

subplot(3,3,8); imshow(diff_avg3, []); title('Diff 3x3');
subplot(3,3,9); imshow(diff_sobel, []); title('Diff Sobel');
```

---

## **5. Observations**

* For **symmetric kernels** (e.g., averaging, Gaussian), convolution and correlation produce **identical results** → difference image is zero.
* For **non-symmetric kernels** (e.g., Sobel), results differ because convolution flips the kernel.
* Larger kernels (5×5) produce **stronger blurring**.
* Sobel convolution gives edge maps with different orientation compared to correlation.

---