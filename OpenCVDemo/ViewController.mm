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
{
    @private
    NSString *inputImageFullPath;
}
- (void)doCanny;
- (void)doBgr2Gray;
- (void)doErote;
@end

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

- (void)doCanny {
    Mat destImg;
    if ( [self inputImageFullPath] == nil) {
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

- (IBAction)btnClick:(id)sender {
    AppDelegate *app = (AppDelegate *)[[NSApplication sharedApplication] delegate];
    NSString *inputImageFullPath = app.inputImageFullPath;
    NSInteger tag = [sender tag];
    NSLog(@"button click");
    switch (tag) {
        case 0:
            [self doBgr2Gray:inputImageFullPath];
            break;
        case 1:
            [self doMeanFilter:inputImageFullPath];
            break;
        case 2:
            [self doGaussianBlur:inputImageFullPath];
            break;
        case 3:
            [self doGuassian]
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            [self doCanny:inputImageFullPath];
            break;
        case 7:
            break;
        default:
            break;
    }
}
@end
