//
//  ViewController.m
//  KWMarqueeControl
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "ViewController.h"
#import "KWRollingScrollView.h"
#import "UIView+FrameExtension.h"
#import "KWLeftScrollView.h"

@interface ViewController ()<KWRollintScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat w = (CGRectGetWidth(self.view.frame) - 150.0) / 2;
    NSArray *array = @[@"上下滚动", @"简单向左"];
    for (int i = 0; i < array.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(50 + (50 + w) * (i % 2), 70 + 55 * (i / 2), w, 45);
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100: {
            NSArray *array = @[@"ViewController", @"scroView", @"centerY", @"Screen_width"];
            KWRollingScrollView *scroView = [KWRollingScrollView initWithTitleArray:array AndFrame:CGRectMake(0, self.view.centerY - 50, self.view.width, 40)];
            scroView.backgroundColor = [UIColor redColor];
            scroView.delegate =self;
            [self.view addSubview:scroView];
        }
            break;
        case 101: {
            KWLeftScrollView *leftView = [[KWLeftScrollView alloc] initWithFrame:CGRectMake(0, self.view.centerY + 50, self.view.width, 50) withTitle:@"Objective-C 是 C 的超集，提供了面向对象的机制，而面向对象思想里有两个重要的概念类和实例。"];
            [self.view addSubview:leftView];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
