lab - 04

<pre>Image Histogram: Histogram representation, histogram stretching, histogram equalization, histogram  matching  with  user-defined  function.  These  user  defined  functions  would  be evaluated with respect to the built-in function.</pre>
---

## **1. Image Histogram — Concept**

* A histogram in image processing shows the **frequency distribution** of pixel intensities.
* **X-axis** = intensity levels (0–255 for 8-bit images)
* **Y-axis** = number of pixels at each intensity

### **Built-in in MATLAB**

```matlab
imhist(image);
```

### **User-defined Histogram**

```matlab
function hist_vals = my_histogram(img)
    img = uint8(img);
    hist_vals = zeros(1,256);
    for i = 0:255
        hist_vals(i+1) = sum(img(:) == i);
    end
end
```

---

## **2. Histogram Stretching (Contrast Stretching)**

### **Concept**

* Expands pixel values to span the full range \[0, 255]
* Formula:

$$
I_{new} = \frac{(I - I_{min})}{I_{max} - I_{min}} \times 255
$$

### **Built-in**

```matlab
stretched_builtin = imadjust(img, stretchlim(img), []);
```

### **User-defined**

```matlab
function stretched = my_hist_stretch(img)
    img = double(img);
    Imin = min(img(:));
    Imax = max(img(:));
    stretched = uint8( (img - Imin) / (Imax - Imin) * 255 );
end
```

---

## **3. Histogram Equalization**

### **Concept**

* Redistributes intensities so histogram is more uniform.
* Uses **Cumulative Distribution Function (CDF)**.

### **Built-in**

```matlab
equalized_builtin = histeq(img);
```

### **User-defined**

```matlab
function equalized = my_histeq(img)
    img = uint8(img);
    hist_vals = my_histogram(img);
    cdf = cumsum(hist_vals) / numel(img); % normalize
    equalized = uint8(255 * cdf(double(img)+1));
end
```

---

## **4. Histogram Matching (Specification)**

### **Concept**

* Modifies image histogram to match a **reference image**’s histogram.

### **Built-in**

```matlab
matched_builtin = imhistmatch(img, ref_img);
```

### **User-defined**

```matlab
function matched = my_hist_match(img, ref_img)
    img = uint8(img);
    ref_img = uint8(ref_img);
    
    % Hist & CDF for input and reference
    hist_img = my_histogram(img);
    cdf_img = cumsum(hist_img) / numel(img);
    
    hist_ref = my_histogram(ref_img);
    cdf_ref = cumsum(hist_ref) / numel(ref_img);
    
    % Mapping
    mapping = zeros(256,1,'uint8');
    for i = 1:256
        [~, idx] = min(abs(cdf_img(i) - cdf_ref));
        mapping(i) = idx-1;
    end
    
    matched = mapping(double(img)+1);
end
```

---

## **5. Complete MATLAB Script**

```matlab
clc; clear; close all;

% Load grayscale image
img = rgb2gray(imread('peppers.png'));
ref_img = rgb2gray(imread('cameraman.tif'));

% --- Histogram Representation ---
hist_user = my_histogram(img);

figure;
subplot(2,2,1); imshow(img); title('Original Image');
subplot(2,2,2); imhist(img); title('Built-in Histogram');
subplot(2,2,3); bar(0:255, hist_user); title('User-defined Histogram');
subplot(2,2,4); plot(cumsum(hist_user)); title('CDF');

% --- Histogram Stretching ---
stretch_user = my_hist_stretch(img);
stretch_builtin = imadjust(img, stretchlim(img), []);

% --- Histogram Equalization ---
equal_user = my_histeq(img);
equal_builtin = histeq(img);

% --- Histogram Matching ---
match_user = my_hist_match(img, ref_img);
match_builtin = imhistmatch(img, ref_img);

% --- Display ---
figure('Name','Comparison of Methods');
subplot(3,3,1); imshow(img); title('Original');
subplot(3,3,2); imshow(stretch_builtin); title('Stretch Built-in');
subplot(3,3,3); imshow(stretch_user); title('Stretch User');

subplot(3,3,4); imshow(equal_builtin); title('Equalization Built-in');
subplot(3,3,5); imshow(equal_user); title('Equalization User');
subplot(3,3,6); imshow(ref_img); title('Reference Image');

subplot(3,3,7); imshow(match_builtin); title('Match Built-in');
subplot(3,3,8); imshow(match_user); title('Match User');
```

---

## **6. Observations**

* **Histogram Stretching** increases contrast but may cause noise enhancement.
* **Histogram Equalization** improves contrast in darker/brighter images but can cause over-enhancement.
* **Histogram Matching** is useful when you want one image to have the same tonal distribution as another.
* Comparing **user-defined** vs **built-in** lets you verify understanding and detect implementation errors.

---