## CSE-3213: Digital Image Processing Lab

Course Teacher

- Abdullah Al Shiam, Assistant Professor, Dept. of CSE,
  Netrokona University, Netrokona

---
### Lab-1

<pre>
Basic introduction of digital image fundamentals and its application, introduction to MATLAB  software  tool:  graphical  user  interface  (GUI)  of  MATLAB.  Comparison  of MATLAB with other open source similar platform e.g. Octave. More details introduction to Python,  C++,  C,  Java  along  with  standard  image  library  OpenCV.  Simple  experiment  like image reading, writing with MATLAB. 
</pre>

## <u>Basic introduction of digital image fundamentals and its application</u>


### **1. Digital Image Fundamentals**  
A **digital image** is a representation of a 2D image as a finite set of discrete values called *pixels* (picture elements). Each pixel has a specific location and intensity (or color) value, forming a matrix of numbers.  

#### **Key Concepts:**  
- **Image Formation**:  
  - Images are captured by sensors (e.g., cameras, scanners) that measure light intensity.  
  - A continuous scene is *sampled* (spatially discretized) and *quantized* (intensity discretized) to form a digital image.  

- **Pixel Representation**:  
  - Grayscale images: Single matrix with intensity values (e.g., 0=black, 255=white for 8-bit).  
  - Color images: Three matrices (e.g., RGB channels).  

- **Spatial & Intensity Resolution**:  
  - *Spatial resolution*: Number of pixels (e.g., 1024×768).  
  - *Intensity resolution*: Bits per pixel (e.g., 8-bit = 256 levels).  

- **Image Types**:  
  - Binary (1-bit), grayscale, color (RGB, HSV), multispectral/hyperspectral.  

- **Basic Relationships Between Pixels**:  
  - Adjacency (4-, 8-, or m-adjacency).  
  - Connectivity, regions, and boundaries.  

### **2. Applications of Digital Image Processing**  
Image processing techniques (from Gonzalez’s book) are applied across various fields:  

1. **Medical Imaging**:  
   - MRI, CT scans, X-ray enhancement, tumor detection.  

2. **Remote Sensing**:  
   - Satellite image analysis for agriculture, weather forecasting.  

3. **Industrial Inspection**:  
   - Defect detection in manufacturing (e.g., PCB inspection).  

4. **Computer Vision & AI**:  
   - Object recognition, facial recognition, autonomous vehicles.  

5. **Multimedia & Entertainment**:  
   - Image/video compression (JPEG, MPEG), special effects.  

6. **Security & Surveillance**:  
   - Fingerprint recognition, license plate detection.  

7. **Astronomy**:  
   - Enhancing telescopic images of galaxies.  

## <u>Introduction to MATLAB  software  tool:  graphical  user  interface  (GUI)  of  MATLAB</u>

MATLAB (Matrix Laboratory) is a high-performance programming environment used for numerical computing, data analysis, algorithm development, and visualization. One of its key features is its **Graphical User Interface (GUI)**, which provides an interactive way to work with data, write code, and visualize results without needing deep programming expertise.  

---

## **1. Overview of MATLAB’s GUI Components**  
When you launch MATLAB, the default desktop layout consists of several key panels:  

### **A. MATLAB Desktop Layout**  
1. **Command Window**  
   - Used to enter MATLAB commands directly.  
   - Example: Type `x = 1:10; plot(x);` to generate a simple plot.  

2. **Workspace**  
   - Displays all variables currently loaded in memory.  
   - Shows variable names, sizes, and data types.  

3. **Current Folder (File Browser)**  
   - Lists files in the current working directory.  
   - Used to open, run, and manage MATLAB scripts (`*.m` files).  

4. **Command History**  
   - Records previously executed commands.  
   - Allows re-running past commands by double-clicking.  

5. **Editor (for Scripts & Functions)**  
   - Used to write and debug MATLAB code (`.m` files).  
   - Supports syntax highlighting, auto-completion, and debugging tools.  

