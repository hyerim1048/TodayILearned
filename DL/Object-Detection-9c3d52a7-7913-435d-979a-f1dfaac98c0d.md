# Object Detection

Last Edited: Apr 21, 2019 1:01 AM
Tags: CNN,DL

# SSD

## Abstract

---

- a method for detecting objects using a **single** d**eep neural net**
- approximate boxes with a set of default boxes over **different aspect ratios and scales per feature map location**
- prediction : **get scores** for the presence of each object category i**n each default box**
- network : **combine multiple feature maps** with different resolutions → can handle various sizes
- so **it's faster and accurate** than Faster R-CNN and other single stage methods

## Introduction

---

- current object detection systems :
    1. hypothesize bounding boxes 
    2. resample pixels and features for each box 
    3. apply a classfier 

    → so slow!

- Our object detector :
    1. eliminated box proposals 
    2. eliminated resampling the following pixels or features too
- Our contributions:
    1. SSD is SOTA compared to YOLO and Faster CNN
    2. **predicting category scores and box offsets** using small conv filters to feature maps
    3. predictions of different scales from feature maps of different scales and separate predictions by aspect ratio
    4. simple and end-to-end design, working on even low resolution images 

## SSD

---

### 2.1 Model

---

- **Multi-scale feature maps for detection**
    - base network : a standard architecture used for image classification (truncated before any classification layer; VGG-16 here)
    - add conv feature layers to the end of the base network
        - decrease in size and predict at multiple scales
- **Convolutional predictors for detection**
- **Default boxes and aspect ratios**