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
@property (strong,nonatomic) UIImageView * trackImageV;
@property (strong,nonatomic) UIImageView * progressImageV;
@property (assign,nonatomic) CGSize mBarSize;
@end

@implementation HorizontalProgressBarView
- (instancetype)initProgressImage:(UIImage *)progressImg
                       trackImage:(UIImage *)trackImg
                         withSize:(CGSize)size
                 withCornerRadius:(CGFloat)value {
    self = [super init];
    if (self) {
        self.progressImageV = [[UIImageView alloc] init];
        self.trackImageV = [[UIImageView alloc] init];
        self.mBarSize = size;
        
        //不让图片拉伸变形
        CGFloat top = self.mBarSize.height*0.5-1; // 顶端盖高度
        CGFloat bottom = top ; // 底端盖高度
        CGFloat left = self.mBarSize.width*0.5-1; // 左端盖宽度
        CGFloat right = left; // 右端盖宽度
        UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
        // 指定为拉伸模式，伸缩后重新赋值
        self.progressImageV.image = [progressImg resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
        self.trackImageV.image = [trackImg resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];

        [self addSubview:self.trackImageV];
        [self addSubview:self.progressImageV];
        
        [self.trackImageV setFrame:CGRectMake(0, 0, self.mBarSize.width, self.mBarSize.height)];
        [self.progressImageV setZeroOrigin];
        [self.progressImageV setFrameHeight:self.mBarSize.height];
        
        self.progressImageV.layer.cornerRadius = progressImg.size.height*0.5 + 0.5;
        self.progressImageV.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setCurrentValue:(CGFloat)currentValue {
    CGFloat rate = currentValue > 0.0 ? (currentValue > 1.0) ? 1.0 : currentValue : 0.0;
    CGFloat width = rate * self.mBarSize.width;
    [self.progressImageV setFrameWidth:width];
}
@end
