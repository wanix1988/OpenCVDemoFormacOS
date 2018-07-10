//
//  ImageUtils.hpp
//  OpenCVDemo
//
//  Created by wang linwei on 2018/7/2.
//  Copyright © 2018年 wang linwei. All rights reserved.
//

#ifndef ImageUtils_hpp
#define ImageUtils_hpp

#ifdef check
    #define OS_X_STUPID_CHECK_MACRO check
    #undef check
#endif

#include <iostream>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>

#ifdef OS_X_STUPID_CHECK_MACRO
    #define check OS_X_STUPID_CHECK_MACRO
    #undef OS_X_STUPID_CHECK_MACRO
#endif

using namespace cv;

class ImageUtils {
public:
    static Mat canny(const String& inputImageFullPath);
    static Mat bgr2Gray(const String& inputImageFullPath);
    static Mat meanFilter(const String& inputImageFullPath);
    static Mat gaussianBlur(const String& inputImageFullPath);
    static Mat gaussianSharpen(const String& inputImageFullPath);
    static Mat erode(const String& inputImageFullPath);
    static Mat dilate(const String& inputIMageFullPath);
    static Mat ocr(const String& inputImageFullPath);
};

#endif /* ImageUtils_hpp */
