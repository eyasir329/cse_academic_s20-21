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
