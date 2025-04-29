## Lab-2

<pre>
Basic  image  conversation,  RGB  to  gray,  RGB  to  binary,  Gray  to  binary.  Using  built-in 
function, introduction to writing MATLAB script. Conversation using luminosity, chrominosity from RGB to Gray. Converting Gray to Binary using threshold.  Separation of different channels, represent RGB channels separately with their effects. 
</pre>

This expanded guide provides in-depth explanations of image conversion methods, including mathematical foundations, practical implementations, and visual demonstrations of each technique.

## **Table of Contents**

1. **Introduction to Image Representation in MATLAB**
2. **RGB to Grayscale Conversion**
   - Built-in `rgb2gray` Function
   - Luminosity Method (Perceptual Weighting)
   - Chrominance Methods (NTSC vs. Custom Weights)
3. **RGB to Binary Conversion**
   - Direct Thresholding Approach
   - Optimal Threshold Selection Methods
4. **Grayscale to Binary Conversion**
   - Fixed Thresholding
   - Otsu's Automatic Thresholding
   - Adaptive Thresholding
5. **RGB Channel Separation and Analysis**
   - Channel Extraction Techniques
   - Visualizing Individual Channels
   - Channel-Specific Applications
6. **Practical Applications and Examples**
7. **Complete MATLAB Code Implementation**

---

## **1. Introduction to Image Representation in MATLAB**

### **Image Data Structures**

- **RGB Images**: 3D matrix (`height × width × 3`) with values 0-255
- **Grayscale Images**: 2D matrix (`height × width`) with values 0-255
- **Binary Images**: Logical matrix (`height × width`) with values 0 or 1

### **Basic Image Operations**

```matlab
img = imread('peppers.png');       % Read image
imshow(img);                       % Display image
imwrite(img, 'output.png');        % Save image
whos img;                          % Check image properties
```

---

## **2. RGB to Grayscale Conversion**

### **(A) Built-in `rgb2gray` Function**

```matlab
gray_img = rgb2gray(img);
```

- Uses a proprietary weighted combination optimized for MATLAB
- Fastest implementation for general use

### **(B) Luminosity Method (Perceptual Weighting)**

**Mathematical Foundation:**
\[
Y = 0.2989 \times R + 0.5870 \times G + 0.1140 \times B
\]

**Implementation:**

```matlab
R = double(img(:,:,1));  % Red channel
G = double(img(:,:,2));  % Green channel
B = double(img(:,:,3));  % Blue channel

% Apply luminosity weights
gray_lum = 0.2989*R + 0.5870*G + 0.1140*B;
gray_lum = uint8(gray_lum);
```

**Visual Comparison:**

```matlab
figure;
subplot(1,2,1); imshow(rgb2gray(img)); title('Built-in rgb2gray');
subplot(1,2,2); imshow(gray_lum); title('Luminosity Method');
```

### **(C) Chrominance Methods**

**NTSC Standard Weights:**
\[
Y = 0.299 \times R + 0.587 \times G + 0.114 \times B
\]

**Custom Weighted Averages:**

```matlab
% Equal weights (simple average)
gray_avg = (R + G + B)/3;

% Emphasize blue channel
gray_blue = 0.2*R + 0.3*G + 0.5*B;
```

---

## **3. RGB to Binary Conversion**

### **Direct Thresholding Approach**

```matlab
threshold = 128;  % Mid-range value
binary_img = rgb2gray(img) > threshold;
```

**Threshold Selection Methods:**

1. **Fixed Threshold**: Manual selection (0-255)
2. **Percentage Threshold**:
   ```matlab
   threshold = 0.7 * max(img(:));  % 70% of max intensity
   ```
3. **Mean Intensity Threshold**:
   ```matlab
   threshold = mean(img(:));
   ```

---

## **4. Grayscale to Binary Conversion**

### **(A) Fixed Thresholding**

```matlab
threshold = 150;  % Experiment with values
binary_fixed = gray_img > threshold;
```

### **(B) Otsu's Automatic Thresholding**