6. **Toolstrip (Ribbon Interface)**  
   - Contains tabs like **HOME, PLOTS, APPS** for quick access to functions.  
   - **HOME Tab**: File operations, variable management, and plotting.  
   - **PLOTS Tab**: Quick visualization tools (e.g., `plot`, `bar`, `histogram`).  
   - **APPS Tab**: Access to MATLAB toolboxes (e.g., Image Processing, Deep Learning).  

---

## **2. Key Interactive Features of MATLAB GUI**  

### **A. Plotting & Visualization Tools**  
- **Figure Windows**:  
  - Graphs appear in separate windows with interactive zoom, pan, and data cursor tools.  
  - Example:  
    ```matlab
    x = 0:0.1:10;
    y = sin(x);
    plot(x, y);
    title('Sine Wave');
    ```
- **Plot Tools** (`plottools`)  
  - Allows modifying axes, labels, legends, and colors interactively.  

### **B. Variable Editor**  
- Double-click a variable in the **Workspace** to open it in a spreadsheet-like editor.  
- Useful for modifying matrices and tables manually.  

### **C. App Designer (for Custom GUIs)**  
- MATLAB provides **App Designer** (`appdesigner` command) to build custom interactive applications.  
- Drag-and-drop UI components (buttons, sliders, plots).  
- Automatically generates MATLAB code for GUI functionality.  

### **D. Live Editor (Interactive Scripts)**  
- Combines code, output, and formatted text in a single document (`.mlx` files).  
- Useful for creating interactive reports and tutorials.  

---

## **3. How to Use MATLAB GUI for Common Tasks**  

### **Task 1: Importing & Plotting Data**  
1. **Import Data**  
   - Click **Import Data** (HOME tab) → Select a file (e.g., CSV, Excel).  
   - Alternatively, use:  
     ```matlab
     data = readtable('data.csv');
     ```
2. **Plot Data**  
   - Select variables in the Workspace → Go to **PLOTS** tab → Choose a plot type.  
   - Or use commands:  
     ```matlab
     plot(data.X, data.Y);
     ```

### **Task 2: Creating a Simple GUI with App Designer**  
1. Type `appdesigner` in the Command Window.  
2. Drag **Axes**, **Button**, and **Slider** components into the design area.  
3. Write callback functions (e.g., update plot when slider moves).  
4. Click **Run** to test the GUI.  

### **Task 3: Debugging Code**  
- Set breakpoints in the Editor by clicking the dash next to line numbers.  
- Use **Run and Advance** (F5) to execute code step-by-step.  

---

## **4. Advantages of MATLAB’s GUI**  
✔ **User-friendly** for beginners (no need for deep coding knowledge).  
✔ **Interactive plotting** for quick data exploration.  
✔ **Custom GUI development** with App Designer.  
✔ **Seamless integration** with toolboxes (e.g., Image Processing, Control Systems).  

---

## **5. Conclusion**  
MATLAB’s GUI provides an efficient way to perform computations, visualize data, and build interactive applications without extensive programming. Whether you’re analyzing data, designing control systems, or processing images, MATLAB’s interface helps streamline workflows.  

---

## <u>Comparison  of MATLAB with other open source similar platform e.g. Octave.</u>

MATLAB is a powerful proprietary tool for numerical computing, but several open-source alternatives offer similar functionalities. Below is a detailed comparison of MATLAB with **GNU Octave, Python (NumPy/SciPy), Scilab, and Julia** in terms of syntax, performance, toolboxes, and applications.  

---

## **1. MATLAB vs. GNU Octave**  
### **Similarities:**  
✔ Nearly identical syntax (Octave was designed to be MATLAB-compatible).  
✔ Supports most MATLAB scripts with minimal modifications.  
✔ Used for linear algebra, signal processing, and control systems.  

### **Differences:**  

