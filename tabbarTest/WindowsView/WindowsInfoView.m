//
//  WindowsInfoView.m
//  tabbarTest
//
//  This is my class and another is not
//  Created by wang on 15/12/13.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "WindowsInfoView.h"
#import "EasyObserver.h"
#import "UIView+Category.h"

@interface WindowsInfoView ()
@property (weak, nonatomic) IBOutlet UIView *effectView;
@end

@implementation WindowsInfoView
{
    EasyObserver * _mpEasyObserver;
}

- (void)awakeFromNib
{
    self.hidden = NO;
    
    [self registerObserver];
}

- (void)dealloc
{
    [_mpEasyObserver shutDown];
    SAFE_RELEASE(_mpEasyObserver);
}

- (void)registerObserver
{
    if (_mpEasyObserver) {
        return;
    }
    _mpEasyObserver = [[EasyObserver alloc] init];
    WEAK_BLOCK_OBJECT(self);
    [_mpEasyObserver startUpListen:^(NSNotification * notiofication) {
        BLOCK_OBJECT(self);
        if ([notiofication.name isEqualToString:kWindowsViewWillHidden]) {
            [weak_self hiddenWindowsView];
            return;
        }
        if ([notiofication.name isEqualToString:kWindowsViewWillShow]) {
            [weak_self showWindowsView];
        }
    } withList:@[kWindowsViewWillShow,kWindowsViewWillHidden]];
}

- (void)showWindowsView
{
    self.hidden = NO;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self setZeroOrigin];
    } completion:^(BOOL finished) {
        NSLog(@"window 弹起");
    }];
}

- (void)hiddenWindowsView
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        [self setFrameY:SCREEN_HEIGHT];
    } completion:^(BOOL finished) {
        self.hidden = YES;
        NSLog(@"window 收起");
    }];
}

- (IBAction)onClose:(id)sender
{
    [self hiddenWindowsView];    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hiddenWindowsView];
}

@end
