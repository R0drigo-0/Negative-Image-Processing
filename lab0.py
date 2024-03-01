######################################################################
### VC i PSIV                                                      ###
### Lab 0 (basat en material de Gemma Rotger)                      ###
######################################################################


# Hello! Welcome to the computer vision LAB.
import time
import cv2
import numpy as np
from matplotlib import pyplot as plt
import os


## PROBLEM 1 (+0.5) --------------------------------------------------
# TODO. READ THE CAMERAMAN IMAGE.
im_cameraman = cv2.imread("img/cameraman.jpg")

## PROBLEM 2 (+0.5) --------------------------------------------------
# TODO: SHOW THE CAMERAMAN IMAGE
cv2.imshow("Cameraman", im_cameraman)
cv2.waitKey(0)

## PROBELM 3 (+2.0) --------------------------------------------------
# TODO. Negative efect using a double for instruction

t = time.time()
# Your code goes here
im_neg = 255 - im_cameraman
elapsed = time.time() - t
print("Elapsed time is " + str(elapsed) + " seconds")
plt.figure(1)
plt.title("Double negative")
plt.imshow(im_neg, "gray")
plt.show()

# TODO. Negative efect using a vectorial instruction

# You sould see that results in figures 1 and 2 are the same but times
# are much different.

## PROBLEM 4 (+2.0) --------------------------------------------------""

# TODO. Give some color (red, green or blue)
im_cameraman = cv2.imread("img/cameraman.jpg")
im_gray = cv2.cvtColor(im_cameraman, cv2.COLOR_BGR2GRAY)
im_neg = 255 - im_gray

r = im_cameraman[:, :, 2]
g = im_neg
b = im_cameraman[:, :, 0]

im_col = np.zeros_like(im_cameraman)
im_col[:, :, 0] = r
im_col[:, :, 1] = g
im_col[:, :, 2] = b

plt.imshow(im_col)
plt.show()

im_col = np.dstack((r, g, b))
plt.imshow(im_col)
plt.show()


## PROBLEM 5 (+1.0) --------------------------------------------------

cv2.imwrite("im_col.bmp", im_col)
cv2.imwrite("im_col.tif", im_col)
cv2.imwrite("im_col.jpg", im_col)
cv2.imwrite("im_col.png", im_col)

bmp_size = os.path.getsize("im_col.bmp")
tif_size = os.path.getsize("im_col.tif")
jpg_size = os.path.getsize("im_col.jpg")
png_size = os.path.getsize("im_col.png")

print(f"Size BMP: {bmp_size} bytes")
print(f"Size TIF: {tif_size} bytes")
print(f"Size JPG: {jpg_size} bytes")
print(f"Size PNG: {png_size} bytes")

im_col = cv2.imread("im_col.bmp")
raw_size = im_col.size * im_col.itemsize

print(f"Size RAW: {raw_size} bytes")

## PROBLEM 6 (+1.0) --------------------------------------------------
im_gray = cv2.imread("img/cameraman.jpg", cv2.IMREAD_GRAYSCALE)
lin128 = im_gray[128, :]
plt.figure(1)
plt.plot(lin128)
plt.title("Fila central imatge escala grisos")
plt.xlabel("Columna")
plt.ylabel("Valor de pixel")
plt.show()

lin128rgb=im_col[128, :]
plt.figure(2)
plt.plot(lin128rgb)
plt.title('Fila central imatge escala color')
plt.xlabel('Columna')
plt.ylabel('Valor de pixel')
plt.show()


mitjana = np.mean(lin128)
plt.plot(lin128)
plt.axhline(y=mitjana, color='r', linestyle='dashed')
plt.xlabel("Columna")
plt.ylabel("Valor de pixel")
plt.show()

## PROBLEM 7 (+2) ----------------------------------------------------

# TODO. Compute the histogram.
t = time.time()
hist,bins = np.histogram(im_gray, bins=256, range=(0, 255))
elapsed = time.time() - t
print("Elapsed time is " + str(elapsed) + " seconds")
plt.plot(bins[:-1], hist)
plt.show()

t = time.time()
h = np.zeros(256, dtype=int)
for row in im_gray:
    for pixel in row:
        h[pixel] += 1

plt.plot(h)
plt.show()
elapsed = time.time() - t
print("Elapsed time is " + str(elapsed) + " seconds")

## PROBLEM 8 Binarize the image text.png (+1) ------------------------

# TODO. Read the image
imtext = cv2.imread("img/alice.jpg")
plt.imshow(imtext)
plt.show()
hist,bins = np.histogram(imtext, bins=256, range=(0, 255))
plt.plot(bins[:-1], hist)
plt.show()

# TODO. Define 3 different thresholds
th1 = 0.63
th2 = 0.73
th3 = 0.83

# TODO. Apply the 3 thresholds 5 to the image
imtext_gray = cv2.cvtColor(imtext, cv2.COLOR_BGR2GRAY)
threshimtext1 = cv2.threshold(imtext_gray, th1 * 255, 255, cv2.THRESH_BINARY)[1]
threshimtext2 = cv2.threshold(imtext_gray, th2 * 255, 255, cv2.THRESH_BINARY)[1]
threshimtext3 = cv2.threshold(imtext_gray, th3 * 255, 255, cv2.THRESH_BINARY)[1]

# TODO. Show the original image and the segmentations in a subplot
fig, ax = plt.subplots(nrows=2, ncols=3)
ax[0,0].remove()
ax[0,1].imshow(imtext)
ax[0,1].set_title('Original image')
ax[0,2].remove()
ax[1,0].imshow(threshimtext1)
ax[1,1].imshow(threshimtext2)
ax[1,2].imshow(threshimtext3)
plt.show()


## THE END -----------------------------------------------------------
# Well done, you finished this lab! Now, remember to deliver it
# properly on Caronte.

# File name:
# lab0_NIU.zip
# (put matlab file lab0.m and python file lab0.py in the same zip file)
# Example lab0_1234567.zip