| **Feature**       | **MATLAB** | **GNU Octave** |
|------------------|----------|--------------|
| **License** | Proprietary (Paid) | Free & Open-Source (GPL) |
| **Performance** | Optimized for large datasets | Slower for big matrices |
| **Toolboxes** | Extensive (e.g., Simulink, Image Processing) | Limited built-in functions |
| **GUI & IDE** | Advanced (App Designer, Live Editor) | Basic (no App Designer equivalent) |
| **Support** | Professional support | Community-driven |
| **Parallel Computing** | Better GPU & multicore support | Limited |

### **When to Use?**  
- **Use MATLAB** for industry applications requiring toolboxes (e.g., Deep Learning, Robotics).  
- **Use Octave** for learning MATLAB syntax or running simple academic scripts.  

---

## **2. MATLAB vs. Python (NumPy/SciPy/Matplotlib)**  
### **Similarities:**  
✔ Both support matrix operations, plotting, and scientific computing.  
✔ Widely used in academia and industry.  

### **Differences:**  

| **Feature**       | **MATLAB** | **Python (NumPy/SciPy)** |
|------------------|----------|------------------------|
| **Syntax** | Matrix-first (`A * B` = matrix mult) | Array-first (`np.dot(A,B)` for matrix mult) |
| **Speed** | Faster for matrix ops (MKL-optimized) | Comparable (with Numba/Cython) |
| **Toolboxes** | Specialized (e.g., Simulink) | General-purpose (OpenCV, TensorFlow, PyTorch) |
| **Community** | Engineering-focused | Larger (AI, Web Dev, Data Science) |
| **Cost** | Expensive | Free |
| **GUI Development** | App Designer | PyQt, Tkinter, Dash |

### **When to Use?**  
- **Use MATLAB** for control systems, signal processing, and legacy engineering tools.  
- **Use Python** for machine learning, AI, and open-source collaboration.  

---

## **3. MATLAB vs. Scilab**  
### **Similarities:**  
✔ Designed for numerical computing.  
✔ Supports XCOS (similar to Simulink).  

### **Differences:**  

| **Feature**       | **MATLAB** | **Scilab** |
|------------------|----------|----------|
| **License** | Paid | Free (CeCILL license) |
| **Syntax** | Industry standard | Slightly different (e.g., `%` for comments) |
| **Toolboxes** | More extensive | Limited |
| **Performance** | Optimized | Slower for large computations |
| **Industry Adoption** | High | Mostly academic |

### **When to Use?**  
- **Use MATLAB** for industry compatibility.  
- **Use Scilab** for free alternatives to basic MATLAB functions.  

---

## **4. MATLAB vs. Julia**  
### **Similarities:**  
✔ High-performance numerical computing.  
✔ JIT compilation for speed.  

### **Differences:**  

| **Feature**       | **MATLAB** | **Julia** |
|------------------|----------|---------|
| **Speed** | Fast (optimized C backend) | Faster (JIT-compiled, near C speed) |
| **Syntax** | Matrix-oriented | Python-like, but with MATLAB-style array ops |
| **Ecosystem** | Mature toolboxes | Growing (Flux.jl for ML, DifferentialEquations.jl) |
| **Parallel Computing** | Good | Excellent (built-in distributed computing) |
| **Usage** | Engineering, academia | High-performance computing, AI |

### **When to Use?**  
- **Use MATLAB** for established engineering workflows.  
- **Use Julia** for high-performance scientific computing.  

---

## **5. Summary: Which One Should You Choose?**  

| **Tool**      | **Best For** | **Weaknesses** |
|--------------|------------|--------------|
| **MATLAB** | Industry-standard engineering, control systems, Simulink | Expensive, closed-source |
| **GNU Octave** | Learning MATLAB syntax, lightweight computations | Slower, fewer toolboxes |
| **Python (NumPy/SciPy)** | AI, open-source projects, general-purpose coding | Syntax differs from MATLAB |
| **Scilab** | Free MATLAB alternative for basic tasks | Less optimized, fewer features |
| **Julia** | High-performance computing, modern scientific research | Smaller community than Python |

