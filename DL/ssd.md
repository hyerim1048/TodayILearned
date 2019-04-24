# Object Detection

Last Edited: Apr 24, 2019 11:44 PM
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
        - VGG Architecture : [https://neurohive.io/en/popular-networks/vgg16/](https://neurohive.io/en/popular-networks/vgg16/)
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

---

## Implementation

### basic function for building SSD

[https://github.com/hyerim1048/ssd.pytorch/blob/master/ssd.py](https://github.com/hyerim1048/ssd.pytorch/blob/master/ssd.py)

1) build_ssd 

    base = {
        '300': [64, 64, 'M', 128, 128, 'M', 256, 256, 256, 'C', 512, 512, 512, 'M',
                512, 512, 512],
        '512': [],
    }
    extras = {
        '300': [256, 'S', 512, 128, 'S', 256, 128, 256, 128, 256],
        '512': [],
    }
    mbox = {
        '300': [4, 6, 6, 6, 4, 4],  # number of boxes per feature map location
        '512': [],
    }
    
    def build_ssd(phase, size=300, num_classes=21):
        if phase != "test" and phase != "train":
            print("ERROR: Phase: " + phase + " not recognized")
            return
        if size != 300:
            print("ERROR: You specified size " + repr(size) + ". However, " +
                  "currently only SSD300 (size=300) is supported!")
            return
        base_, extras_, head_ = multibox(vgg(base[str(size)], 3),
                                         add_extras(extras[str(size)], 1024),
                                         mbox[str(size)], num_classes)
        return SSD(phase, size, base_, extras_, head_, num_classes)

2) implementation of VGG 

- ceiling mode
- additional layers

    # This function is derived from torchvision VGG make_layers()
    # https://github.com/pytorch/vision/blob/master/torchvision/models/vgg.py
    def vgg(cfg, i, batch_norm=False):
        layers = []
        in_channels = i
        for v in cfg:
            if v == 'M':
                layers += [nn.MaxPool2d(kernel_size=2, stride=2)]
            elif v == 'C':
                layers += [nn.MaxPool2d(kernel_size=2, stride=2, ceil_mode=True)]
            else:
                conv2d = nn.Conv2d(in_channels, v, kernel_size=3, padding=1)
                if batch_norm:
                    layers += [conv2d, nn.BatchNorm2d(v), nn.ReLU(inplace=True)]
                else:
                    layers += [conv2d, nn.ReLU(inplace=True)]
                in_channels = v
       
        pool5 = nn.MaxPool2d(kernel_size=3, stride=1, padding=1)
        conv6 = nn.Conv2d(512, 1024, kernel_size=3, padding=6, dilation=6)
        conv7 = nn.Conv2d(1024, 1024, kernel_size=1)
        layers += [pool5, conv6,
                   nn.ReLU(inplace=True), conv7, nn.ReLU(inplace=True)]
        return layers

- original VGG

        # https://github.com/pytorch/vision/blob/master/torchvision/models/vgg.py
        def make_layers(cfg, batch_norm=False):
            layers = []
            in_channels = 3
            for v in cfg:
                if v == 'M':
                    layers += [nn.MaxPool2d(kernel_size=2, stride=2)]
                else:
                    conv2d = nn.Conv2d(in_channels, v, kernel_size=3, padding=1)
                    if batch_norm:
                        layers += [conv2d, nn.BatchNorm2d(v), nn.ReLU(inplace=True)]
                    else:
                        layers += [conv2d, nn.ReLU(inplace=True)]
                    in_channels = v
            return nn.Sequential(*layers)

3) extra layers 

    add_extras([256, 'S', 512, 128, 'S', 256, 128, 256, 128, 256], 1024)

    def add_extras(cfg, i, batch_norm=False):
        # Extra layers added to VGG for feature scaling
        layers = []
        in_channels = i
        flag = False
        for k, v in enumerate(cfg):
            if in_channels != 'S':
                if v == 'S': # stride : 2
                    layers += [nn.Conv2d(in_channels, cfg[k + 1],
                               kernel_size=(1, 3)[flag], stride=2, padding=1)] 
                else: # stride : 1 
                    layers += [nn.Conv2d(in_channels, v, kernel_size=(1, 3)[flag])]
                flag = not flag # kernel_size = 1,3,1,3 ..
            in_channels = v
        return layers

