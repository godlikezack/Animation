//
//  TransitionFirstToSecond.m
//  AnimationTask
//
//  Created by zack on 16/5/21.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TransitionFirstToSecond.h"
#import "TransitionFirstController.h"
#import "TransitionSecondController.h"
@implementation TransitionFirstToSecond
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

/**
 *  定义两个 ViewController 之间过渡效果的地方
 *
 *  @param transitionContext 该参数可以让我们访问一些实现过渡所必须的对象 相当于试图上下文
 */
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    /** viewControllerForKey 我们可以通过他访问过渡的两个 ViewController*/
    UINavigationController *nav = (UINavigationController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    TransitionFirstController *fromViewController = (TransitionFirstController *)nav.topViewController;
    TransitionSecondController *toViewController = (TransitionSecondController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    /** containerView：两个 ViewController 的 containerView*/
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    /** afterUpdates参数表示是否在所有效果应用在视图上了以后再获取快照。例如，如果该参数为NO，则立马获取该视图现在状态的快照，反之，以下代码只能得到一个空白快照：*/
    UIView *cellImageSnapshot = [fromViewController.imageView snapshotViewAfterScreenUpdates:YES];
    
    cellImageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.containerView];
    fromViewController.imageView.hidden = YES;
    
    /** initialFrameForViewController 和 finalFrameForViewController 是过渡开始和结束时每个 ViewController 的 frame*/
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.secondImageview.hidden = YES;
    
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        
        toViewController.view.alpha = 1.0;
        
        
        CGRect frame = [containerView convertRect:toViewController.secondImageview.frame fromView:toViewController.view];
        NSLog(@"frame is %@",NSStringFromCGRect(toViewController.secondImageview.frame));
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        
        toViewController.secondImageview.hidden = NO;
        fromViewController.imageView.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
         // 声明过渡结束
        /** 一定别忘了在过渡结束时调用 completeTransition: 这个方法。*/
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}


@end