---

## **6. Final Recommendation**  
- **For Students & Researchers on a Budget** → **Octave or Python**.  
- **For Industry & Advanced Engineering** → **MATLAB** (if budget allows).  
- **For AI & General-Purpose Coding** → **Python**.  
- **For High-Performance Scientific Computing** → **Julia**.  

---

## <u>More details introduction to Python,  C++,  C,  Java  along  with  standard  image  library  OpenCV</u>

## **1. Python**
### **Overview**
Python is a high-level, interpreted programming language known for its simplicity and readability. It is widely used in:
- **Scientific Computing** (NumPy, SciPy)
- **Machine Learning** (TensorFlow, PyTorch)
- **Image Processing** (OpenCV, PIL, scikit-image)
- **Automation & Scripting**

### **Key Features**
✔ **Easy Syntax** – Minimal boilerplate code  
✔ **Extensive Libraries** – Rich ecosystem for AI, data science, and computer vision  
✔ **Cross-Platform** – Runs on Windows, Linux, macOS  
✔ **Dynamically Typed** – No explicit variable type declarations  

### **Python for Image Processing (OpenCV)**
```python
import cv2

# Read an image
img = cv2.imread("image.jpg")

# Convert to grayscale
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Display the image
cv2.imshow("Grayscale Image", gray)
cv2.waitKey(0)
cv2.destroyAllWindows()
```
**Libraries:**  
- **OpenCV (cv2)** – Real-time computer vision  
- **Pillow (PIL)** – Basic image operations  
- **scikit-image** – Advanced image processing  

---

## **2. C++**
### **Overview**
C++ is a high-performance, compiled language used in:
- **Game Development** (Unreal Engine)  
- **System Programming** (OS kernels, drivers)  
- **Real-Time Image Processing** (OpenCV, GPU acceleration)  

### **Key Features**
✔ **Fast Execution** – Compiled to machine code  
✔ **Object-Oriented** – Supports OOP and templates  
✔ **Memory Control** – Manual memory management  
✔ **Used in OpenCV** – Preferred for high-performance vision tasks  

### **C++ with OpenCV**
```cpp
#include <opencv2/opencv.hpp>
using namespace cv;

int main() {
    // Read an image
    Mat img = imread("image.jpg");

    // Convert to grayscale
    Mat gray;
    cvtColor(img, gray, COLOR_BGR2GRAY);

    // Display the image
    imshow("Grayscale Image", gray);
    waitKey(0);
    return 0;
}
```
**Libraries:**  
- **OpenCV** – Industry standard for computer vision  
- **Boost.GIL** – Generic Image Library  
- **Dlib** – Machine learning + image processing  

---

## **3. C**
### **Overview**
C is a low-level, procedural language used in:
- **Embedded Systems** (Microcontrollers)  
- **OS Development** (Linux, Windows kernel)  
- **Legacy Image Processing**  

### **Key Features**
✔ **Lightweight** – Minimal runtime overhead  
✔ **Hardware-Level Control** – Direct memory access  
✔ **No Built-in OOP** – Purely procedural  

### **C with OpenCV**
```c
#include <opencv2/opencv.h>

int main() {
    // Read an image
    IplImage* img = cvLoadImage("image.jpg", CV_LOAD_IMAGE_COLOR);

    // Convert to grayscale
    IplImage* gray = cvCreateImage(cvGetSize(img), IPL_DEPTH_8U, 1);
    cvCvtColor(img, gray, CV_BGR2GRAY);

    // Display the image
    cvNamedWindow("Grayscale Image", CV_WINDOW_AUTOSIZE);
    cvShowImage("Grayscale Image", gray);
    cvWaitKey(0);

    // Cleanup
    cvReleaseImage(&img);
    cvReleaseImage(&gray);
    return 0;
}
```
**Libraries:**  
- **OpenCV (C API – Legacy)**  
- **libpng/libjpeg** – Raw image I/O  
- **CImg** – Lightweight image processing  

