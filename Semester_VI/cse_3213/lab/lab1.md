### Lab-1

<pre>
Basic introduction of digital image fundamentals and its application, introduction to MATLAB  software  tool:  graphical  user  interface  (GUI)  of  MATLAB.  Comparison  of MATLAB with other open source similar platform e.g. Octave. More details introduction to Python,  C++,  C,  Java  along  with  standard  image  library  OpenCV.  Simple  experiment  like image reading, writing with MATLAB. 
</pre>

## <u>Basic introduction of digital image fundamentals and its application</u>

### **1. Digital Image Fundamentals**

A **digital image** is a representation of a 2D image as a finite set of discrete values called _pixels_ (picture elements). Each pixel has a specific location and intensity (or color) value, forming a matrix of numbers.

#### **Key Concepts:**

- **Image Formation**:

  - Images are captured by sensors (e.g., cameras, scanners) that measure light intensity.
  - A continuous scene is _sampled_ (spatially discretized) and _quantized_ (intensity discretized) to form a digital image.

- **Pixel Representation**:

  - Grayscale images: Single matrix with intensity values (e.g., 0=black, 255=white for 8-bit).
  - Color images: Three matrices (e.g., RGB channels).

- **Spatial & Intensity Resolution**:

  - _Spatial resolution_: Number of pixels (e.g., 1024×768).
  - _Intensity resolution_: Bits per pixel (e.g., 8-bit = 256 levels).

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

## <u>Introduction to MATLAB software tool: graphical user interface (GUI) of MATLAB</u>

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

## <u>Comparison of MATLAB with other open source similar platform e.g. Octave.</u>

MATLAB is a powerful proprietary tool for numerical computing, but several open-source alternatives offer similar functionalities. Below is a detailed comparison of MATLAB with **GNU Octave, Python (NumPy/SciPy), Scilab, and Julia** in terms of syntax, performance, toolboxes, and applications.

---

## **1. MATLAB vs. GNU Octave**

### **Similarities:**

✔ Nearly identical syntax (Octave was designed to be MATLAB-compatible).  
✔ Supports most MATLAB scripts with minimal modifications.  
✔ Used for linear algebra, signal processing, and control systems.

### **Differences:**

| **Feature**            | **MATLAB**                                   | **GNU Octave**                     |
| ---------------------- | -------------------------------------------- | ---------------------------------- |
| **License**            | Proprietary (Paid)                           | Free & Open-Source (GPL)           |
| **Performance**        | Optimized for large datasets                 | Slower for big matrices            |
| **Toolboxes**          | Extensive (e.g., Simulink, Image Processing) | Limited built-in functions         |
| **GUI & IDE**          | Advanced (App Designer, Live Editor)         | Basic (no App Designer equivalent) |
| **Support**            | Professional support                         | Community-driven                   |
| **Parallel Computing** | Better GPU & multicore support               | Limited                            |

### **When to Use?**

- **Use MATLAB** for industry applications requiring toolboxes (e.g., Deep Learning, Robotics).
- **Use Octave** for learning MATLAB syntax or running simple academic scripts.

---

## **2. MATLAB vs. Python (NumPy/SciPy/Matplotlib)**

### **Similarities:**

✔ Both support matrix operations, plotting, and scientific computing.  
✔ Widely used in academia and industry.

### **Differences:**

| **Feature**         | **MATLAB**                            | **Python (NumPy/SciPy)**                      |
| ------------------- | ------------------------------------- | --------------------------------------------- |
| **Syntax**          | Matrix-first (`A * B` = matrix mult)  | Array-first (`np.dot(A,B)` for matrix mult)   |
| **Speed**           | Faster for matrix ops (MKL-optimized) | Comparable (with Numba/Cython)                |
| **Toolboxes**       | Specialized (e.g., Simulink)          | General-purpose (OpenCV, TensorFlow, PyTorch) |
| **Community**       | Engineering-focused                   | Larger (AI, Web Dev, Data Science)            |
| **Cost**            | Expensive                             | Free                                          |
| **GUI Development** | App Designer                          | PyQt, Tkinter, Dash                           |

### **When to Use?**

- **Use MATLAB** for control systems, signal processing, and legacy engineering tools.
- **Use Python** for machine learning, AI, and open-source collaboration.

---

## **3. MATLAB vs. Scilab**

### **Similarities:**

