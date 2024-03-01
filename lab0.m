%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% VC i PSIV                                                      %%%
%%% Lab 0 (basat en les pr�ctiques de Gemma Rotger)                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 
% Hello! Welcome to the computer vision LAB. This is a section, and 
% you can execute it using the run section button on the top panel. If 
% you prefer, you can run all the code using the run button. Run this 
% section when you need to clear your data, figures and console 
% messages.
clearvars,
close all,
clc,

% With addpath you are adding the image path to your main path
addpath('img')


%% PROBLEM 1 (+0.5) --------------------------------------------------
% TODO. READ THE CAMERAMAN IMAGE. 
im_cameraman = imread("img\cameraman.jpg");


%% PROBLEM 2 (+0.5) --------------------------------------------------
% TODO: SHOW THE CAMERAMAN IMAGE
imshow(im_cameraman)


%% PROBELM 3 (+2.0) --------------------------------------------------
% TODO. Negative efect using a double for instruction

tic,
% Your code goes here
im_neg = im_cameraman;
for i = 1:size(im_cameraman, 1)
    for j = 1:size(im_cameraman, 2)
        for k = 1:size(im_cameraman, 3)
            im_neg(i, j, k) = 255 - im_cameraman(i, j, k);
        end
    end
end
figure(1)
imshow(im_neg);
toc

% TODO. Negative efect using a vectorial instruction
tic,
im_neg = 255 - im_cameraman;
figure(2)
imshow(im_neg);
toc,

% You sould see that results in figures 1 and 2 are the same but times
% are much different.

%% PROBLEM 4 (+2.0) --------------------------------------------------

% TODO. Give some color (red, green or blue)
r = im_cameraman;
g = im_neg;
b = im_cameraman;

im_col = zeros(size(im_cameraman), 'uint8');
im_col(:,:,1) = r;
im_col(:,:,2) = g;
im_col(:,:,3) = b;

figure(1)
imshow(im_col);

im_col = cat(3, r,g,b);
figure(2)
imshow(im_col);


%% PROBLEM 5 (+1.0) --------------------------------------------------
imwrite(im_col, 'im_col.bmp', 'bmp');
imwrite(im_col, 'im_col.tif', 'tif');
imwrite(im_col, 'im_col.jpg', 'jpg');
imwrite(im_col, 'im_col.png', 'png');

bmp_size = dir('im_col.bmp').bytes;
tif_size = dir('im_col.tif').bytes;
jpg_size = dir('im_col.jpg').bytes;
png_size = dir('im_col.png').bytes;

disp(['Size BMP: ', num2str(bmp_size / 1024), ' bytes']);
disp(['Size TIF: ', num2str(tif_size / 1024), ' bytes']);
disp(['Size JPG: ', num2str(jpg_size /1024 ), ' bytes']);
disp(['Size PNG: ', num2str(png_size / 1024), ' bytes']);

raw_size = numel(im_col) * 8 / 8;
disp(['Size RAW: ', num2str(raw_size / 1024), ' bytes']);

%% PROBLEM 6 (+1.0) --------------------------------------------------

lin128=im_cameraman(128, :);
plot(lin128);
title('Fila central imatge escala grisos');
xlabel('Columna');
ylabel('Valor de pixel');

lin128rgb=im_col(128, :);
figure(2)
plot(lin128rgb)
title('Fila central imatge escala color');
xlabel('Columna');
ylabel('Valor de pixel');

mitjana = mean(lin128);
plot(lin128);
hold on;
plot(1:length(lin128), mitjana * ones(1, length(lin128)), 'r--', 'LineWidth', 2);
hold off;

%% PROBLEM 7 (+2) ----------------------------------------------------

tic
figure(1)
imhist(im_cameraman)
toc;


% TODO. Compute the histogram.
tic;
h = zeros(1, 256);
for i = 1:size(im_cameraman, 1)
    for j = 1:size(im_cameraman, 2)
        pixel = im_cameraman(i, j);
        h(pixel + 1) = h(pixel + 1) + 1;
    end
end
figure(2)
bar(h)
toc;

% Color histogram
red = im_col(:,:,1);
green = im_col(:,:,2);
blue = im_col(:,:,3);

% Create histograms for each channel with customization options
figure(3);
subplot(3,1,1);
bar(imhist(red));
title('Red Channel Histogram');

subplot(3,1,2);
bar(imhist(green));
title('Green Channel Histogram');

subplot(3,1,3);
bar(imhist(blue));
title('Blue Channel Histogram');

xlabel('Pixel Intensity');
ylabel('Number of Pixels');


% Combine and overlay histograms
alpha = 0.5;
figure(4);
hold on;
bar(imhist(red), 'FaceColor', 'r', 'FaceAlpha', alpha);
bar(imhist(green), 'FaceColor', 'g', 'FaceAlpha', alpha);
bar(imhist(blue), 'FaceColor', 'b', 'FaceAlpha', alpha);
hold off;

%% PROBLEM 8 Binarize the image text.png (+1) ------------------------

% TODO. Read the image
imtext = imread("img\alice.jpg");
figure
imshow(imtext)
imhist(imtext)

% TODO. Define 3 different thresholds
imtext_gray = rgb2gray(imtext);
th1 = 0.63;
th2 = 0.73;
th3 = 0.83;
threshimtext1 = imbinarize(imtext_gray, th1);
threshimtext2 = imbinarize(imtext_gray, th2);
threshimtext3 = imbinarize(imtext_gray, th3);   

% TODO. Show the original image and the segmentations in a subplot
figure(1)
title('Original image');
subplot(2,2,2);
imshow(imtext);
subplot(2,3,4);
imshow(threshimtext1);
subplot(2,3,5);
imshow(threshimtext2);
subplot(2,3,6);
imshow(threshimtext3);


%% THE END -----------------------------------------------------------
% Well done, you finished this lab! Now, remember to deliver it 
% properly on Caronte.

% File name:
% lab0_NIU.zip 
% (put matlab file lab0.m and python file lab0.py in the same zip file)
% Example lab0_1234567.zip

















