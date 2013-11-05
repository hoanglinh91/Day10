//
//  ThrowBrick.h
//  Day10UIView
//
//  Created by Hoang Linh on 11/2/13.
//  Copyright (c) 2013 Hoang Linh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThrowBrick : UIImageView
@property (nonatomic, readwrite) CGPoint start;
@property (nonatomic, readwrite) CGPoint end;
@property (nonatomic, readwrite) CGSize length;
- (void)endPoint:(CGPoint) ending;
- (void)brickMove;
@end
