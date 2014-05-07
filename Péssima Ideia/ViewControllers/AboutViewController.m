//
//  AboutViewController.m
//  Péssima Ideia
//
//  Created by Alexandre Canuto on 04/05/14.
//  Copyright (c) 2014 Alexandre Canuto. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutView.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Animate first load.
    
    __block UIView *splashView = [[UIView alloc] initWithFrame:self.view.bounds];
    splashView.backgroundColor = COLOR_MAIN_YELLOW;
    [self.view addSubview: splashView];
    
    [UIView animateWithDuration:0.75 animations:^{
        splashView.frame = CGRectMake(splashView.frame.origin.x, -splashView.frame.size.height + 64, splashView.frame.size.width, splashView.frame.size.height);
    } completion:^(BOOL finished) {
        [splashView removeFromSuperview];
        splashView = nil;
        
        // Show status bar with animation.
        
        [self performSelector:@selector(showStatusBar) withObject:nil afterDelay:0.25];
    }];
    
    AboutView *aboutView = [[NSBundle mainBundle] loadNibNamed:@"AboutView" owner:self options:nil][0];
    
    [self.scrollViewMain addSubview:aboutView];
    self.scrollViewMain.contentSize = aboutView.frame.size;

}

- (void)showStatusBar {
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

@end
