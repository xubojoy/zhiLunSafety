//
//  HeaderView.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-18.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "HeaderView.h"
#import "Macro.h"
#import "SliderViewController.h"

@implementation HeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBACOLOR(43, 61, 126, 1);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10, 20, 44, 44);
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"开合" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(showLeft:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 44)];
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        self.titleLab.textColor = [UIColor whiteColor];
        [self addSubview:self.titleLab];
    }

    return self;
}

-(void)showLeft:(UIButton *)sender{
//    [[SliderViewController sharedSliderController] showLeftViewController];
    [[SliderViewController sharedSliderController].navigationController popToRootViewControllerAnimated:YES];
}

@end