```matlab
level = graythresh(gray_img);  % Returns normalized threshold (0-1)
binary_otsu = imbinarize(gray_img, level);
```

**How Otsu's Method Works:**

1. Computes histogram of pixel intensities
2. Finds threshold that minimizes intra-class variance
3. Optimal for bimodal distributions

### **(C) Adaptive Thresholding**

```matlab
binary_adapt = imbinarize(gray_img, 'adaptive');
```

---

## **5. RGB Channel Separation and Analysis**

### **Channel Extraction Methods**

```matlab
% Method 1: Direct indexing
R = img(:,:,1); G = img(:,:,2); B = img(:,:,3);

% Method 2: Using imsplit
[R,G,B] = imsplit(img);
```

### **Channel Visualization Techniques**

```matlab
% Create color-highlighted versions
red_channel = img; red_channel(:,:,2:3) = 0;
green_channel = img; green_channel(:,:,[1 3]) = 0;
blue_channel = img; blue_channel(:,:,1:2) = 0;

% Display in subplots
figure;
subplot(2,2,1); imshow(img); title('Original');
subplot(2,2,2); imshow(red_channel); title('Red Channel');
subplot(2,2,3); imshow(green_channel); title('Green Channel');
subplot(2,2,4); imshow(blue_channel); title('Blue Channel');
```

### **Channel-Specific Applications**

| Channel   | Key Characteristics            | Typical Applications                 |
| --------- | ------------------------------ | ------------------------------------ |
| **Red**   | Highlights warm colors         | Skin detection, fire detection       |
| **Green** | Highest luminance contribution | Vegetation analysis, medical imaging |
| **Blue**  | Shows water and skies          | Underwater imaging, sky detection    |

---

## **6. Practical Applications**

### **Example 1: Object Detection by Color**

```matlab
% Detect red objects
red_mask = img(:,:,1) > 150 & img(:,:,2) < 100 & img(:,:,3) < 100;
red_objects = bsxfun(@times, img, cast(red_mask, 'like', img));
imshow(red_objects);
```

### **Example 2: Document Binarization**

```matlab
% Optimal document thresholding
doc_img = imread('document.jpg');
gray_doc = rgb2gray(doc_img);
binary_doc = imbinarize(gray_doc, 'adaptive', 'Sensitivity', 0.7);
imshowpair(gray_doc, binary_doc, 'montage');
```

---

## **7. Complete MATLAB Implementation**

```matlab
% ===== COMPREHENSIVE IMAGE CONVERSION DEMO =====
clc; clear; close all;

% 1. Load and display original image
img = imread('peppers.png');
figure('Name','Original Image','NumberTitle','off');
imshow(img); title('Original RGB Image');

% 2. RGB to Grayscale conversions
gray_builtin = rgb2gray(img);
R = double(img(:,:,1)); G = double(img(:,:,2)); B = double(img(:,:,3));
gray_lum = uint8(0.2989*R + 0.5870*G + 0.1140*B);
gray_ntsc = uint8(0.299*R + 0.587*G + 0.114*B);

% 3. Binary conversions
binary_fixed = gray_builtin > 128;
level = graythresh(gray_builtin);
binary_otsu = imbinarize(gray_builtin, level);

% 4. Channel separation
[R,G,B] = imsplit(img);
red_channel = img; red_channel(:,:,2:3) = 0;
green_channel = img; green_channel(:,:,[1 3]) = 0;
blue_channel = img; blue_channel(:,:,1:2) = 0;

% Display all results
figure('Name','Conversion Results','NumberTitle','off', 'Position',[100 100 1200 800]);

subplot(3,3,1); imshow(img); title('Original RGB');
subplot(3,3,2); imshow(gray_builtin); title('Built-in Grayscale');
subplot(3,3,3); imshow(gray_lum); title('Luminosity Method');
subplot(3,3,4); imshow(gray_ntsc); title('NTSC Weights');
subplot(3,3,5); imshow(binary_fixed); title('Binary (Threshold=128)');
subplot(3,3,6); imshow(binary_otsu); title('Otsu Binary');
subplot(3,3,7); imshow(red_channel); title('Red Channel');
subplot(3,3,8); imshow(green_channel); title('Green Channel');
subplot(3,3,9); imshow(blue_channel); title('Blue Channel');
```

