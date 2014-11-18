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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"走这儿啦" object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initTableView];
    [self initHeaderView];
    [self initData];
    
}

-(void)initData{
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"施工单位----安全检查记录",@"检查时间：2014.11.18",@"项目：工程项目A",@"受检单位：首汽集团",@"检查情况：\n       在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中在欢乐的音乐声中",@"检查人：张三",@"受检单位签字：首汽集团",@"整改要求：\n       来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门来自各种检测，地方两局，质量协会等不同部门", nil];
}

-(void)initHeaderView{
    self.header = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    self.header.titleLab.text = self.titleStr;
    [self.view addSubview:self.header];
}

#pragma mark - 初始化tableView
-(void)initTableView{
    
    CGRect frame = self.tableView.frame;
    if (IOS_7) {
        frame = CGRectMake(0, 44, VIEW_WEIGHT, VIEW_HEIGHT-44);
    }else{
        frame = CGRectMake(0, 64, VIEW_WEIGHT, VIEW_HEIGHT-64);
    }
    self.tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 4) {
        return 150;
    }else if (indexPath.row == 7){
        return 220;
    }
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    if (indexPath.row == 0) {
        cell.textLabel.font = [UIFont systemFontOfSize:14];
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
