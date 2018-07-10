//
//  ImageUtils.cpp
//  OpenCVDemo
//
//  Created by wang linwei on 2018/7/2.
//  Copyright © 2018年 wang linwei. All rights reserved.
//

#include "ImageUtils.hpp"

Mat ImageUtils::canny(const String &inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    Canny(src, dest, 40, 80);
    return dest;
}

Mat ImageUtils::bgr2Gray(const String& inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    cvtColor(src, dest, CV_BGR2GRAY);
    return dest;
}

Mat ImageUtils::meanFilter(const String& inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    medianBlur(src, dest, 3);
    return dest;
}

Mat ImageUtils::gaussianBlur(const String& inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath);
    GaussianBlur(src, dest, Size(3, 3), 8);
    return dest;
}

Mat ImageUtils::gaussianSharpen(const String& inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    Mat kernel(3,3,CV_32F,Scalar(-1));
    kernel.at<float>(1,1) = 8.9;
    filter2D(src, dest, src.depth(), kernel);
    return dest;
}

Mat ImageUtils::erode(const String& inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    Mat kernel(3, 3, CV_32F, Scalar(-1));
    cv::erode(src, dest, kernel);
    return dest;
}

Mat ImageUtils::dilate(const String& inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    Mat kernel(3, 3, CV_32F, Scalar(-1));
    cv::dilate(src, dest, kernel);
    return dest;
}

Mat ImageUtils::ocr(const String& inputImageFullPath) {
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    return src;
}