---

## **Key Takeaways**

1. **Conversion Methods**: MATLAB offers multiple approaches with different perceptual results
2. **Threshold Selection**: Critical for binary conversion quality
3. **Channel Analysis**: Essential for color-based computer vision tasks
4. **Performance Considerations**: Built-in functions are optimized for speed

**Further Exploration:**

- Experiment with different weighting schemes
- Try combining channels for specific applications
- Explore edge detection on different color spaces

---

## Lab-3

<pre>
Image  transformation  using  log  transformation,  linear  transformation,  power  law transformation, negative image generate. Differentiate different types of transformation and their performance evaluation. Real world application like medical image processing (X-ray imaging). 
</pre>

This guide explores four fundamental image transformation techniques with mathematical foundations, MATLAB implementations, performance evaluations, and real-world medical imaging applications.

## **1. Transformation Types and Mathematical Foundations**

### **(A) Log Transformation**

**Formula:**

```
s = c * log(1 + r)
```

- **Purpose**: Enhances dark regions while compressing bright ones
- **Parameters**:
  - `c`: Scaling constant (typically `255/log(256)`)
  - `r`: Input pixel value (normalized to [0,1])

**MATLAB Implementation:**

```matlab
img = im2double(imread('dark_image.png'));
c = 1;  % Scaling factor
log_transformed = c * log(1 + img);
```

### **(B) Linear Transformation**

**Formula:**

```
s = a * r + b
```

- **Purpose**: Adjusts brightness (`b`) and contrast (`a`)
- **Special Cases**:
  - **Identity**: `a=1, b=0`
  - **Negative**: `a=-1, b=255`

**MATLAB Implementation:**

```matlab
a = 1.5;  % Contrast enhancement
b = 30;   % Brightness adjustment
linear_transformed = a * img + b;
linear_transformed = min(max(linear_transformed, 0), 1);  % Clamp to [0,1]
```

### **(C) Power-Law (Gamma) Transformation**

**Formula:**

```
s = c * r^γ
```

- **Purpose**:
  - γ < 1: Brightens dark regions
  - γ > 1: Darkens bright regions
- **Applications**: Monitor calibration, medical imaging

**MATLAB Implementation:**

```matlab
gamma = 0.5;  % Try 0.5-2.5
power_transformed = img.^gamma;
```

### **(D) Negative Transformation**

**Formula:**

```
s = L - 1 - r
```

- **Purpose**: Inverts intensity values
- **Where `L`**: Maximum intensity (255 for 8-bit)

**MATLAB Implementation:**

```matlab
negative_img = 1 - img;  % For [0,1] normalized image
```

---

## **2. Performance Evaluation Metrics**

| Transformation | Computational Cost      | Memory Usage | Qualitative Effect          |
| -------------- | ----------------------- | ------------ | --------------------------- |
| **Log**        | Low                     | Low          | Reveals dark details        |
| **Linear**     | Very Low                | Very Low     | Adjusts contrast/brightness |
| **Power-Law**  | Medium (exponentiation) | Low          | Non-linear enhancement      |
| **Negative**   | Lowest                  | Lowest       | Intensity inversion         |

**Quantitative Metrics:**

```matlab
% Calculate PSNR (Peak Signal-to-Noise Ratio)
orig = im2double(imread('original.png'));
transformed = log_transformed;  % Replace with other transforms
psnr_val = psnr(transformed, orig);
disp(['PSNR: ', num2str(psnr_val), ' dB']);

% Calculate SSIM (Structural Similarity)
ssim_val = ssim(transformed, orig);
disp(['SSIM: ', num2str(ssim_val)]);
```

---

## **3. Medical Imaging (X-ray) Case Study**

