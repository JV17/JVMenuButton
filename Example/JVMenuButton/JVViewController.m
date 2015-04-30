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
@property (nonatomic, strong) JVMenuButton *button2;
@property (nonatomic, strong) JVMenuButton *button3;
@property (nonatomic, strong) JVMenuButton *button4;

@end


@implementation JVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // gradient background color
    [JVButtonHelper setGradientBackgroundInView:self.view withFirstHexColor:@"1D62F0" andSecondHexColor:@"1AD6FD"];
    
    self.button = [[JVMenuButton alloc] initWithFrame:CGRectMake(109, 100, 104, 104) color:[JVButtonHelper colorWithHexString:@"F7F7F7"] lineWidth:1];
    self.button.tag = 1;
    [self.button addTarget:self action:@selector(toggleJVMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
    
    self.button2 = [[JVMenuButton alloc] initWithFrame:CGRectMake(133, 238, 54, 54) color:[JVButtonHelper colorWithHexString:@"4A4A4A"] lineWidth:2];
    self.button2.tag = 2;
    [self.button2 addTarget:self action:@selector(toggleJVMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button2];

    self.button3 = [[JVMenuButton alloc] initWithFrame:CGRectMake(133, 333, 54, 54) color:[JVButtonHelper colorWithHexString:@"1F1F21"] lineWidth:3];
    self.button3.tag = 3;
    [self.button3 addTarget:self action:@selector(toggleJVMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button3];
    
    self.button4 = [[JVMenuButton alloc] initWithFrame:CGRectMake(139, 433, 40, 40) color:[JVButtonHelper colorWithHexString:@"00000"] lineWidth:2];
    self.button4.tag = 4;
    [self.button4 addTarget:self action:@selector(toggleJVMenuButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button4];

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
    if(sender.tag == 1)
    {
        self.button.showButton = !self.button.showButton;
    }
    else if(sender.tag == 2)
    {
        self.button2.showButton = !self.button2.showButton;
    }
    else if(sender.tag == 3)
    {
        self.button3.showButton = !self.button3.showButton;
    }
    else if(sender.tag == 4)
    {
        self.button4.showButton = !self.button4.showButton;
    }
}

@end
