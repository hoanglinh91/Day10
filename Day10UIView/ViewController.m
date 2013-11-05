//
//  ViewController.m
//  Day10UIView
//
//  Created by Hoang Linh on 11/2/13.
//  Copyright (c) 2013 Hoang Linh. All rights reserved.
//

#import "ViewController.h"
#import "BouncingBall.h"
#import "Mario.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bouncingBall:(id)sender {
    BouncingBall *ball = [[BouncingBall alloc] init];
    [self presentViewController:ball animated:YES completion:nil];
}

- (IBAction)mario:(id)sender {
    Mario *mario = [[Mario alloc] init];
    [self presentViewController:mario animated:YES completion:nil];
}

@end
