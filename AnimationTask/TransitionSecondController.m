//
//  TransitionSecondController.m
//  AnimationTask
//
//  Created by zack on 16/5/20.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "TransitionSecondController.h"

@interface TransitionSecondController ()

@end

@implementation TransitionSecondController
- (IBAction)clickCloseBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.secondImageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"b0"]];
    self.secondImageview.frame = CGRectMake(0, 0, 200, 200);
    self.secondImageview.center = self.view.center;
    self.secondImageview.layer.masksToBounds = YES;
    self.secondImageview.layer.cornerRadius = 100;
    self.secondImageview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.secondImageview];
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
