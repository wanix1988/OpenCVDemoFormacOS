//
//  ViewController.h
//  OpenCVDemo
//
//  Created by wang linwei on 2018/7/2.
//  Copyright © 2018年 wang linwei. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (strong) IBOutlet NSImageView *srcImg;
@property (strong) IBOutlet NSImageView *destImg;
- (IBAction)cannyClick:(id)sender;
@end

