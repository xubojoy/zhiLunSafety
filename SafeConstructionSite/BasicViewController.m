//
//  BasicViewController.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-18.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "BasicViewController.h"
#import "SliderViewController.h"
#import "Macro.h"
@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initTableView];
    [self initHeaderView];
    [self initData];
}

-(void)initData{
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"施工单位----基础管理考核评价表(100分)",@"合同段：",@"施工单位名称：",@"安全生产条件(24分)",@"1.1*施工单位安全生产许可证(4分)\n      考核内容及评价标准：\n      施工单位安全生产许可证有效。\n      考核评价方法：\n      查证书。\n      扣分标准：\n      安全生产许可证失效扣4分。",@"得分：",@"备注：",@"1.2*从业人员资格条件（4分）\n      考核内容及评价标准：\n      项目负责人及安全管理人员项目负责人及安全管理\n      人员项目负责人及安全管理人员项目负责人及安全\n      管理人员项目负责人及安全管理人员。\n      考核评价方法：\n      查三类人员证件。\n      查台账。\n      扣分标准：\n      每发现一例每发现一例每发现一例每发现一例每发\n      现一例每发现一例每发现一例每发现一例每发现一\n      例每发现一例每发现一例", nil];
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
    if (indexPath.row == 3) {
        return 30;
    }
   else if (indexPath.row == 4) {
        return 120;
    }else if (indexPath.row == 7){
        return 180;
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
    
    if (indexPath.row == 3) {
        cell.contentView.backgroundColor = RGBACOLOR(76, 97, 157, 1);
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    if (indexPath.row == 5) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(60, 0, 250, 40);
        btn.backgroundColor = [UIColor greenColor];
        [btn addTarget:self action:@selector(pullDownBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
    }
    return cell;
}
-(void)pullDownBtnClick:(UIButton *)sender{
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"1分", @"2分", @"3分", @"4分", @"5分",nil];
    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[ComboBoxView alloc] showDropDown:sender :&f :arr :sender.tag :nil];
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

-(void)rel{
    dropDown = nil;
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
