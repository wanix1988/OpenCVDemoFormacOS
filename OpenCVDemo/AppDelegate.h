//
//  AppDelegate.h
//  OpenCVDemo
//
//  Created by wang linwei on 2018/7/2.
//  Copyright © 2018年 wang linwei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSMenuItem *openMenuItem;
@property (strong, nonatomic) NSString *inputImageFullPath;
@property (strong) NSViewController *currentViewController;
@end