---

## **4. Java**
### **Overview**
Java is an object-oriented, portable language used in:
- **Enterprise Applications**  
- **Android Development**  
- **Web Services & Cloud Computing**  

### **Key Features**
✔ **Platform-Independent** (JVM)  
✔ **Strong Typing** – Compile-time checks  
✔ **Multithreading Support**  

### **Java with OpenCV**
```java
import org.opencv.core.*;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;

public class Main {
    static { System.loadLibrary(Core.NATIVE_LIBRARY_NAME); }

    public static void main(String[] args) {
        // Read an image
        Mat img = Imgcodecs.imread("image.jpg");

        // Convert to grayscale
        Mat gray = new Mat();
        Imgproc.cvtColor(img, gray, Imgproc.COLOR_BGR2GRAY);

        // Save the output
        Imgcodecs.imwrite("gray_image.jpg", gray);
    }
}
```
**Libraries:**  
- **OpenCV Java** – Native bindings for Java  
- **Java Advanced Imaging (JAI)** – Basic image ops  
- **BoofCV** – Alternative to OpenCV  

---

## **5. OpenCV: The Standard Image Processing Library**
### **Supported Languages**
| Language | OpenCV Support | Best For |
|----------|--------------|----------|
| **Python** | `cv2` (easiest) | Rapid prototyping, AI integration |
| **C++** | Native (fastest) | High-performance vision systems |
| **C** | Legacy API | Embedded systems, low-level coding |
| **Java** | JavaCPP bindings | Android, enterprise apps |

### **Key OpenCV Features**
✔ **Real-Time Video Processing**  
✔ **Feature Detection (SIFT, ORB, SURF)**  
✔ **Object Detection (Haar Cascades, YOLO, DNN)**  
✔ **Image Filtering & Transformations**  

---

## **6. Comparison Summary**
| **Language** | **Performance** | **Ease of Use** | **Best For** |
|-------------|--------------|--------------|-------------|
| **Python** | Moderate (slower than C++) | Very Easy | AI, Prototyping, Scripting |
| **C++** | Very Fast | Moderate | Real-Time Vision, Game Engines |
| **C** | Fast (but manual memory) | Hard | Embedded Systems, Legacy Code |
| **Java** | Moderate (JVM overhead) | Easy | Android, Enterprise Apps |

---

## **7. Which One Should You Learn?**
- **For AI & Quick Prototyping** → **Python + OpenCV**  
- **For High-Performance Vision** → **C++ + OpenCV**  
- **For Embedded Systems** → **C + OpenCV (Legacy)**  
- **For Android & Enterprise** → **Java + OpenCV**  

---

## <u> Simple  experiment  like image reading, writing with MATLAB.</u>

This guide demonstrates how to perform basic image operations in MATLAB:
1. **Reading an image**  
2. **Displaying the image**  
3. **Converting to grayscale**  
4. **Writing/saving the image**  

---

## **Step 1: Read an Image**
Use `imread()` to load an image file (JPEG, PNG, etc.).  

```matlab
% Read an image from file
originalImage = imread('peppers.png');  % Replace with your image path

% Check image properties
disp(['Image size: ', num2str(size(originalImage))]);
disp(['Image class: ', class(originalImage)]);
```

### **Notes:**
- Supported formats: JPEG, PNG, TIFF, BMP.
- The image is stored as a **3D matrix** (`height × width × channels` for RGB).

---

## **Step 2: Display the Image**
Use `imshow()` to visualize the image.  

```matlab
% Display the original image
figure;  % Create a new figure window
imshow(originalImage);
title('Original Color Image');
```

### **Optional: Display Image Information**
```matlab
% Show image dimensions
whos originalImage;
```

