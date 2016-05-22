//
//  BanTangSecondToFirst.m
//  AnimationTask
//
//  Created by zack on 16/5/22.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BanTangSecondToFirst.h"
#import "BanTangTransitionController.h"
#import "BanTangSecondController.h"
#import "BantangTableViewCell.h"
@implementation BanTangSecondToFirst
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    BanTangSecondController *fromViewController = (BanTangSecondController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BanTangTransitionController *toViewController = (BanTangTransitionController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the image view
    UIView *imageSnapshot = [fromViewController.imageView snapshotViewAfterScreenUpdates:NO];
    imageSnapshot.frame = [containerView convertRect:fromViewController.imageView.frame fromView:fromViewController.imageView.superview];
    fromViewController.imageView.hidden = YES;
    
    // Get the cell we'll animate to
    BantangTableViewCell *cell = [toViewController.tableView cellForRowAtIndexPath:fromViewController.indexPatn];
    cell.imaView.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    [containerView addSubview:toViewController.view];
    [containerView addSubview:imageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade out the source view controller
        fromViewController.view.alpha = 0.0;
        
        // Move the image view
        imageSnapshot.frame = [containerView convertRect:cell.imageView.frame fromView:cell.imageView.superview];
    } completion:^(BOOL finished) {
        // Clean up
        [imageSnapshot removeFromSuperview];
        fromViewController.imageView.hidden = NO;
        cell.imaView.hidden = NO;
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}
@end
