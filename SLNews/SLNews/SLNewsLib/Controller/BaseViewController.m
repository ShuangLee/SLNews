//
//  BaseViewController.m
//  SLNews
//
//  Created by 光头强 on 16/10/9.
//  Copyright © 2016年 Ls. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self randomColor];
}

- (UIColor *)randomColor {
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0];
}
@end