### **Problem Statement**

Enhance low-contrast chest X-rays to improve pneumonia detection.

### **Transformations Compared**

1. **Original X-ray**: Often has poor contrast in lung regions
2. **Log Transform**: Reveals subtle textures in dark lung areas
3. **Gamma Correction (γ=0.6)**: Brightens lung fields without overexposing bones
4. **Adaptive Histogram Equalization**: Alternative for comparison

**MATLAB Implementation:**

```matlab
xray = im2double(imread('chest_xray.png'));

% (A) Log Transform
c = 1.5;
log_xray = c * log(1 + xray);

% (B) Gamma Correction
gamma_xray = xray.^0.6;

% (C) CLAHE for comparison
clahe_xray = adapthisteq(xray);

% Display results
figure;
subplot(2,2,1); imshow(xray); title('Original X-ray');
subplot(2,2,2); imshow(log_xray); title('Log Transform (c=1.5)');
subplot(2,2,3); imshow(gamma_xray); title('Gamma (γ=0.6)');
subplot(2,2,4); imshow(clahe_xray); title('CLAHE');
```

**Clinical Findings:**

- **Log Transform**: Best for enhancing lung parenchyma texture
- **Gamma (0.6)**: Preserves bone details while improving soft tissue visibility
- **CLAHE**: Sometimes over-enhances noise in medical images

---

## **4. Complete MATLAB Code**

```matlab
% ===== IMAGE TRANSFORMATION DEMO =====
clc; clear; close all;

% 1. Load image
img = im2double(imread('sample.png'));
figure('Name','Transformations','Position',[100 100 1200 600]);

% 2. Apply transformations
% (A) Log Transform
c_log = 1.2;
log_img = c_log * log(1 + img);

% (B) Linear Transform
a = 1.8; b = -0.2;
linear_img = a * img + b;
linear_img = min(max(linear_img, 0), 1);

% (C) Power-Law Transform
gamma = 0.4;
power_img = img.^gamma;

% (D) Negative
negative_img = 1 - img;

% 3. Display results
subplot(2,4,1); imshow(img); title('Original');
subplot(2,4,2); imshow(log_img); title(['Log (c=',num2str(c_log),')']);
subplot(2,4,3); imshow(linear_img);
title(['Linear (a=',num2str(a),', b=',num2str(b),')']);
subplot(2,4,4); imshow(power_img);
title(['Power (γ=',num2str(gamma),')']);
subplot(2,4,5); imshow(negative_img); title('Negative');

% 4. Performance Metrics
metrics = {'PSNR','SSIM','MSE'};
original = img;
results = zeros(4,3);

results(1,:) = [psnr(log_img,original), ssim(log_img,original), immse(log_img,original)];
results(2,:) = [psnr(linear_img,original), ssim(linear_img,original), immse(linear_img,original)];
results(3,:) = [psnr(power_img,original), ssim(power_img,original), immse(power_img,original)];
results(4,:) = [psnr(negative_img,original), ssim(negative_img,original), immse(negative_img,original)];

% Display metrics
disp('Performance Metrics:');
disp(array2table(results,'VariableNames',metrics,...
    'RowNames',{'Log','Linear','Power','Negative'}));
```

---

## **5. Key Takeaways**

| Transformation | Best For                    | Medical Use Case             | Limitations                         |
| -------------- | --------------------------- | ---------------------------- | ----------------------------------- |
| **Log**        | Dark image enhancement      | Lung texture analysis        | May over-enhance noise              |
| **Linear**     | Quick contrast adjustment   | General contrast improvement | Global effect (no local adaptation) |
| **Power-Law**  | Non-linear enhancement      | Bone vs. soft tissue balance | Requires γ tuning                   |
| **Negative**   | Highlight inverted features | Dental X-ray analysis        | Limited diagnostic value            |

**Clinical Recommendation**: Gamma correction (γ≈0.5-0.7) often provides the best balance for chest X-rays, while log transforms excel for MRI dark region enhancement.

---
