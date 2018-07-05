//
//  ImageUtils.cpp
//  OpenCVDemo
//
//  Created by wang linwei on 2018/7/2.
//  Copyright © 2018年 wang linwei. All rights reserved.
//

#include "ImageUtils.hpp"

Mat ImageUtils::canny(const String &inputImageFullPath) {
    std::cout << "do canny with " << inputImageFullPath << std::endl;
    Mat dest;
    Mat src = imread(inputImageFullPath).clone();
    std::cout << "before canny, src's size:" << src.size << std::endl;
    Canny(src, dest, 40, 80);
    std::cout << "after canny, dest's size:" << dest.size << std::endl;
    return dest;
}

