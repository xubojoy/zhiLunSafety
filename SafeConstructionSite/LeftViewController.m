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
@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 150, 30 )];
    self.nameLabel.text = @"用户名：";
    [self.view addSubview:self.nameLabel];
    
    self.nameText = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 150, 30)];
    self.nameText.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.nameText];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.loginBtn.frame = CGRectMake(100, 260, 100, 50);
    self.loginBtn.backgroundColor = [UIColor redColor];
    [self.loginBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:self.loginBtn];
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
