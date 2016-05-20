//
//  ViewController.m
//  AnimationTask
//
//  Created by 臧其龙 on 16/4/6.
//  Copyright © 2016年 臧其龙. All rights reserved.
//

#import "ViewController.h"

static NSString * const kCellID = @"kCellID";

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<NSString *> *animationNames;
@property (nonatomic ,strong) NSString *titleStr;
@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationNames = @[@"ViewAnimation", @"LayerAnimation", @"TransitionAnimation", @"DynamicAnimation", @"ParticleAnimation"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource && Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.animationNames? self.animationNames.count:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    cell.textLabel.text = self.animationNames[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // TODO: Finish Click Action
    self.titleStr = self.animationNames[indexPath.row];
    [self performSegueWithIdentifier:self.animationNames[indexPath.row] sender:nil];

    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    [segue destinationViewController].title = self.titleStr;
}
@end
