//
//  CABasicAnimation+Extension.m
//  AnimationTask
//
//  Created by zack on 16/5/19.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "CABasicAnimation+Extension.h"
static CGFloat const kAnimationDuration = 1;

@implementation CABasicAnimation (Extension)
+ (CABasicAnimation *)animationWithKeyPath:(NSString *)keyPath
                                  duration:(CFTimeInterval)duration
                                 fromValue:(id)from
                                   toValue:(id)to{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:keyPath];
    animation.duration = duration;
    animation.fromValue = from;
    animation.toValue = to;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    return animation;
}

+ (CABasicAnimation *)shapePathAnimationWithFromPath:(UIBezierPath *)fromPath
                                              toPath:(UIBezierPath *)toPath
                                             reverse:(BOOL)isReverse{
    if (isReverse) {
        return [self animationWithKeyPath:@"path" duration:kAnimationDuration fromValue:(id)fromPath.CGPath toValue:(id)toPath.CGPath];
    }else{
        return [self animationWithKeyPath:@"path" duration:kAnimationDuration fromValue:(id)toPath.CGPath toValue:(id)fromPath.CGPath];
    }
}
@end
