//
//  HorizontalProgressBarView.m
//  tabbarTest
//
//  Created by wang on 16/1/11.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "HorizontalProgressBarView.h"
#import "UIView+Category.h"

@interface HorizontalProgressBarView ()
@property (strong,nonatomic) UIView * trackV;
@property (strong,nonatomic) UIView * progressV;
@property (strong,nonatomic) UIImageView * trackImageV;
@property (strong,nonatomic) UIImageView * progressImageV;
@property (assign,nonatomic) CGSize mBarSize;
@property (assign, nonatomic)ProgressBarType miModelType;
@end

@implementation HorizontalProgressBarView
- (instancetype)initProgressImage:(UIImage *)progressImg
                       trackImage:(UIImage *)trackImg
                         withSize:(CGSize)size
                 withCornerRadius:(CGFloat)value
                            model:(ProgressBarType)type {
    self = [super init];
    if (self) {
        _miModelType = type;
        _progressImageV = [[UIImageView alloc] init];
        _trackImageV = [[UIImageView alloc] init];
        _mBarSize = size;
        
        [self setSize:size];
        //不让图片拉伸变形
        CGFloat top = self.mBarSize.height*0.5-0.5; // 顶端盖高度
        CGFloat bottom = top ; // 底端盖高度
        CGFloat left = self.mBarSize.width*0.5-0.5; // 左端盖宽度
        CGFloat right = left; // 右端盖宽度
        UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
        // 指定为拉伸模式，伸缩后重新赋值
        _progressImageV.image = [progressImg resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        _trackImageV.image = [trackImg resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        
        [self addSubview:_trackImageV];
        [self addSubview:_progressImageV];
        
        [_trackImageV setSize:size];
        [_progressImageV setZeroOrigin];
        [_progressImageV setFrameHeight:_mBarSize.height];
        
        [_trackImageV setCenter:self.center];
        
        _progressImageV.layer.cornerRadius = value > 0 ? value :(progressImg.size.height*0.5 + 0.5);
        _progressImageV.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setCurrentValue:(CGFloat)currentValue {
    CGFloat rate = currentValue > 0.0 ? (currentValue > 1.0) ? 1.0 : currentValue : 0.0;
    CGFloat width = rate * self.mBarSize.width;
    
    if (self.miModelType == DrawProgressBarByImage) {
        [self.progressImageV setFrameWidth:width];
        return;
    }
}
@end
