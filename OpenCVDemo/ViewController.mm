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

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    // just show a beautiful girl
    AppDelegate *app = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    if (app.inputImageFullPath) {
        [_srcImg setImage:[[NSImage alloc] initWithContentsOfFile: app.inputImageFullPath]];
    } else {
        [_srcImg setImage:[NSImage imageNamed:@"1.jpg"]];
    }
    app.currentViewController = self;
}

- (IBAction)cannyClick:(id)sender {
    AppDelegate *app = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    NSString *inputImageFullPath = app.inputImageFullPath;
    Mat destImg;
    if (inputImageFullPath == nil) {
        [_srcImg setImage:[NSImage imageNamed:@"1.jpg"]];
        NSString *itemPath = @"1.jpg";
        NSArray *aArray = [itemPath componentsSeparatedByString:@"."];
        NSString *fileName = [aArray objectAtIndex:0];
        NSString *suffix = [aArray objectAtIndex:1];
        NSString *imgPath = [[NSBundle mainBundle] pathForResource:fileName ofType: suffix];
        NSLog(@"imgPath:%@", imgPath);
        destImg = ImageUtils::canny([imgPath UTF8String]);
    } else {
        NSLog(@"%@", inputImageFullPath);
        [_srcImg setImage:[[NSImage alloc] initWithContentsOfURL:[[NSURL alloc] initWithString: inputImageFullPath]]];
        destImg = ImageUtils::canny([[inputImageFullPath substringFromIndex:7] UTF8String]);
    }
    imwrite([@"canny.jpg" UTF8String], destImg);
    [_destImg setImage:[[NSImage alloc] initWithContentsOfFile:@"canny.jpg"] ];
}
@end