✔ Designed for numerical computing.  
✔ Supports XCOS (similar to Simulink).

### **Differences:**

| **Feature**           | **MATLAB**        | **Scilab**                                  |
| --------------------- | ----------------- | ------------------------------------------- |
| **License**           | Paid              | Free (CeCILL license)                       |
| **Syntax**            | Industry standard | Slightly different (e.g., `%` for comments) |
| **Toolboxes**         | More extensive    | Limited                                     |
| **Performance**       | Optimized         | Slower for large computations               |
| **Industry Adoption** | High              | Mostly academic                             |

### **When to Use?**

- **Use MATLAB** for industry compatibility.
- **Use Scilab** for free alternatives to basic MATLAB functions.

---

## **4. MATLAB vs. Julia**

### **Similarities:**

✔ High-performance numerical computing.  
✔ JIT compilation for speed.

### **Differences:**

| **Feature**            | **MATLAB**                 | **Julia**                                          |
| ---------------------- | -------------------------- | -------------------------------------------------- |
| **Speed**              | Fast (optimized C backend) | Faster (JIT-compiled, near C speed)                |
| **Syntax**             | Matrix-oriented            | Python-like, but with MATLAB-style array ops       |
| **Ecosystem**          | Mature toolboxes           | Growing (Flux.jl for ML, DifferentialEquations.jl) |
| **Parallel Computing** | Good                       | Excellent (built-in distributed computing)         |
| **Usage**              | Engineering, academia      | High-performance computing, AI                     |

### **When to Use?**

- **Use MATLAB** for established engineering workflows.
- **Use Julia** for high-performance scientific computing.

---

## **5. Summary: Which One Should You Choose?**

| **Tool**                 | **Best For**                                             | **Weaknesses**                 |
| ------------------------ | -------------------------------------------------------- | ------------------------------ |
| **MATLAB**               | Industry-standard engineering, control systems, Simulink | Expensive, closed-source       |
| **GNU Octave**           | Learning MATLAB syntax, lightweight computations         | Slower, fewer toolboxes        |
| **Python (NumPy/SciPy)** | AI, open-source projects, general-purpose coding         | Syntax differs from MATLAB     |
| **Scilab**               | Free MATLAB alternative for basic tasks                  | Less optimized, fewer features |
| **Julia**                | High-performance computing, modern scientific research   | Smaller community than Python  |

---

## **6. Final Recommendation**

- **For Students & Researchers on a Budget** → **Octave or Python**.
- **For Industry & Advanced Engineering** → **MATLAB** (if budget allows).
- **For AI & General-Purpose Coding** → **Python**.
- **For High-Performance Scientific Computing** → **Julia**.

---

## <u>More details introduction to Python, C++, C, Java along with standard image library OpenCV</u>

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

| Language   | OpenCV Support   | Best For                           |
| ---------- | ---------------- | ---------------------------------- |
| **Python** | `cv2` (easiest)  | Rapid prototyping, AI integration  |
| **C++**    | Native (fastest) | High-performance vision systems    |
| **C**      | Legacy API       | Embedded systems, low-level coding |
| **Java**   | JavaCPP bindings | Android, enterprise apps           |

### **Key OpenCV Features**

✔ **Real-Time Video Processing**  
✔ **Feature Detection (SIFT, ORB, SURF)**  
✔ **Object Detection (Haar Cascades, YOLO, DNN)**  
✔ **Image Filtering & Transformations**

---

## **6. Comparison Summary**

| **Language** | **Performance**            | **Ease of Use** | **Best For**                   |
| ------------ | -------------------------- | --------------- | ------------------------------ |
| **Python**   | Moderate (slower than C++) | Very Easy       | AI, Prototyping, Scripting     |
| **C++**      | Very Fast                  | Moderate        | Real-Time Vision, Game Engines |
| **C**        | Fast (but manual memory)   | Hard            | Embedded Systems, Legacy Code  |
| **Java**     | Moderate (JVM overhead)    | Easy            | Android, Enterprise Apps       |

---

## **7. Which One Should You Learn?**

- **For AI & Quick Prototyping** → **Python + OpenCV**
- **For High-Performance Vision** → **C++ + OpenCV**
- **For Embedded Systems** → **C + OpenCV (Legacy)**
- **For Android & Enterprise** → **Java + OpenCV**

---

## <u> Simple experiment like image reading, writing with MATLAB.</u>

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
