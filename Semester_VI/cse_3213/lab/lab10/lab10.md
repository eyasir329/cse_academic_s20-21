lab - 10
<pre>
Introduction  to  video  processing  with  MATLAB.  Import  video,  do  different 
manipulation, frame rate.
</pre>
---

## **1. Introduction to Video Processing in MATLAB**

MATLAB provides the **VideoReader** and **VideoWriter** classes to import, manipulate, and export video data.
You can treat a video as a **sequence of frames (images)** and process them individually.

---

## **2. Importing a Video**

```matlab
% Read a video file
videoFile = 'sample.mp4'; 
vidObj = VideoReader(videoFile);

% Display basic video information
disp(['Frame Rate: ', num2str(vidObj.FrameRate)]);
disp(['Total Duration: ', num2str(vidObj.Duration), ' seconds']);
disp(['Number of Frames: ', num2str(floor(vidObj.FrameRate * vidObj.Duration))]);
```

---

## **3. Reading Frames**

```matlab
while hasFrame(vidObj)
    frame = readFrame(vidObj); % Read next frame
    imshow(frame);
    pause(1/vidObj.FrameRate); % Maintain original speed
end
```

---

## **4. Manipulating Frames**

Here we **convert each frame to grayscale**:

```matlab
vidObj = VideoReader('sample.mp4');

while hasFrame(vidObj)
    frame = readFrame(vidObj);
    grayFrame = rgb2gray(frame); % RGB to Gray
    imshow(grayFrame);
    pause(1/vidObj.FrameRate);
end
```

---

## **5. Changing Frame Rate**

To **slow down** or **speed up** playback, change the `pause` value or use **VideoWriter** to save a new video with a different `FrameRate`.

---

## **6. Saving Processed Video**

```matlab
inputVideo = VideoReader('sample.mp4');
outputVideo = VideoWriter('output_slow.avi');
outputVideo.FrameRate = 10; % Set new frame rate
open(outputVideo);

while hasFrame(inputVideo)
    frame = readFrame(inputVideo);
    frame = rgb2gray(frame); % Example processing
    writeVideo(outputVideo, frame);
end

close(outputVideo);
disp('Processed video saved!');
```

---

## **7. Example: Frame-by-Frame Processing**

You can apply **filters, object detection, edge detection**, etc.

```matlab
vidObj = VideoReader('sample.mp4');
outputVideo = VideoWriter('edges.avi');
open(outputVideo);

while hasFrame(vidObj)
    frame = readFrame(vidObj);
    gray = rgb2gray(frame);
    edges = edge(gray, 'Canny');
    writeVideo(outputVideo, edges);
end

close(outputVideo);
```

---

## **8. Summary Table**

| Task                 | MATLAB Function |
| -------------------- | --------------- |
| Import video         | `VideoReader`   |
| Read next frame      | `readFrame`     |
| Show frame           | `imshow`        |
| Convert to grayscale | `rgb2gray`      |
| Write video          | `VideoWriter`   |
| Edge detection       | `edge`          |
| Change frame rate    | `FrameRate`     |

---