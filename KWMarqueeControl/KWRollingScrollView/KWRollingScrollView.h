//
//  KWRollingScrollView.h
//  KWMarqueeControl
//
//  Created by KW on 18/6/9.
//  Copyright © 2018年 KW. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KWRollintScrollViewDelegate <NSObject>
@optional
-(void)clickTitleButton:(UIButton *)button;
@end

@interface KWRollingScrollView : UIView
@property (nonatomic,strong) id<KWRollintScrollViewDelegate> delegate;
-(instancetype)initWithArray:(NSArray *)titles AndFrame:(CGRect)frame;
+(instancetype)initWithTitleArray:(NSArray *)titles AndFrame:(CGRect)frame;
@end
