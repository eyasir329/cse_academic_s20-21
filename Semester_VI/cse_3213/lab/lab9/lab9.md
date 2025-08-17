lab - 09
<pre>Graphical User Interface (GUI), generating GUI with MATLAB, image 
processing with GUI</pre>
---

## **1. Introduction to MATLAB GUI**

A **Graphical User Interface (GUI)** in MATLAB allows you to create interactive applications where users can load images, process them, and view results without writing commands in the command window.
You can create GUIs using:

* **App Designer** (modern, drag-and-drop, `.mlapp` file)
* **GUIDE** (older, being phased out)
* **Programmatically** (using `uifigure`, `uicontrol`, etc.)

For image processing, GUIs are useful to:

* Load and display images
* Apply filters (noise removal, sharpening, etc.)
* Perform color conversions
* Show histograms and results interactively

---

## **2. Example: Simple Image Processing GUI**

### **Basic Features**

* Load an RGB image
* Convert to grayscale
* Convert to binary
* Apply filters
* Display histogram

---

### **Programmatic GUI Code**

```matlab
function simple_image_gui
    % Create the main figure
    fig = uifigure('Name', 'Image Processing GUI', 'Position', [100 100 800 500]);

    % Axes for displaying image
    ax = uiaxes(fig, 'Position', [50 150 300 300]);

    % Load Image Button
    btnLoad = uibutton(fig, 'push', ...
        'Text', 'Load Image', ...
        'Position', [400 400 100 30], ...
        'ButtonPushedFcn', @(btn,event) loadImage());

    % Convert to Gray Button
    btnGray = uibutton(fig, 'push', ...
        'Text', 'RGB → Gray', ...
        'Position', [400 350 100 30], ...
        'ButtonPushedFcn', @(btn,event) convertGray());

    % Convert to Binary Button
    btnBinary = uibutton(fig, 'push', ...
        'Text', 'Gray → Binary', ...
        'Position', [400 300 100 30], ...
        'ButtonPushedFcn', @(btn,event) convertBinary());

    % Store image in persistent variable
    imgData = struct('img', [], 'gray', []);

    % Nested Functions
    function loadImage()
        [file, path] = uigetfile({'*.jpg;*.png;*.bmp'}, 'Select an Image');
        if isequal(file, 0)
            return;
        end
        imgData.img = imread(fullfile(path, file));
        imshow(imgData.img, 'Parent', ax);
    end

    function convertGray()
        if isempty(imgData.img)
            uialert(fig, 'Load an image first!', 'Error');
            return;
        end
        imgData.gray = rgb2gray(imgData.img);
        imshow(imgData.gray, 'Parent', ax);
    end

    function convertBinary()
        if isempty(imgData.gray)
            uialert(fig, 'Convert to Gray first!', 'Error');
            return;
        end
        bw = imbinarize(imgData.gray);
        imshow(bw, 'Parent', ax);
    end
end
```

---

## **3. Key GUI Components Used**

* **`uifigure`** → Main window
* **`uiaxes`** → For displaying images
* **`uibutton`** → For operations
* **Nested Functions** → Share variables between callbacks

---

## **4. Enhancements You Can Add**

* Sliders for threshold control
* Dropdown menu for selecting filters (Gaussian, Median, etc.)
* Panel for displaying histograms using `imhist`
* Color space conversion options (RGB → HSV, LAB, etc.)
* Noise addition & removal buttons

---

## **5. Example Workflow in GUI**

1. **User clicks "Load Image"** → Image displayed.
2. **User clicks "RGB → Gray"** → Gray image displayed.
3. **User clicks "Gray → Binary"** → Binary image displayed.
4. **(Optional)** Add filter buttons → Apply and show results side-by-side.

---