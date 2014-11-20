//
//  LoginViewController.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-20.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "LoginViewController.h"
#import "SliderViewController.h"
#import "LeftViewController.h"
#import "MainViewController.h"
#import "UIViewController+MLTransition.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)loginBtnClick:(id)sender {
    NSLog(@">>>>>>>>>>>>>>>>>登录成功！");
    if (![self.userNameField.text isEqualToString:@""] && ![self.pwdField.text isEqualToString:@""]) {
        LeftViewController *leftVC = [[LeftViewController alloc] init];
        [SliderViewController sharedSliderController].LeftVC = leftVC;
        [SliderViewController sharedSliderController].MainVC = [[MainViewController alloc] init];
        [SliderViewController sharedSliderController].LeftSContentOffset=270;
        [SliderViewController sharedSliderController].LeftContentViewSContentOffset = 10;
        [SliderViewController sharedSliderController].LeftSContentScale=1;
        [SliderViewController sharedSliderController].LeftSJudgeOffset=160;
        [SliderViewController sharedSliderController].changeLeftView = ^(CGFloat sca, CGFloat transX)
        {
            //        CGAffineTransform ltransS = CGAffineTransformMakeScale(sca, sca);
            //        CGAffineTransform ltransT = CGAffineTransformMakeTranslation(transX, 0);
            //        CGAffineTransform lconT = CGAffineTransformConcat(ltransT, ltransS);
            //        leftVC.contentView.transform = lconT;
        };
        [self.navigationController pushViewController:[SliderViewController sharedSliderController] animated:YES];
    }
    else if([self.userNameField.text isEqualToString:@""] || [self.pwdField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入用户名和密码" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        
        [alert show];
//        return;
    }
   
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];

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
