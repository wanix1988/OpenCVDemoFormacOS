//
//  ViewController.m
//  OpenCVDemo
//
//  Created by wang linwei on 2018/7/2.
//  Copyright © 2018年 wang linwei. All rights reserved.
//
#import "AppDelegate.h"
#import "ViewController.h"
#include "ImageUtils.hpp"

@interface ViewController ()
@property (strong) NSString *inputImageFullPath;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self refreshImageFullPath];
}

- (void)refreshImageFullPath {
    AppDelegate *app = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    if (app.inputImageFullPath) {
        [_srcImg setImage:[[NSImage alloc] initWithContentsOfFile: app.inputImageFullPath]];
    } else {
        // just show a beautiful girl
        [_srcImg setImage:[NSImage imageNamed:@"1.jpg"]];
        NSString *path = [self getResourcePathByName:@"1.jpg"];
        NSLog(@"%@", path);
        app.inputImageFullPath = [[NSString alloc] initWithFormat:@"file://%@", path];
    }
    app.currentViewController = self;
    self.inputImageFullPath = app.inputImageFullPath;
    Mat src;
    [self updateUI:src output:src forInPath:[self.inputImageFullPath UTF8String] forOutPath:"" forName:@"1.jpg"];
}

- (Mat)doBgr2Gray:(const char *)imgPath {
    return ImageUtils::bgr2Gray(imgPath);
}

- (Mat)doMeanFilter:(const char *)imgPath {
    return ImageUtils::meanFilter(imgPath);
}

- (Mat)doGaussianBlur:(const char *)imgPath  {
    return ImageUtils::gaussianBlur(imgPath);
}

- (Mat)doGaussianSharpen:(const char *)imgPath  {
    return ImageUtils::gaussianSharpen(imgPath);
}

- (Mat)doErode:(const char *)imgPath {
     return ImageUtils::erode(imgPath);
}

- (Mat)doDilate:(const char *)imgPath {
    return ImageUtils::dilate(imgPath);
}

- (Mat)doCanny:(const char *)imgPath  {
    return ImageUtils::canny(imgPath);
}

- (Mat)doOcr:(const char *)imgPath  {
    return ImageUtils::ocr(imgPath);
}

- (NSString *)getResourcePathByName:(NSString *)name {
    NSArray *aArray = [name componentsSeparatedByString:@"."];
    NSString *fileName = [aArray objectAtIndex:0];
    NSString *suffix = [aArray objectAtIndex:1];
    return [[NSBundle mainBundle] pathForResource:fileName ofType: suffix];
}

- (void)updateUI:(Mat&)srcImage output:(Mat&)destImg forInPath:(const char *)imgPath forOutPath:(const char *) outputImgPath forName:(NSString *)name {
    [_destImg setImage:[[NSImage alloc] initWithContentsOfFile:name]];
    Mat mat;
    if (srcImage.empty()) {
        if (!destImg.empty()){
            mat = destImg;
        }
    } else {
        mat = srcImage;
    }
    NSString *sizeInfo = [[NSString alloc] initWithFormat:@"%dw:%dh", mat.cols, mat.rows];
    [_imgSizeLabel setStringValue:sizeInfo];
    NSString *pathInfo = [[NSString alloc] initWithUTF8String:imgPath];
    [_imgPathLabel setStringValue:pathInfo];
    NSString *outpoutPathInfo = [[NSString alloc] initWithUTF8String:outputImgPath];
    [_imgOutputPath setStringValue:outpoutPathInfo];
}

- (IBAction)btnClick:(id)sender {
    [self refreshImageFullPath];
    NSInteger tag = [sender tag];
    NSLog(@"button click");
    Mat destImg;
    const char *imgPath;
    if (self.inputImageFullPath == nil) {
        [_srcImg setImage:[NSImage imageNamed:@"1.jpg"]];
        imgPath = [[self getResourcePathByName:@"1.jpg"] UTF8String];
        NSLog(@"imgPath:%s", imgPath);
    } else {
        NSLog(@"%@", self.inputImageFullPath);
        [_srcImg setImage:[[NSImage alloc] initWithContentsOfURL:[[NSURL alloc] initWithString: self.inputImageFullPath]]];
        imgPath = [[self.inputImageFullPath substringFromIndex:7] UTF8String];
    }
    NSString *name;
    switch (tag) {
        case 0:
            name = @"gray.jpg";
            destImg = [self doBgr2Gray:imgPath];
            break;
        case 1:
            name = @"meanfilter.jpg";
            destImg= [self doMeanFilter:imgPath];
            break;
        case 2:
            name = @"gaussianblur.jpg";
            destImg = [self doGaussianBlur:imgPath];
            break;
        case 3:
            name = @"guassiansharpen.jpg";
            destImg = [self doGaussianSharpen:imgPath];
            break;
        case 4:
            name = @"erode.jpg";
            destImg = [self doErode:imgPath];
            break;
        case 5:
            name = @"dilate.jpg";
            destImg = [self doDilate:imgPath];
            break;
        case 6:
            name = @"canny.jpg";
            destImg = [self doCanny:imgPath];
            break;
        case 7:
            name = @"ocr.jpg";
            destImg = [self doOcr:imgPath];
            break;
        default:
            NSLog(@"No such operation, exit");
            return;
    }
    //TODO: 此处应该修改为输出到指定目录下
    imwrite([name UTF8String], destImg);
    Mat srcImg = imread(imgPath);
    [self updateUI:srcImg output:destImg forInPath:imgPath forOutPath:[name UTF8String] forName:name];
}
@end
