//
//  Mario.m
//  Day10UIView
//
//  Created by Hoang Linh on 11/2/13.
//  Copyright (c) 2013 Hoang Linh. All rights reserved.
//

#import "Mario.h"
#import "ThrowBrick.h"

@interface Mario ()
@property (nonatomic) int tag;
@property (nonatomic , strong) UIImageView *myMario;
@property (nonatomic) BOOL dir;
@property (nonatomic , getter = isStillLive) BOOL stillLive;
@end

@implementation Mario

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSTimer *myTime = [NSTimer scheduledTimerWithTimeInterval:0.025 target:self selector:@selector(chkUpdate) userInfo:nil repeats:YES];
    NSTimer *brickTime = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(genBrick) userInfo:nil repeats:YES];
    
    self.tag = 1;
    self.dir = YES;
    
    self.myMario = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 160,100,70)];
    [self.myMario setImage:[UIImage imageNamed:@"mm"]];
    [self.view addSubview:self.myMario];
}

- (void)genBrick
{
    if (!self.stillLive) {
        ThrowBrick *img = [[ThrowBrick alloc] initWithFrame:CGRectMake(arc4random()%(int)self.view.frame.size.width, 0, 50, 50)];
        img.tag = self.tag++;
        [img endPoint:CGPointMake(self.myMario.center.x, self.myMario.center.y)];
        [self.view addSubview:img];
    }
}


- (void)chkUpdate
{
    // collision
    if (!self.stillLive) {
    
    for (ThrowBrick *brick in self.view.subviews) {
        if (brick.tag > 0) {
            [brick brickMove];
//            NSLog(@"%2.1f %2.1f",brick.center.x,brick.center.y);
            if (brick.center.y >= self.myMario.frame.origin.y) {
                [brick removeFromSuperview];
            }
            CGPoint pos = CGPointMake(brick.frame.origin.x, brick.frame.origin.y);
            CGSize size = CGSizeMake(brick.bounds.size.width, brick.bounds.size.height);
            pos.y += size.height;
            if (pos.y >= self.myMario.frame.origin.y) {
                NSLog(@"%2.1f %2.1f",pos.y,self.myMario.frame.origin.y);
                if (pos.x >= self.myMario.frame.origin.x && pos.x <= self.myMario.frame.origin.x + self.myMario.frame.size.width) {
                    //NSLog(@"%2.1f %2.1f",pos.x,self.myMario.frame.origin.x);
                   [self.myMario removeFromSuperview];
                    self.stillLive = !self.stillLive;
                    break;
                }
                pos.x += size.width;
                if (pos.x >= self.myMario.frame.origin.x && pos.x <= self.myMario.frame.origin.x + self.myMario.frame.size.width) {
                    //NSLog(@"%2.1f %2.1f",pos.x,self.myMario.frame.origin.x);
                    [self.myMario removeFromSuperview];
                    self.stillLive = !self.stillLive;
                    break;
                }
            }
            
        }
    }
    }
    else
    {
        UIImageView *gameOver = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"abc.jpg"]];
        [gameOver setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        gameOver.contentMode = UIViewContentModeScaleAspectFill;
        gameOver.alpha = 0.0;
        [self.view addSubview:gameOver];
        ////
        [UIView animateWithDuration:4 animations:^{
            gameOver.alpha = 1.0;
        }completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:YES completion:Nil];
        }];
    }
}

- (IBAction)moveRight:(id)sender {
    if (!self.dir) {
        [self.myMario setImage:[UIImage imageNamed:@"mm"]];
        self.dir = !self.dir;
    }
    if (self.myMario.center.x < self.view.bounds.size.width - self.myMario.bounds.size.width / 2) {
        [UIView animateWithDuration:0.3 animations:^{
            self.myMario.center = CGPointMake(self.myMario.center.x + 35, self.myMario.center.y);
        }];
    }
}

- (IBAction)moveLeft:(id)sender {
    if (self.dir) {
        [self.myMario setImage:[UIImage imageNamed:@"mm1"]];
        self.dir = !self.dir;
    }
    if (self.myMario.center.x > self.myMario.bounds.size.width / 2) {
        [UIView animateWithDuration:0.3 animations:^{
            self.myMario.center = CGPointMake(self.myMario.center.x - 35, self.myMario.center.y);
        }];
    }
}

- (IBAction)fire:(id)sender {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
