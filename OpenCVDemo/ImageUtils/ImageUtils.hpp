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
};

#endif /* ImageUtils_hpp */
