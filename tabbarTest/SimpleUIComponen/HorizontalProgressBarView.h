//
//  HorizontalProgressBarView.h
//  tabbarTest
//
//  Created by wang on 16/1/11.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, ProgressBarType) {
    DrawProgressBarByImage = 1 << 0,
    DrawProgressBarWithColor = 1 << 1,
};
@interface HorizontalProgressBarView : UIView
@property (assign,nonatomic) CGFloat cornerRadiusValue;
@property (assign,nonatomic) CGFloat currentValue;
- (instancetype)initProgressImage:(UIImage *)progressImg
                       trackImage:(UIImage *)trackImg
                         withSize:(CGSize)size
                 withCornerRadius:(CGFloat)value
                            model:(ProgressBarType)type;
- (void)setCurrentValue:(CGFloat)currentValue;
@end
