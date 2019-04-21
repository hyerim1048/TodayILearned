# Object Detection

Last Edited: Apr 22, 2019 12:11 AM
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
    - For a feature layer of size m*n with p channels → predicting with 3*3*p small kernel (score for a category or a shape offset). for each m*n locations → output
- **Default boxes and aspect ratios**
    - a t each feature map cell, predict **offsets relative to the default nox shapes + per-class scores**
    - **for each box from k at a given location → (c+4)k filters**

### 2.2 Training

---

- **Matching Strategy**
    - using **jaccard overlap higher than a threshold(0.5)**
    - → so the network predicts high scores for MULTIPLE overlapping default boxes , not maximum overlap
- **Traning objective**
    - **a weighted sum of the localization loss and the confidence loss**
    - x : indicator for matching i-th default box to the j-th ground truth box of a category
    - localization loss : Smooth L1 loss
    - confidence loss : softmax loss over multiple classes
- **Choosing scales and aspect ratios for default boxes**
    - Scale : 0.2 the lowest layer / 0.9 scale to the highest layer
    - Aspect ratios
- **Hard negative mining**
    - After matching, most are negatives
    - for all the negative examples , sort them highest confidence loss (ratio between negatives and positives is at most 3: 1)
- **Data augmentation**
    - use the entire input
    - sample a patch (minimum jaccard overlap with 0.1 , 0.3, 0.5, 0.7, 0.9)
    - randomly sample a path
        - Sampled patch size : [0.1 , 1] of the original image size
        - aspect ratio : [1/2, 2]