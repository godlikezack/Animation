//
//  CABasicAnimation+Extension.h
//  AnimationTask
//
//  Created by zack on 16/5/19.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CABasicAnimation (Extension)
+ (CABasicAnimation *)shapePathAnimationWithFromPath:(UIBezierPath *)fromPath
                                              toPath:(UIBezierPath *)toPath
                                             reverse:(BOOL)isReverse;
@end
