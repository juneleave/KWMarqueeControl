//
//  KWLeftScrollView.h
//  KWMarqueeControl
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KWLeftScrollView : UIView
- (instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

- (void)start;

- (void)stop;
@end
