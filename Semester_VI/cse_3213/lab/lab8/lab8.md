lab - 08
<pre>Color Space, color space conversation, RGB to CIE Lab, CIE Luv color space conversation.</pre>
---

## **1. Color Spaces Overview**

A **color space** is a mathematical model describing the way colors can be represented as numbers (tuples).

* **RGB (Red, Green, Blue)**
  Additive color model used in displays.
  Each pixel = (R, G, B) values in \[0, 255] or normalized \[0, 1].

* **CIE Lab**
  Perceptually uniform color space designed to approximate human vision.

  * **L\***: Lightness (0 → black, 100 → white)
  * **a\***: Green (−) to Red (+)
  * **b\***: Blue (−) to Yellow (+)
    Advantages: device-independent, good for measuring color difference (ΔE).

* **CIE Luv**
  Similar to Lab but used more for applications like chromaticity diagrams and lightness-related processing.

---

## **2. RGB → CIE Lab Conversion (MATLAB Built-in)**

MATLAB provides **`rgb2lab()`** in the Image Processing Toolbox.

```matlab
% Read Image
rgbImage = imread('peppers.png');

% Convert to Lab
labImage = rgb2lab(rgbImage);

% Extract Channels
L = labImage(:,:,1);  % Lightness
a = labImage(:,:,2);  % Green-Red
b = labImage(:,:,3);  % Blue-Yellow

% Display
figure;
subplot(2,2,1), imshow(rgbImage), title('RGB Image');
subplot(2,2,2), imshow(L, []), title('L* Channel');
subplot(2,2,3), imshow(a, []), title('a* Channel');
subplot(2,2,4), imshow(b, []), title('b* Channel');
```

---

## **3. RGB → CIE Luv Conversion (MATLAB Built-in)**

MATLAB’s **`colorspace`** function (from the File Exchange) or **`rgb2xyz` → xyz2luv** conversion can be used.

```matlab
% Read Image
rgbImage = im2double(imread('peppers.png'));

% Convert RGB to XYZ
xyzImage = rgb2xyz(rgbImage);

% Convert XYZ to Luv
luvImage = xyz2luv(xyzImage);

% Display
figure;
subplot(1,3,1), imshow(luvImage(:,:,1), []), title('L* Channel');
subplot(1,3,2), imshow(luvImage(:,:,2), []), title('u* Channel');
subplot(1,3,3), imshow(luvImage(:,:,3), []), title('v* Channel');
```

---

## **4. Manual RGB → Lab Conversion (for Understanding)**

Conversion process:

1. Normalize RGB to \[0, 1].
2. Convert RGB → XYZ (device-independent space).
3. Convert XYZ → Lab using CIE formulas.

```matlab
function labImage = rgb2lab_manual(rgbImage)
    % Step 1: Normalize
    rgbImage = im2double(rgbImage);

    % sRGB to XYZ matrix (D65 illuminant)
    M = [0.4124564 0.3575761 0.1804375;
         0.2126729 0.7151522 0.0721750;
         0.0193339 0.1191920 0.9503041];
     
    % Apply gamma correction (sRGB)
    mask = rgbImage <= 0.04045;
    rgbImage(mask) = rgbImage(mask) / 12.92;
    rgbImage(~mask) = ((rgbImage(~mask) + 0.055) / 1.055) .^ 2.4;

    % Reshape for matrix multiplication
    [rows, cols, ~] = size(rgbImage);
    rgbReshaped = reshape(rgbImage, [], 3);
    xyzReshaped = rgbReshaped * M';
    
    % Normalize for D65 white point
    whitePoint = [0.95047, 1.00000, 1.08883];
    xyzReshaped = bsxfun(@rdivide, xyzReshaped, whitePoint);

    % XYZ → Lab
    f = @(t) (t > 0.008856) .* (t .^ (1/3)) + (t <= 0.008856) .* (7.787 .* t + 16/116);
    fX = f(xyzReshaped(:,1));
    fY = f(xyzReshaped(:,2));
    fZ = f(xyzReshaped(:,3));

    L = (116 .* fY) - 16;
    a = 500 .* (fX - fY);
    b = 200 .* (fY - fZ);

    % Reshape back to image
    labImage = reshape([L, a, b], rows, cols, 3);
end
```

---

## **5. Visualization: Comparing Color Spaces**

```matlab
rgbImage = imread('peppers.png');
labImage = rgb2lab(rgbImage);

figure;
subplot(1,2,1), imshow(rgbImage), title('RGB');
subplot(1,2,2), imshow(labImage(:,:,1)/100), title('L* Lightness Channel');
```

---

## **6. Applications**

* **Lab**: Color difference measurement, color-based segmentation.
* **Luv**: 3D rendering, lighting simulations.
* **XYZ**: Standard reference for all other color spaces.

---