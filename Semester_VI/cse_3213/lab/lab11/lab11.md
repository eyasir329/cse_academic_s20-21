lab - 11
<pre>
Introduction to mid-level image processing with different attributes as output.  
</pre>
---

## **1. What is Mid-Level Image Processing?**

Mid-level image processing is the stage **between low-level processing (basic operations like filtering, noise removal, RGB→Gray)** and **high-level processing (object recognition, scene understanding)**.

It focuses on **extracting meaningful features and attributes** from images.

**Examples of mid-level tasks:**

* Edge detection
* Region segmentation
* Texture analysis
* Shape detection
* Feature extraction (corners, blobs)
* Morphological operations

---

## **2. Common Attributes Extracted**

| Attribute Type        | MATLAB Functions / Methods                 | Description                                            |
| --------------------- | ------------------------------------------ | ------------------------------------------------------ |
| **Edges**             | `edge`, `imgradient`, `imgradientxy`       | Detect boundaries between objects                      |
| **Regions / Objects** | `regionprops`, `bwlabel`, `imbinarize`     | Extract area, centroid, bounding box, orientation      |
| **Texture**           | `graycomatrix`, `graycoprops`              | Analyze co-occurrence, contrast, correlation           |
| **Shape / Geometry**  | `bwboundaries`, `bwperim`, `bwconvhull`    | Contour extraction, convex hull, perimeter             |
| **Morphology**        | `imerode`, `imdilate`, `imopen`, `imclose` | Refine object shapes, remove noise, enhance structures |

---

## **3. Examples in MATLAB**

### **(a) Edge Detection**

```matlab
img = rgb2gray(imread('peppers.png'));
edges = edge(img, 'Canny'); % 'Sobel', 'Prewitt' also possible
imshow(edges);
```

### **(b) Region Properties**

```matlab
bw = imbinarize(img);       % Convert to binary
bw = imfill(bw, 'holes');   % Fill holes
stats = regionprops(bw, 'Area', 'Centroid', 'BoundingBox', 'Eccentricity');

imshow(bw); hold on;
for k = 1:length(stats)
    rectangle('Position', stats(k).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 1);
    plot(stats(k).Centroid(1), stats(k).Centroid(2), 'b*');
end
```

### **(c) Texture Analysis**

```matlab
glcm = graycomatrix(img); % Gray-level co-occurrence matrix
stats = graycoprops(glcm, {'Contrast','Correlation','Energy','Homogeneity'});
disp(stats);
```

### **(d) Morphological Processing**

```matlab
se = strel('disk', 5);      % Structuring element
eroded = imerode(bw, se);
dilated = imdilate(bw, se);
imshowpair(eroded, dilated, 'montage');
```

---

## **4. Workflow of Mid-Level Image Processing**

1. **Pre-processing**

   * Grayscale conversion, noise removal, histogram equalization
2. **Segmentation**

   * Thresholding, edge-based, region-based
3. **Feature Extraction**

   * Shape, texture, color attributes
4. **Analysis & Visualization**

   * Overlay bounding boxes, histograms, contours
5. **Output**

   * Numeric attributes (area, centroid, contrast)
   * Visual attributes (edges, segmented regions, texture maps)

---

## **5. Example: Extract Multiple Attributes**

```matlab
img = rgb2gray(imread('coins.png'));
bw = imbinarize(img);
bw = imfill(bw,'holes');
stats = regionprops(bw,'Area','Perimeter','Eccentricity','Centroid');

for k = 1:length(stats)
    fprintf('Object %d: Area=%d, Perimeter=%.2f, Eccentricity=%.2f\n', ...
        k, stats(k).Area, stats(k).Perimeter, stats(k).Eccentricity);
end

imshow(bw); hold on;
for k = 1:length(stats)
    rectangle('Position', stats(k).BoundingBox, 'EdgeColor','r','LineWidth',1);
    plot(stats(k).Centroid(1), stats(k).Centroid(2), 'b*');
end
```

**Outputs:**

* Numeric: `Area`, `Perimeter`, `Eccentricity`, `Centroid`
* Visual: Highlighted objects with rectangles and centroids

---

## **6. Summary**

* **Mid-level processing** bridges low-level (filtering) and high-level (object recognition) tasks.
* MATLAB provides built-in functions for **edges, regions, texture, and morphology**.
* Output can be **numeric attributes** or **visualized features**.
* Common workflow: **Preprocess → Segment → Extract Features → Analyze**

---