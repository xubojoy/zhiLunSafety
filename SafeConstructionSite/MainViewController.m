//
//  MainViewController.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-14.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "MainViewController.h"
#import "SliderViewController.h"
#import "Macro.h"
@interface MainViewController ()

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@">>>>>>>self project title :%@",self.projectTitle);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"走这儿啦" object:nil];
}

-(void)notification:(NSNotification *)notification{
    
    NSLog(@">>>>>>>>>%@",notification.object);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeaderView];
}
-(void)initHeaderView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    view.backgroundColor = RGBACOLOR(23, 48, 106, 1);
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 20, 44, 44);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"开合" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showLeft:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 300, 44)];
    titleLab.backgroundColor = [UIColor cyanColor];
    titleLab.text = self.projectTitle;
    [view addSubview:titleLab];
    
}

-(void)showLeft:(UIButton *)sender{
    [[SliderViewController sharedSliderController] showLeftViewController];
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
