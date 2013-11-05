//
//  ThrowBrick.m
//  Day10UIView
//
//  Created by Hoang Linh on 11/2/13.
//  Copyright (c) 2013 Hoang Linh. All rights reserved.
//

#import "ThrowBrick.h"

@interface ThrowBrick()
@property (nonatomic , readwrite) const float velo;
@end

@implementation ThrowBrick

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.start = CGPointMake(self.frame.origin.x, self.frame.origin.y);
        self.image = [UIImage imageNamed:@"brick"];
        self.velo = 80;
    }
    return self;
}


- (void) endPoint:(CGPoint)ending
{
    self.end = ending;
    float px = self.end.x - self.start.x;
    float py = self.end.y - self.start.y;
    self.length = CGSizeMake(px / self.velo, py / self.velo);
}

- (void)brickMove
{
    self.start = CGPointMake(self.start.x + self.length.width, self.start.y + self.length.height);
    self.center = CGPointMake(self.center.x + self.length.width, self.start.y + self.length.height);
}
@end
