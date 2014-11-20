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
#import "CityCell.h"
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
    if (indexPath.row == 5) {
        static NSString *cityCell = @"cityCell";
        CityCell *cell = [tableView dequeueReusableCellWithIdentifier:cityCell];
        if (!cell) {
            cell = [[CityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cityCell];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSRange range = [self.departmentStr rangeOfString:@"建设单位"];
        
        if (range.location != NSNotFound) {
            cell.commonBtn.enabled = NO;
        }else{
            cell.commonBtn.enabled = YES;
        }
        cell.commonBtn.tag = 900;
        [cell.commonBtn setTitle:@"80分" forState:UIControlStateNormal];
        cell.nameLab.text = @"得  分：";
        return cell;

    }else{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
        return cell;
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
