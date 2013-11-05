//
//  BouncingBall.m
//  Day10UIView
//
//  Created by Hoang Linh on 11/2/13.
//  Copyright (c) 2013 Hoang Linh. All rights reserved.
//

#import "BouncingBall.h"
#import "myBall.h"

@interface BouncingBall ()

@property (strong , nonatomic) myBall *ball;
@property (strong , nonatomic) NSArray *posArray;

@end

@implementation BouncingBall

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGPoint pos = CGPointMake(self.view.frame.size.width, self.view.frame.size.height);
    self.ball = [[myBall alloc] initWithFrame:CGRectMake(pos.x /2, 0, 100, 100)];
    [self.ball startAnimating];
    [self.view addSubview:self.ball];
    float radius = self.ball.bounds.size.width/2;
    
    self.posArray = @[[NSNumber numberWithFloat:radius] // y = 0
                      ,[NSNumber numberWithFloat:pos.y-radius] // x = 0
                      ,[NSNumber numberWithFloat:pos.x - radius] // y = 0
                      ,[NSNumber numberWithFloat:radius]]; // x = 0
    
}

- (void)movingBall:(int) value
{
    if(value == 256)
        return;
    [UIView animateWithDuration:(arc4random() % 3 + 2) animations:^{
        if (value % 2) {
            float xOrY = arc4random() % (int)(self.view.frame.size.width / 2) * 1.0;
            while (xOrY <= 50 || xOrY >= self.view.frame.size.width - 50) {
                xOrY = arc4random() % (int)self.view.frame.size.width * 1.0;
            }
            self.ball.center = CGPointMake(xOrY, [self.posArray[value % 4] floatValue]);
            NSLog(@"%2.1f- %2.1f, %2.1f-%2.1f",self.ball.center.x,self.view.frame.size.width,self.ball.center.y,self.view.frame.size.height);
        }
        else
        {
            float xOrY = arc4random() % (int)(self.view.frame.size.height/ 2) * 1.0;
            while (xOrY <= 50 || xOrY >= self.view.frame.size.height - 50) {
                xOrY = arc4random() % (int)self.view.frame.size.height * 1.0;
            }
            self.ball.center = CGPointMake([self.posArray[value % 4] floatValue], xOrY);
            NSLog(@"%2.1f- %2.1f, %2.1f-%2.1f",self.ball.center.x,self.view.frame.size.width,self.ball.center.y,self.view.frame.size.height);
        }
    }completion:^(BOOL finished) {
        [self movingBall:(value + 1)];
    }];
}

- (IBAction)boucing:(id)sender {
    [self movingBall:0];
}
- (IBAction)goodBye:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