---

## **Step 3: Convert to Grayscale**
Use `rgb2gray()` to convert an RGB image to grayscale.  

```matlab
% Convert RGB to grayscale
grayImage = rgb2gray(originalImage);

% Display the grayscale image
figure;
imshow(grayImage);
title('Grayscale Image');
```

### **Alternative (if already grayscale):**
```matlab
if size(originalImage, 3) == 1
    grayImage = originalImage;  % Already grayscale
end
```

---

## **Step 4: Write/Save the Image**
Use `imwrite()` to save the processed image.  

```matlab
% Save the grayscale image
imwrite(grayImage, 'grayscale_peppers.jpg');  % Save as JPEG

% Optional: Save in different formats
imwrite(grayImage, 'grayscale_peppers.png');  % Save as PNG
```

### **Notes:**
- Supported output formats: JPEG, PNG, TIFF, BMP.
- JPEG is lossy, PNG is lossless.

---

## **Full MATLAB Code**
```matlab
% Read an image
originalImage = imread('peppers.png');

% Display original image
figure;
imshow(originalImage);
title('Original Image');

% Convert to grayscale
grayImage = rgb2gray(originalImage);

% Display grayscale image
figure;
imshow(grayImage);
title('Grayscale Image');

% Save the grayscale image
imwrite(grayImage, 'grayscale_peppers.jpg');
disp('Grayscale image saved as "grayscale_peppers.jpg"');
```

---

## **Expected Output**
1. Two figure windows:  
   - One showing the **original color image**.  
   - One showing the **grayscale version**.  
2. A new file `grayscale_peppers.jpg` saved in your working directory.  

---

## **Troubleshooting**
❌ **Error: File not found**  
   → Ensure the image is in MATLAB’s **Current Folder** or use the full path:  
   ```matlab
   originalImage = imread('C:\Users\YourName\images\peppers.png');
   ```

❌ **Error: Invalid image format**  
   → Verify the file is a supported format (JPEG/PNG/BMP/TIFF).  

---

## **Further Experiments**
1. **Adjust Brightness**  
   ```matlab
   brightenedImage = originalImage + 50;  % Increase brightness
   imshow(brightenedImage);
   ```
2. **Crop an Image**  
   ```matlab
   croppedImage = originalImage(100:300, 200:400, :);  % Crop region
   imshow(croppedImage);
   ```
3. **Edge Detection**  
   ```matlab
   edges = edge(grayImage, 'Canny');
   imshow(edges);
   ```

---

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
| Channel | Key Characteristics | Typical Applications |
|---------|---------------------|----------------------|
| **Red** | Highlights warm colors | Skin detection, fire detection |
| **Green** | Highest luminance contribution | Vegetation analysis, medical imaging |
| **Blue** | Shows water and skies | Underwater imaging, sky detection |

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

| Transformation | Computational Cost | Memory Usage | Qualitative Effect |
|----------------|-------------------|--------------|---------------------|
| **Log** | Low | Low | Reveals dark details |
| **Linear** | Very Low | Very Low | Adjusts contrast/brightness |
| **Power-Law** | Medium (exponentiation) | Low | Non-linear enhancement |
| **Negative** | Lowest | Lowest | Intensity inversion |

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

| Transformation | Best For | Medical Use Case | Limitations |
|----------------|----------|------------------|-------------|
| **Log** | Dark image enhancement | Lung texture analysis | May over-enhance noise |
| **Linear** | Quick contrast adjustment | General contrast improvement | Global effect (no local adaptation) |
| **Power-Law** | Non-linear enhancement | Bone vs. soft tissue balance | Requires γ tuning |
| **Negative** | Highlight inverted features | Dental X-ray analysis | Limited diagnostic value |

**Clinical Recommendation**: Gamma correction (γ≈0.5-0.7) often provides the best balance for chest X-rays, while log transforms excel for MRI dark region enhancement.

---