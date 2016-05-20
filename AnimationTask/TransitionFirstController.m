//
//  TransitionFirstController.m
//  AnimationTask
//
//  Created by zack on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TransitionFirstController.h"
#import "TransitionSecondController.h"
#import "TransitionFirstToSecond.h"
#import "TransitionSecondToFirst.h"
@interface TransitionFirstController ()

@end

@implementation TransitionFirstController
- (IBAction)clickBeginBtn:(UIButton *)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TransitionSecondController *sec = [story instantiateViewControllerWithIdentifier:@"TransitionSecondController"];
    sec.transitioningDelegate = self;
    [self presentViewController:sec animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[TransitionFirstToSecond alloc] init];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[TransitionSecondToFirst alloc] init];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
