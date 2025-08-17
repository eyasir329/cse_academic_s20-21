lab - 05
<pre>Introduction  to  image  noise:  Gaussian  noise,  salt  and  pepper  noise,  additive,  impulse, 
multiplicative. Adding noise manually detects and compare with respect to image histogram.
</pre>

--- 

## **1. Introduction to Image Noise**

Noise is **unwanted random variation** in pixel values.
It usually comes from:

* Sensors (thermal noise, shot noise)
* Transmission errors
* Environmental interference

---

### **Common Noise Types**

| Noise Type         | Description                                                      | Mathematical Model        | MATLAB Built-in                               |
| ------------------ | ---------------------------------------------------------------- | ------------------------- | --------------------------------------------- |
| **Gaussian**       | Random noise following normal distribution (mean μ, variance σ²) | $n \sim N(\mu, \sigma^2)$ | `imnoise(img, 'gaussian', mean, var)`         |
| **Salt & Pepper**  | Random pixels set to **min** (pepper) or **max** (salt)          | Impulse distribution      | `imnoise(img, 'salt & pepper', density)`      |
| **Additive**       | Noise added directly to the image                                | $g = f + n$               | Gaussian/Additive White Gaussian Noise (AWGN) |
| **Impulse**        | General name for sudden spikes in intensity (S\&P is a type)     |                           | S\&P noise                                    |
| **Multiplicative** | Noise proportional to pixel value                                | $g = f \cdot n$           | `imnoise(img, 'speckle', var)`                |

---

## **2. Adding Noise — MATLAB Methods**

### **(a) Gaussian Noise**

**Built-in**

```matlab
gauss_builtin = imnoise(img, 'gaussian', 0, 0.01); % mean=0, var=0.01
```

**Manual**

```matlab
mean_val = 0; var_val = 0.01;
noise = sqrt(var_val) * randn(size(img)) + mean_val;
gauss_manual = im2double(img) + noise;
gauss_manual = im2uint8(mat2gray(gauss_manual));
```

---

### **(b) Salt & Pepper Noise**

**Built-in**

```matlab
sp_builtin = imnoise(img, 'salt & pepper', 0.05); % 5% noise
```

**Manual**

```matlab
density = 0.05;
sp_manual = img;
num_pixels = numel(img);
num_salt = round(density * num_pixels / 2);
num_pepper = num_salt;

% Salt (white pixels)
coords = randperm(num_pixels, num_salt);
sp_manual(coords) = 255;

% Pepper (black pixels)
coords = randperm(num_pixels, num_pepper);
sp_manual(coords) = 0;
```

---

### **(c) Multiplicative Noise (Speckle)**

**Built-in**

```matlab
speckle_builtin = imnoise(img, 'speckle', 0.04); % var=0.04
```

**Manual**

```matlab
var_val = 0.04;
noise = var_val * randn(size(img));
speckle_manual = im2double(img) .* (1 + noise);
speckle_manual = im2uint8(mat2gray(speckle_manual));
```

---

### **(d) Additive Noise**

* This is just original image + random noise (uniform or Gaussian)

```matlab
noise = uint8(20*randn(size(img))); % ±20 intensity variation
additive_manual = img + noise;
```

---

## **3. Histogram Analysis**

Noise changes the histogram by **spreading pixel intensities**.

Example code to compare histograms:

```matlab
function compare_histograms(original, noisy, title_str)
    figure;
    subplot(1,2,1); imshow(noisy); title([title_str ' Image']);
    subplot(1,2,2); imhist(noisy); title([title_str ' Histogram']);
end
```

---

## **4. Full MATLAB Script**

```matlab
clc; clear; close all;

% Read grayscale image
img = rgb2gray(imread('peppers.png'));

% --- Gaussian Noise ---
gauss_builtin = imnoise(img, 'gaussian', 0, 0.01);
mean_val = 0; var_val = 0.01;
noise = sqrt(var_val) * randn(size(img)) + mean_val;
gauss_manual = im2uint8(mat2gray(im2double(img) + noise));

% --- Salt & Pepper Noise ---
sp_builtin = imnoise(img, 'salt & pepper', 0.05);
sp_manual = img;
num_pixels = numel(img);
num_salt = round(0.05 * num_pixels / 2);
num_pepper = num_salt;
coords_salt = randperm(num_pixels, num_salt);
coords_pepper = randperm(num_pixels, num_pepper);
sp_manual(coords_salt) = 255;
sp_manual(coords_pepper) = 0;

% --- Multiplicative (Speckle) Noise ---
speckle_builtin = imnoise(img, 'speckle', 0.04);
noise = 0.04 * randn(size(img));
speckle_manual = im2uint8(mat2gray(im2double(img) .* (1 + noise)));

% --- Additive Noise ---
noise = uint8(20*randn(size(img)));
additive_manual = img + noise;

% --- Display & Compare ---
figure('Name','Noise Types Comparison');
subplot(4,3,1); imshow(img); title('Original');
subplot(4,3,2); imshow(gauss_builtin); title('Gaussian Built-in');
subplot(4,3,3); imshow(gauss_manual); title('Gaussian Manual');

subplot(4,3,4); imshow(sp_builtin); title('S&P Built-in');
subplot(4,3,5); imshow(sp_manual); title('S&P Manual');

subplot(4,3,6); imshow(speckle_builtin); title('Speckle Built-in');
subplot(4,3,7); imshow(speckle_manual); title('Speckle Manual');

subplot(4,3,8); imshow(additive_manual); title('Additive Manual');
subplot(4,3,9); imhist(additive_manual); title('Additive Hist');

% --- Histogram Comparison ---
figure('Name','Histogram Effects');
subplot(2,3,1); imhist(img); title('Original');
subplot(2,3,2); imhist(gauss_manual); title('Gaussian');
subplot(2,3,3); imhist(sp_manual); title('Salt & Pepper');
subplot(2,3,4); imhist(speckle_manual); title('Speckle');
subplot(2,3,5); imhist(additive_manual); title('Additive');
```

---

## **5. Observations**

* **Gaussian noise** widens the histogram smoothly on both sides.
* **Salt & Pepper** creates spikes at 0 and 255.
* **Multiplicative noise** affects brighter areas more (histogram stretches towards edges).
* **Additive noise** shifts the histogram without changing its overall shape drastically.

---