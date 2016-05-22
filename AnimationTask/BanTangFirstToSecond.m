//
//  BanTangFirstToSecond.m
//  AnimationTask
//
//  Created by zack on 16/5/21.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BanTangFirstToSecond.h"
#import "BanTangTransitionController.h"
#import "BanTangSecondController.h"
#import "BantangTableViewCell.h"
@implementation BanTangFirstToSecond
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    BanTangTransitionController *fromViewController = (BanTangTransitionController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    BanTangSecondController *toViewController = (BanTangSecondController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    // Get a snapshot of the thing cell we're transitioning from
    BantangTableViewCell *cell = (BantangTableViewCell*)[fromViewController.tableView cellForRowAtIndexPath:[[fromViewController.tableView indexPathsForSelectedRows] firstObject]];
    NSLog(@"%s,line num = %d \n %ld",__func__,__LINE__,[fromViewController.tableView indexPathForSelectedRow].row);

    UIView *cellImageSnapshot = [cell.imaView snapshotViewAfterScreenUpdates:YES];
    cellImageSnapshot.frame = [containerView convertRect:cell.imaView.frame fromView:cell.imaView.superview];
    NSLog(@"%s,line num = %d \n %@",__func__,__LINE__,NSStringFromCGRect([containerView convertRect:cell.imaView.frame fromView:cell.imaView.superview]));
    cell.imaView.hidden = YES;
    
    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;
    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration animations:^{
        // Fade in the second view controller's view
        toViewController.view.alpha = 1.0;
        
        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];

        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        // Clean up
        toViewController.imageView.hidden = NO;
        cell.imaView.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}


@end
