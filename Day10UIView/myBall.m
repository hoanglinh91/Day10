//
//  myBall.m
//  Day10UIView
//
//  Created by Hoang Linh on 11/2/13.
//  Copyright (c) 2013 Hoang Linh. All rights reserved.
//

#import "myBall.h"

@implementation myBall

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (int i=1; i<17; i++) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
            [array addObject:img];
        }
        NSLog(@"%d",[array count]);
        self.animationImages = [[NSArray alloc] initWithArray:array];
        self.animationDuration = 1;
        self.animationRepeatCount = 0;
    }
    return self;
}

@end
