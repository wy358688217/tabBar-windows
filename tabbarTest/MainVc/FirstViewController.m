//
//  FirstViewController.m
//  tabbarTest
//
//  Created by Kevin Lee on 13-5-6.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editTextView;

@end

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    return;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPopWindows:(id)sender
{
    return;
    UIView * windowsView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT*0.4, SCREEN_WIDTH, SCREEN_HEIGHT*0.6)];
    [windowsView setTag:0xad1000];
    windowsView.backgroundColor = [UIColor greenColor];
    
    UITapGestureRecognizer * viewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouchView)];
    [windowsView addGestureRecognizer:viewTap];

    [[UIApplication sharedApplication].keyWindow addSubview:windowsView];
    return;
    [[[UIApplication sharedApplication].windows firstObject] addSubview:windowsView];
}

- (void)onTouchView
{
    NSLog(@"触摸事件在最顶层的windows上");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    return;
    UIWindow * window = [[UIApplication sharedApplication].windows firstObject];
    UIView * windowsView = (UIView *)[window viewWithTag:0xad1000];
    if (!windowsView) {
        return;
    }
    [windowsView removeFromSuperview];
    windowsView = nil;
}

//test  not correct
//Code from Brett Schumann

-(void) keyboardWillShow:(NSNotification *)note
{
    // get keyboard size and loctaion
    CGRect keyboardBounds;
    [[note.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey] getValue: &keyboardBounds];
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    // Need to translate the bounds to account for rotation.
    keyboardBounds = [self.view convertRect:keyboardBounds toView:nil];
    
    // get a rect for the textView frame
    CGRect btnFrame = self.editTextView.frame;
    btnFrame.origin.y = self.view.bounds.size.height - (keyboardBounds.size.height + btnFrame.size.height);
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    [UIView setAnimationDelegate:self];
    
    // set views with new info
    self.editTextView.frame = btnFrame;
    // commit animations
    [UIView commitAnimations];
    
    
    UIWindow * window = [[UIApplication sharedApplication].windows firstObject];
    UIView * windowsView = (UIView *)[window viewWithTag:0xad1000];
    if (!windowsView) {
        return;
    }
    [windowsView removeFromSuperview];
    windowsView = nil;

}

- (void) keyboardWillHide:(NSNotification *)note
{
    NSNumber *duration = [note.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [note.userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];
    
    
    // get a rect for the textView frame
    CGRect btnFrame = self.editTextView.frame;
    btnFrame.origin.y = self.view.bounds.size.height + btnFrame.size.height;
    
    // animations settings
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:[duration doubleValue]];
    [UIView setAnimationCurve:[curve intValue]];
    
    // set views with new info
    self.editTextView.frame = btnFrame;
    
    // commit animations
    [UIView commitAnimations];
    
}
@end
