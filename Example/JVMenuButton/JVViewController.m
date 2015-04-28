//
//  JVViewController.m
//  JVMenuButton
//
//  Created by Jorge Valbuena on 04/27/2015.
//  Copyright (c) 2014 Jorge Valbuena. All rights reserved.
//

#import "JVViewController.h"
#import <JVMenuButton/JVButton.h>

@interface JVViewController ()

@property (nonatomic, strong) JVMenuButton *button;

@end

@implementation JVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // gradient background color
    [JVButtonHelper setGradientBackgroundInView:self.view withFirstHexColor:@"1D62F0" andSecondHexColor:@"1AD6FD"];
    
    self.button = [[JVMenuButton alloc] initWithFrame:CGRectMake(133, 133, 54, 54)];
    [self.button addTarget:self action:@selector(toggleJVMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


#pragma mark - JVMenuButton action

- (void)toggleJVMenuButton:(UIButton *)sender
{
    self.button.showButton = !self.button.showButton;
}

@end
