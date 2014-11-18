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
#import "PullDownCell.h"
@interface MainViewController ()

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}

-(void)notification:(NSNotification *)notification{
//    NSLog(@">>>>notification.object>>>>>%@",notification.object);
    NSString *titleStr = notification.object;
    self.titleLab.text = titleStr;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeaderView];
    [self initTableView];
    [self initMaskView];
//    [self initScheduleTimeView];
    
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"建设单位—-\"平安工地\"考核评价表",@"项   目   名   称 :",@"设   计   单   位 :",@"建   设   里   程 :",@"工   程   概   算 :",@"桥   隧   比   例 :",@"批准工期(年月):",@"实际开工日期(年月):",@"计划交工日期(年月):", nil];

     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"走这儿啦" object:nil];
}

-(void) initMaskView
{
    self.maskView.frame = self.view.frame;
    self.maskView.backgroundColor = RGBACOLOR(232, 233, 232, 0.4);
}

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
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WEIGHT, 20)];
    view.backgroundColor = RGBACOLOR(52, 80, 138, 1);
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, VIEW_WEIGHT, 20)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    if (section == 1) {
        label.text = @"建设单位";
    }else if (section == 2){
        label.text = @"监理单位";
    }
    
    
    [view addSubview:label];
    return view;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        if (indexPath.row == 0) {
            cell.textLabel.font = [UIFont systemFontOfSize:14];
        }
        cell.textLabel.text = [self.titleArray objectAtIndex:indexPath.row];
        if (indexPath.row == 6 || indexPath.row == 7 || indexPath.row ==8) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentChooseTimeModalView:)];
            [cell.contentView addGestureRecognizer:tap];
        }
        return cell;
    }
   
    else if (indexPath.section == 1) {
        
        if (indexPath.row == 0) {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"建  设  单  位  名  称 :";
            cell.textLabel.font = [UIFont systemFontOfSize:12];
            return cell;
        }else if (indexPath.row == 1){
            PullDownCell *cell = [[PullDownCell alloc] init];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            cell.textLabel.text = @"监 理 合 同 段 :";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.font = [UIFont systemFontOfSize:12];
            return cell;
        }
       else if (indexPath.row == 1) {
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            cell.textLabel.text = @"监 理 单 位 名 称 :";
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
           cell.textLabel.font = [UIFont systemFontOfSize:12];
            return cell;
        }
       else if (indexPath.row == 2) {
           PullDownCell *cell = [[PullDownCell alloc] init];
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
           return cell;
       }
    }
    return nil;
}

-(void)presentChooseTimeModalView:(id)sender{
    [self.view addSubview:self.maskView];
//    [self.inputRemark resignFirstResponder];
    CGRect frame = self.chooseTimeModalView.frame;
    frame.origin.y = self.view.frame.size.height;
    self.chooseTimeModalView.frame = frame;
    [self.view addSubview:self.chooseTimeModalView];
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.chooseTimeModalView.frame;
        frame.origin.y = self.view.frame.size.height - frame.size.height;
        self.chooseTimeModalView.frame = frame;
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.chooseTimeModalView.frame;
        frame.origin.y = self.view.frame.size.height;
        self.chooseTimeModalView.frame = frame;
    } completion:^(BOOL finished) {
        [self.chooseTimeModalView removeFromSuperview];
        [self.maskView removeFromSuperview];
    }];
}

#pragma mark ----------ScheduleTimePicker -----
-(void)initChooseScheduleTimePicker
{
    self.scheduleTimePicker.dataSource = self;
    self.scheduleTimePicker.delegate = self;
    
    self.scheduleTimePicker.showsSelectionIndicator = YES;
    self.scheduleTimePicker.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
}

# pragma mark- ----PickerView datasource-----
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
        if (component == 0) {
            return 12;
        }
        
        return 24;
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
           //日期选择器部分
        if(component == 1){
            NSDate *date = [NSDate date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"M月d日"];
            NSLog(@">>>>>>>[dateFormatter stringFromDate:date]>>>>>>%@",[dateFormatter stringFromDate:date]);
            
            return [dateFormatter stringFromDate:date];
        }
        else{
        
            NSDate *date = [NSDate date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"yyyy年"];
            
            return [dateFormatter stringFromDate:date];
        }
//        //小时选择器部分
//        float hour = [self.hoursCanOrder[row] floatValue];
//        NSString *hourTxt;
//        NSMutableString *hourString = [NSMutableString stringWithFormat:@"%.1f", hour>=13?(hour-12):hour];
//        [hourString replaceOccurrencesOfString:@".0" withString:@"点" options:NSCaseInsensitiveSearch range:NSMakeRange(0, hourString.length)];
//        [hourString replaceOccurrencesOfString:@".5" withString:@"点半" options:NSCaseInsensitiveSearch range:NSMakeRange(0, hourString.length)];
//        if (hour <= 12.5) {
//            hourTxt = [NSString stringWithFormat:@"上午%@", hourString];
//        }else{
//            hourTxt = [NSString stringWithFormat:@"下午%@", hourString];
//        }
//        return hourTxt;
//    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 33;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (pickerView == self.scheduleTimePicker && component == 0) {
        NSDate *date = [NSDate date];
//        self.hoursCanOrder = [self.stylist hoursCanDate:date];
//        self.hoursCanOrder = [self filteHoursCanOrder:self.hoursCanOrder dayDate:date];
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadComponent:1];
    }
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
    
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(60, 20, 200, 44)];
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.textColor = [UIColor whiteColor];
    [view addSubview:self.titleLab];
    
}

-(void)showLeft:(UIButton *)sender{
    [[SliderViewController sharedSliderController] showLeftViewController];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
