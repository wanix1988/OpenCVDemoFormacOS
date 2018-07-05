//
//  AppDelegate.m
//  OpenCVDemo
//
//  Created by wang linwei on 2018/7/2.
//  Copyright © 2018年 wang linwei. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize inputImageFullPath;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)openDocument:(id)sender {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseFiles = true;
    openPanel.canChooseDirectories = false;
    [openPanel beginWithCompletionHandler:^(NSModalResponse result) {
        NSURL *url = openPanel.URL;
        NSLog(@"%@", [url absoluteString]);
        self.inputImageFullPath = [url absoluteString];
        // show the image content in NSImageView
        [((ViewController *)self.currentViewController).srcImg setImage:[[NSImage alloc] initWithContentsOfURL: url]];
    }];
}

@end
