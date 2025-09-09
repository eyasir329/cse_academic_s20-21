lab - 03
<pre>Basic  image  conversation,  RGB  to  gray,  RGB  to  binary,  Gray  to  binary.  Using  built-in 
function, introduction to writing MATLAB script. Conversation using luminosity, chrominosity from RGB to Gray. Converting Gray to Binary using threshold.  Separation of different channels, represent RGB channels separately with their effects. 
</pre>
---

## **1. Introduction: Image Representation in MATLAB**

### RGB Image

* An RGB image has **three color channels**: **Red**, **Green**, and **Blue**.
* MATLAB stores it as a **3D matrix**:

  ```
  rgb_image(row, col, channel)
  ```

  where:

  * channel = 1 → Red
  * channel = 2 → Green
  * channel = 3 → Blue

### Grayscale Image

* Only **intensity information**, no color.
* Stored as a **2D matrix**.
* Pixel values:

  * 0 = black
  * 255 = white (if `uint8` image)

### Binary Image

* Only **two levels**: black (0) and white (1).
* Useful for segmentation, object detection.

---

## **2. RGB → Gray Conversion**

### (a) **Built-in Function**

MATLAB has:

```matlab
gray_img = rgb2gray(rgb);
```

It internally uses a **luminosity formula** based on **human eye sensitivity**:

$$
Gray = 0.2989 \cdot R + 0.5870 \cdot G + 0.1140 \cdot B
$$

* Green gets the highest weight because the human eye is most sensitive to green.
* This is **luminosity**, not just average — it’s more realistic.

---

### (b) **Manual Luminosity Formula**

```matlab
R = rgb(:,:,1);
G = rgb(:,:,2);
B = rgb(:,:,3);
gray_manual = 0.2989*R + 0.5870*G + 0.1140*B;
```

---

### (c) **Chrominance Discussion**

Chrominance refers to **color information** (Cb, Cr in YCbCr color space).
If you convert RGB to **YCbCr**:

* **Y** = Luminance (similar to Gray)
* **Cb, Cr** = Chrominance (blue & red differences)

Example:

```matlab
ycbcr_img = rgb2ycbcr(rgb);
Y = ycbcr_img(:,:,1); % Luminance channel
```

The **Y** channel is similar to grayscale but comes from a color space that explicitly separates brightness from color.

---

## **3. Gray → Binary Conversion**

### (a) **Built-in Thresholding**

```matlab
binary_img = imbinarize(gray_img); % Otsu’s method
```

Otsu’s method **automatically** finds a threshold that best separates foreground and background.

---

### (b) **Manual Thresholding**

```matlab
T = 128; % any value between 0 and 255
binary_manual = gray_img > T;
```

Here:

* Pixels > T → white (1)
* Pixels ≤ T → black (0)

---

## **4. RGB → Binary**

Usually done in two steps:

```matlab
binary_from_rgb = imbinarize(rgb2gray(rgb));
```

---

## **5. Separating RGB Channels**

### (a) **Extract channels**

```matlab
R = rgb(:,:,1);
G = rgb(:,:,2);
B = rgb(:,:,3);
```

### (b) **Show each channel in grayscale**

```matlab
subplot(1,3,1); imshow(R); title('Red Channel');
subplot(1,3,2); imshow(G); title('Green Channel');
subplot(1,3,3); imshow(B); title('Blue Channel');
```

### (c) **Show the effect of keeping one channel only**

```matlab
zero_channel = zeros(size(R), 'uint8');

red_only   = cat(3, R, zero_channel, zero_channel);
green_only = cat(3, zero_channel, G, zero_channel);
blue_only  = cat(3, zero_channel, zero_channel, B);

figure;
subplot(1,3,1); imshow(red_only); title('Red Only');
subplot(1,3,2); imshow(green_only); title('Green Only');
subplot(1,3,3); imshow(blue_only); title('Blue Only');
```

---

## **6. Complete MATLAB Script**

Save as `image_conversion_demo.m`:

```matlab
clc; clear; close all;

% Load an RGB image
rgb = imread('peppers.png');

% --- RGB to Gray ---
gray_builtin = rgb2gray(rgb); % Built-in
R = rgb(:,:,1); G = rgb(:,:,2); B = rgb(:,:,3);
gray_manual = uint8(0.2989*R + 0.5870*G + 0.1140*B); % Luminosity

% --- Chrominance Method (Y from YCbCr) ---
ycbcr_img = rgb2ycbcr(rgb);
Y_channel = ycbcr_img(:,:,1);

% --- Gray to Binary ---
binary_auto = imbinarize(gray_builtin); % Otsu
T = 128;
binary_manual = gray_builtin > T;

% --- RGB to Binary ---
binary_from_rgb = imbinarize(rgb2gray(rgb));

% --- Channel Separation ---
zero_channel = zeros(size(R), 'uint8');
red_only   = cat(3, R, zero_channel, zero_channel);
green_only = cat(3, zero_channel, G, zero_channel);
blue_only  = cat(3, zero_channel, zero_channel, B);

% --- Display ---
figure('Name','Image Conversion Demo');
subplot(3,4,1); imshow(rgb); title('Original RGB');
subplot(3,4,2); imshow(gray_builtin); title('Gray (Built-in)');
subplot(3,4,3); imshow(gray_manual); title('Gray (Luminosity)');
subplot(3,4,4); imshow(Y_channel); title('Y from YCbCr');

subplot(3,4,5); imshow(binary_auto); title('Binary (Otsu)');
subplot(3,4,6); imshow(binary_manual); title(['Binary (T=',num2str(T),')']);
subplot(3,4,7); imshow(binary_from_rgb); title('Binary from RGB');
subplot(3,4,8); imshow(R); title('Red Channel (Gray)');

subplot(3,4,9); imshow(G); title('Green Channel (Gray)');
subplot(3,4,10); imshow(B); title('Blue Channel (Gray)');
subplot(3,4,11); imshow(red_only); title('Red Only Effect');
subplot(3,4,12); imshow(green_only); title('Green Only Effect');
```

Run:

```matlab
image_conversion_demo
```

---

## **7. What You’ll Observe**

* **Luminosity vs Average**: Luminosity preserves brightness perception better.
* **Y Channel**: Looks like grayscale but derived from a different color space.
* **Binary Threshold**: Changing `T` drastically changes which parts are white/black.
* **Channel Effects**: Red-only image shows only red objects correctly; others appear dark.

---