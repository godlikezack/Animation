//
//  BanTangTransitionController.m
//  AnimationTask
//
//  Created by zack on 16/5/21.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "BanTangTransitionController.h"
#import "BanTangSecondController.h"
#import "BanTangFirstToSecond.h"
#import "BantangTableViewCell.h"
static NSString * const kBanTangCell = @"BanTangCell";

@interface BanTangTransitionController ()<UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate>

@end

@implementation BanTangTransitionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Set outself as the navigation controller's delegate so we're asked for a transitioning object
    self.navigationController.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Stop being the navigation controller's delegate
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BantangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBanTangCell];
    cell.imaView.image = [UIImage imageNamed:@"b0"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Finish Click Action
    NSLog(@"%s,line num = %d \n %ld",__func__,__LINE__,[self.tableView indexPathForSelectedRow].row);

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BanTangSecondController *sec = [story instantiateViewControllerWithIdentifier:@"BanTangSecondController"];
    sec.indexPatn = indexPath;
    [self.navigationController pushViewController:sec animated:YES];
    
}


#pragma mark UINavigationControllerDelegate methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    // Check if we're transitioning from this view controller to a DSLSecondViewController
    if (fromVC == self && [toVC isKindOfClass:[BanTangSecondController class]]) {
        return [[BanTangFirstToSecond alloc] init];
    }
    else {
        return nil;
    }
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