4) multibox 

    multibox(vgg(base[str(size)], 3),add_extras(extras[str(size)], 1024),
             mbox[str(size)], num_classes) # [4, 6, 6, 6, 4, 4], 21

    def multibox(vgg, extra_layers, cfg, num_classes):
        loc_layers = [] # location (x,y,w,h)
        conf_layers = [] # class
        vgg_source = [21, -2]
        for k, v in enumerate(vgg_source):
            # conv4_3 , conv7 before ReLU
            loc_layers += [nn.Conv2d(vgg[v].out_channels,
                                     cfg[k] * 4, kernel_size=3, padding=1)]
            conf_layers += [nn.Conv2d(vgg[v].out_channels,
                            cfg[k] * num_classes, kernel_size=3, padding=1)]
        for k, v in enumerate(extra_layers[1::2], 2):
            # extras
            loc_layers += [nn.Conv2d(v.out_channels, cfg[k]
                                     * 4, kernel_size=3, padding=1)]
            conf_layers += [nn.Conv2d(v.out_channels, cfg[k]
                                      * num_classes, kernel_size=3, padding=1)]
        return vgg, extra_layers, (loc_layers, conf_layers)

### Related links

- [https://medium.com/@jonathan_hui/ssd-object-detection-single-shot-multibox-detector-for-real-time-processing-9bd8deac0e06](https://medium.com/@jonathan_hui/ssd-object-detection-single-shot-multibox-detector-for-real-time-processing-9bd8deac0e06)

[https://medium.com/@jonathan_hui/what-do-we-learn-from-single-shot-object-detectors-ssd-yolo-fpn-focal-loss-3888677c5f4d](https://medium.com/@jonathan_hui/what-do-we-learn-from-single-shot-object-detectors-ssd-yolo-fpn-focal-loss-3888677c5f4d)

- object detection series
    - [https://medium.com/m/signin](https://medium.com/m/signin)
- datacamp object detection basic
    - [https://www.datacamp.com/community/tutorials/object-detection-guide](https://www.datacamp.com/community/tutorials/object-detection-guide)
- SSD pdf
    - [https://arxiv.org/pdf/1512.02325.pdf](https://arxiv.org/pdf/1512.02325.pdf)
- [한글]
    - [https://junjiwon1031.github.io/2017/09/08/Single-Shot-Multibox-Detector.html](https://junjiwon1031.github.io/2017/09/08/Single-Shot-Multibox-Detector.html)
- pythoncocotool : [https://www.programcreek.com/python/example/94653/pycocotools.coco.COCO](https://www.programcreek.com/python/example/94653/pycocotools.coco.COCO)
- [https://neurohive.io/en/popular-networks/vgg16/](https://neurohive.io/en/popular-networks/vgg16/)
    - **CODE** 
    [https://github.com/amdegroot/ssd.pytorch](https://github.com/amdegroot/ssd.pytorch)
    - Code Explanation
        - [https://towardsdatascience.com/learning-note-single-shot-multibox-detector-with-pytorch-part-1-38185e84bd79](https://towardsdatascience.com/learning-note-single-shot-multibox-detector-with-pytorch-part-1-38185e84bd79)
        - [https://towardsdatascience.com/learning-note-single-shot-multibox-detector-with-pytorch-part-2-dd96bdf4f434](https://towardsdatascience.com/learning-note-single-shot-multibox-detector-with-pytorch-part-2-dd96bdf4f434)
        - [https://towardsdatascience.com/learning-note-single-shot-multibox-detector-with-pytorch-part-3-f0711caa65ad](https://towardsdatascience.com/learning-note-single-shot-multibox-detector-with-pytorch-part-3-f0711caa65ad)