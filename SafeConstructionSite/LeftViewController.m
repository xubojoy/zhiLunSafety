//
//  ViewController.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "LeftViewController.h"
#import "Macro.h"
#import "SafetyCheckCell.h"
#import "SliderViewController.h"
#import "MainViewController.h"
#import "SafetyCheckViewController.h"
#import "BasicViewController.h"
@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = RGBACOLOR(43, 61, 126, 1);

    [self initData];
    [self initUserInfo];
    [self initTable];
}

-(void)initData{
    self.projectArray = [[NSMutableArray alloc] initWithObjects:@"工程项目A",@"工程项目B",@"工程项目C", nil];
    
    self.nameArray = [[NSArray alloc] init];
    self.nameArray = [NSArray arrayWithObjects:@"开工前安全生产条件核查表", @"项目工程考核评价", @"合同段A", @"合同段B", @"合同段C",nil];
    //    self.smallArray = [[NSMutableArray alloc] initWithObjects:@"建设单位—-平安工地考核评价表",@"建设单位—-建设单位考核评价表",@"建设单位—-开工前安全生产条件核查表",@"监理单位—-考核评价表",@"施工单位—-基础管理考核评价表",@"施工单位—-施工现场考核评价表",@"施工单位—-安全检查表", nil];
    
    
    NSMutableDictionary *nameAndStateDic1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"建设单位—-\"平安工地\"考核评价表",@"title",nil];
    NSMutableDictionary *nameAndStateDic2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"建设单位—-建设单位考核评价表",@"title",nil];
    NSMutableDictionary *nameAndStateDic3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"建设单位—-开工前安全生产条件核\n                  查表",@"title",nil];
    NSMutableDictionary *nameAndStateDic4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"监理单位—-考核评价表",@"title",nil];
    NSMutableDictionary *nameAndStateDic5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"施工单位—-基础管理考核评价表",@"title",nil];
    NSMutableDictionary *nameAndStateDic6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"施工单位—-施工现场考核评价表",@"title",nil];
    NSMutableDictionary *nameAndStateDic7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"施工单位—-安全检查表",@"title",nil];
    
    self.grouparr0 = [[NSMutableArray alloc] initWithObjects:nameAndStateDic1,nameAndStateDic2,nameAndStateDic3,nameAndStateDic4,nameAndStateDic5,nameAndStateDic6,nameAndStateDic7, nil];
    self.dic = [NSMutableDictionary new];
    
    [self.dic setValue:self.grouparr0 forKey:@"0"];

}

//-(void)loadData{
//    NSURL *url = [[NSBundle mainBundle] URLForResource:@"Check.plist" withExtension:nil];
////    NSArray *tempArray = [NSArray arrayWithContentsOfURL:url];
//    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfURL:url];
//    NSLog(@">>>>>>>>>>>>>%@",dic);
//}



-(void)initUserInfo{
    self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 60, 60)];
    self.userImageView.backgroundColor = [UIColor purpleColor];
    
    CALayer *layer = self.userImageView.layer;
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:self.userImageView.frame.size.width/2];
    [layer setBorderWidth:2.0f];
    [layer setBorderColor:[UIColor whiteColor].CGColor];
    [self.view addSubview:self.userImageView];
    
    self.departmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 40, 150, 30 )];
    self.departmentLabel.text = @"建设单位";
    self.departmentLabel.textColor = [UIColor whiteColor];
    self.departmentLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:self.departmentLabel];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 70, 150, 30 )];
    self.nameLabel.text = @"用户名：张先生";
    self.nameLabel.textColor = [UIColor whiteColor];
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:self.nameLabel];
}

-(void)initTable{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(20, 120, 238, self.view.frame.size.height-150) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = RGBACOLOR(51, 75, 153, 1);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.tableView];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.grouparr0.count;
    }else if (section == 1){
        return 1;
        
    }else{
        return 0;
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 238, 40)];
    view.backgroundColor = RGBACOLOR(51, 75, 153, 1);
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame = CGRectMake(0, 0, view.frame.size.width-50, view.frame.size.height);
    [titleBtn setTitle:[self.projectArray objectAtIndex:section] forState:UIControlStateNormal];
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 90);
    [view addSubview:titleBtn];

    UIButton *pullBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pullBtn.frame = CGRectMake(view.frame.size.width-50, 0, 50, view.frame.size.height);
    [pullBtn setImage:[UIImage imageNamed:@"push_btn_bg"] forState:UIControlStateNormal];
    // 设置btn中的imageview不拉伸
    pullBtn.imageView.contentMode = UIViewContentModeCenter;
    // 设置btn中的imageview超出部分不剪切
    pullBtn.imageView.clipsToBounds = NO;
    pullBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    pullBtn.tag = section;
//    pullBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 130);
//    pullBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 200, 0, 10);
    [pullBtn addTarget:self action:@selector(pullBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:pullBtn];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *indexStr = [NSString stringWithFormat:@"%ld",indexPath.section];
//    static NSString *identifier = @"Cell";
    SafetyCheckCell *cell = [[SafetyCheckCell alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.section == 0) {
        cell.label.text = self.dic[indexStr][indexPath.row][@"title"];
        cell.label.textColor = [UIColor whiteColor];
        cell.label.font = [UIFont systemFontOfSize:12];
        NSRange range = [cell.label.text rangeOfString:@"建设单位"];
        
        if ([self.departmentLabel.text isEqualToString:@"建设单位"] && range.location != NSNotFound) {
            cell.editBtn.hidden = NO;
        }else{
            cell.editBtn.hidden = YES;
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 4) {
        BasicViewController *bvc = [[BasicViewController alloc] init];
        bvc.titleStr = [self.projectArray objectAtIndex:indexPath.section];
        [self.navigationController pushViewController:bvc animated:YES];
    }
   else if (indexPath.row == 6) {
        SafetyCheckViewController *scvc = [[SafetyCheckViewController alloc] init];
       scvc.titleStr = [self.projectArray objectAtIndex:indexPath.section];
        [self.navigationController pushViewController:scvc animated:YES];

    }else{
        [[SliderViewController sharedSliderController] closeSideBarWithAnimate:YES complete:^(BOOL finished) {
             [[NSNotificationCenter defaultCenter] postNotificationName:@"走这儿啦" object:[self.projectArray objectAtIndex:indexPath.section]];
        }];
    }
   
}

#pragma  mark - 可开合的view
-(void)pullBtnClick:(UIButton *)sender{
    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc] showDropDown:sender :&f :self.nameArray :sender.tag];
        dropDown.titleCount = self.grouparr0.count;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}

-(void)rel{
    dropDown = nil;
}

-(void)btnClick{
//    
//    if([self.nameText.text isEqualToString:@""]){
//    
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请输入用户名" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
//        [alert show];
//        return;
//    }else if(![self.nameText.text isEqualToString:@""] && [self.nameText.text containsString:@"经理"]){
//        SafetyCheckController *vc = [[SafetyCheckController alloc] initWithTitle:@"安全生产条件核查表"];
//        [self.navigationController pushViewController:vc animated:YES];
//    }else if(![self.nameText.text isEqualToString:@""] && [self.nameText.text containsString:@"基础"]){
//        BasicManageController *vc = [[BasicManageController alloc] initWithTitle:@"基础管理考核评价表"];
//        [self.navigationController pushViewController:vc animated:YES];
//    }else if(![self.nameText.text isEqualToString:@""] && [self.nameText.text containsString:@"现场"]){
//        LocaleController *vc = [[LocaleController alloc] initWithTitle:@"施工现场考核评价表"];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
