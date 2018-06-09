//
//  KWRollingScrollView.m
//  KWMarqueeControl
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import "KWRollingScrollView.h"

#import "KWRollingScrollView.h"
#import "UIView+FrameExtension.h"

#define Screen_width ([UIScreen mainScreen].bounds.size.width)
#define Screen_height ([UIScreen mainScreen].bounds.size.height)
#define W self.bounds.size.width
#define H self.bounds.size.height

@interface KWRollingScrollView ()
@property (nonatomic,strong) NSMutableArray *titles;
@property(assign, nonatomic)int titleIndex;
@property(assign, nonatomic)int index;
@end

@implementation KWRollingScrollView
-(instancetype)initWithArray:(NSArray *)titles AndFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        NSMutableArray *MutableTitles = [NSMutableArray arrayWithArray:titles];
        NSString *str = @"";
        self.titles = MutableTitles;
        [self.titles addObject:str];
        self.index = 1;
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(0, 0, W, H);
        btn.tag = self.index;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:self.titles[0] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self addSubview:btn];
        self.clipsToBounds = YES;
        [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextButton) userInfo:nil repeats:YES];
    }
    return self;
}

+(instancetype)initWithTitleArray:(NSArray *)titles AndFrame:(CGRect)frame{
    return [[self alloc] initWithArray:titles AndFrame:frame];
}

-(void)nextButton{
    UIButton *firstBtn = [self viewWithTag:self.index];
    UIButton *modelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, H, W, H)];
    modelBtn.tag = self.index + 1;
    if ([self.titles[self.titleIndex + 1] isEqualToString:@""]) {
        self.titleIndex = -1;
        self.index = 0;
    }
    if (modelBtn.tag == self.titles.count) {
        modelBtn.tag = 1;
    }
    [modelBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [modelBtn setTitle:self.titles[self.titleIndex + 1] forState:UIControlStateNormal];
    [self addSubview:modelBtn];
    
    [UIView animateWithDuration:0.25 animations:^{
        firstBtn.y = -H;
        modelBtn.y = 0;
        
    } completion:^(BOOL finished) {
        [firstBtn removeFromSuperview];
    }];
    self.index++;
    self.titleIndex++;
}

-(void)clickBtn:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(clickTitleButton:)]) {
        [self.delegate clickTitleButton:btn];
    }
}
@end
