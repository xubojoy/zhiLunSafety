//
//  ViewController.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-10.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "LeftViewController.h"
#import "SafetyCheckController.h"
#import "BasicManageController.h"
#import "LocaleController.h"
#import "Macro.h"
#import "SafetyCheckCell.h"
@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = RGBACOLOR(23, 48, 106, 1);
    self.projectArray = [[NSMutableArray alloc] initWithObjects:@"工程项目A",@"工程项目B",@"工程项目C", nil];
    [self initUserInfo];
    [self initTable];
}

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
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];


}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 238, 40)];
    view.backgroundColor = [UIColor purpleColor];
    
    
    NSLog(@">>>>>>view.frame>>>>>%@",NSStringFromCGRect(view.frame));
    
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    [titleBtn setTitle:[self.projectArray objectAtIndex:section] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"push_btn_bg"] forState:UIControlStateNormal];
    // 设置btn中的imageview不拉伸
    titleBtn.imageView.contentMode = UIViewContentModeCenter;
    
    // 设置btn中的imageview超出部分不剪切
    titleBtn.imageView.clipsToBounds = NO;
    titleBtn.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    titleBtn.tag = section;
    titleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 130);
    titleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 200, 0, 10);
    [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:titleBtn];
    
    return view;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    SafetyCheckCell *cell = [[SafetyCheckCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.label.text = [self.introArr objectAtIndex:indexPath.row];
    
    return cell;
}


void user(){



}

#pragma  mark - 可开合的view
-(void)titleBtnClick:(UIButton *)sender{
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"1分", @"2分", @"3分", @"4分", @"5分",nil];
    if(dropDown == nil) {
        CGFloat f = 200;
        dropDown = [[NIDropDown alloc] showDropDown:sender :&f :arr :sender.tag];
        dropDown.delegate = self;
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
    
    if([self.nameText.text isEqualToString:@""]){
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请输入用户名" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
        return;
    }else if(![self.nameText.text isEqualToString:@""] && [self.nameText.text containsString:@"经理"]){
        SafetyCheckController *vc = [[SafetyCheckController alloc] initWithTitle:@"安全生产条件核查表"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(![self.nameText.text isEqualToString:@""] && [self.nameText.text containsString:@"基础"]){
        BasicManageController *vc = [[BasicManageController alloc] initWithTitle:@"基础管理考核评价表"];
        [self.navigationController pushViewController:vc animated:YES];
    }else if(![self.nameText.text isEqualToString:@""] && [self.nameText.text containsString:@"现场"]){
        LocaleController *vc = [[LocaleController alloc] initWithTitle:@"施工现场考核评价表"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
