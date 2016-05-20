//
//  ViewAnimationController.m
//  AnimationTask
//
//  Created by zack on 16/5/19.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ViewAnimationController.h"
#import "CABasicAnimation+Extension.h"
@interface ViewAnimationController ()
@property (nonatomic ,strong) UIButton *button;
@property (nonatomic ,strong) UIBezierPath *startPath;
@property (nonatomic ,strong) UIBezierPath *endPath;
@property (nonatomic ,strong) CAShapeLayer *maskLayer;
@property (nonatomic ,assign ,getter = isReverse) BOOL reverse;
@end

@implementation ViewAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    CALayer *layer = [CALayer layer];
//    layer.bounds = CGRectMake(200, 200, 104, 104);
//    layer.cornerRadius = 52;
//    layer.borderColor = [UIColor blueColor].CGColor;
//    layer.borderWidth = 2;
    
    CGRect startRect = CGRectMake(0, 0, 100, 100);
    CGRect endRect = CGRectMake(25, 25, 50, 50);

    self.startPath = [UIBezierPath bezierPathWithRoundedRect:startRect cornerRadius:50];
    self.endPath = [UIBezierPath bezierPathWithRoundedRect:endRect cornerRadius:10];

    self.maskLayer = [CAShapeLayer layer];
    self.maskLayer.path = self.startPath.CGPath;
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.backgroundColor = [UIColor redColor];
    self.button.frame = CGRectMake(100, 100, 100, 100);
    self.button.layer.mask = self.maskLayer;

//    [self.button.layer addSublayer:layer];
//    [layer setNeedsDisplay];

    [self.button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    self.reverse = YES;
    
}


- (void)clickBtn {
    [self.button.layer removeAllAnimations];
    [self.maskLayer addAnimation:[CABasicAnimation shapePathAnimationWithFromPath:self.startPath toPath:self.endPath reverse:self.isReverse] forKey:@"AnimationPath"];
    self.reverse = !self.isReverse;
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
