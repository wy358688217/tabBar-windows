//
//  WindowsInfoView.m
//  tabbarTest
//
//  This is my class and another is not
//  Created by wang on 15/12/13.
//  Copyright © 2015年 Kevin. All rights reserved.
//

#import "WindowsInfoView.h"

@interface WindowsInfoView ()
@property (weak, nonatomic) IBOutlet UIView *effectView;
@end

@implementation WindowsInfoView

- (void)awakeFromNib
{
    self.hidden = NO;
    [self registerObserver:kWindowsViewWillShow];
    [self registerObserver:kWindowsViewWillHidden];
}

- (void)dealloc
{
    [self removeObserver:kWindowsViewWillShow];
    [self removeObserver:kWindowsViewWillHidden];
}

- (void)registerObserver:(NSString *)noticationName
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handNotification:)
                                                 name:noticationName
                                               object:nil];
}

- (void)removeObserver:(NSString *)noticationName
{
    [self removeObserver:self forKeyPath:noticationName];
}

- (void)handNotification:(NSNotification *)notetication
{
    if ([notetication.name isEqualToString:kWindowsViewWillHidden]) {
        [self hiddenWindowsView];
        return;
    }
    if ([notetication.name isEqualToString:kWindowsViewWillShow]) {
        [self showWindowsView];
    }
}

- (void)showWindowsView
{
    self.hidden = NO;
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } completion:^(BOOL finished) {
        NSLog(@"window 弹起");
    }];
}

- (void)hiddenWindowsView
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, self.frame.size.width, self.frame.size.height);
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
