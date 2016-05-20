//
//  TransitionFirstController.h
//  AnimationTask
//
//  Created by zack on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransitionFirstController : UIViewController<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;


@end
