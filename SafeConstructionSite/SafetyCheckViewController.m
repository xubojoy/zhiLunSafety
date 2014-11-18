//
//  SafetyCheckViewController.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-18.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "SafetyCheckViewController.h"
#import "Macro.h"
#import "SliderViewController.h"

@interface SafetyCheckViewController ()

@end

@implementation SafetyCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initTableView];
    [self initHeaderView];
}

-(void)initHeaderView{
//    self.header = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
//    [self.view addSubview:self.header];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    view.backgroundColor = RGBACOLOR(23, 48, 106, 1);
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 20, 44, 44);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开合" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 44)];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.textColor = [UIColor whiteColor];
    [view addSubview:self.titleLab];
}

//-(void)showLeft:(UIButton *)sender{
//    [[SliderViewController sharedSliderController].navigationController popToViewController:[SliderViewController sharedSliderController].LeftVC animated:YES];
//}
- (void)backAction:(UIButton *)btn
{
    [[SliderViewController sharedSliderController].navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - 初始化tableView
-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WEIGHT, VIEW_HEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 9;
    }else if (section == 1){
        return 2;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 3 || indexPath.row == 4) {
            return 100;
        }else if (indexPath.row == 7){
            return 150;
        }else if (indexPath.row == 9){
            return 150;
        }
    }
    return 40;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
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
