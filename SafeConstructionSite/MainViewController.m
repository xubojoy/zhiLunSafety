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
#import "ScoreAndRankCell.h"
#import "CityCell.h"


@interface MainViewController ()

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initHeaderView];
    [self initTableView];
//    [self initMaskView];
    self.titleArray = [[NSMutableArray alloc] initWithObjects:@"建设单位—-\"平安工地\"考核评价表",@"项   目   名   称 : 八达岭",@"设   计   单   位 : 北京设计院",@"建   设   里   程 : A551",@"工   程   概   算 : 5亿",@"桥   隧   比   例 : 5 ：2",@"批准工期(年月): 2014.5.1",@"实际开工日期(年月): 2015.2.1",@"计划交工日期(年月): 2015.10.1", nil];

     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"走这儿啦" object:nil];
    
    [self performSelector:@selector(showLeftVC) withObject:self afterDelay:0.01];
}
-(void)notification:(NSNotification *)notification{
    NSString *titleStr = notification.object;
    self.titleLab.text = titleStr;
}

-(void)showLeftVC{
    [[SliderViewController sharedSliderController] showLeftViewController];
}

-(void)initHeaderView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 64)];
    view.backgroundColor = RGBACOLOR(43, 61, 126, 1);
    [self.view addSubview:view];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 20, 44, 44);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    [btn setImage:[UIImage imageNamed:@"nav_menu_icon"] forState:UIControlStateNormal];
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

//-(void) initMaskView
//{
//    self.maskView.frame = self.view.frame;
//    self.maskView.backgroundColor = RGBACOLOR(232, 233, 232, 0.4);
////    [self initPickerView];
//}

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
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 3 || indexPath.row == 4) {
            return 100;
        }else if (indexPath.row == 7){
            return 150;
        }else if (indexPath.row == 9){
            return 150;
        }
    }
    return 40;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WEIGHT, 20)];
    view.backgroundColor = RGBACOLOR(76, 97, 157, 1);
    
    
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
        self.choseTime = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, VIEW_WEIGHT, 44)];
        self.choseTime.userInteractionEnabled = YES;
        self.choseTime.text = [self.titleArray objectAtIndex:indexPath.row];
        self.choseTime.textAlignment = NSTextAlignmentLeft;
        self.choseTime.font = [UIFont systemFontOfSize:12];
        if (indexPath.row == 0) {
            self.choseTime.font = [UIFont systemFontOfSize:14];
        }
        [cell.contentView addSubview:self.choseTime];
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
            static NSString *identifier  = @"cell";
            PullDownCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[PullDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }else if (indexPath.section == 2){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"监 理 合 同 段 :";
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.font = [UIFont systemFontOfSize:12];
            return cell;
        }
       else if (indexPath.row == 1) {
            cell.textLabel.text = @"监 理 单 位 名 称 :";
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
           cell.textLabel.font = [UIFont systemFontOfSize:12];
            return cell;
        }
       else if (indexPath.row == 2) {
           static NSString *identifier  = @"cell";
           PullDownCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
           if (!cell) {
               cell = [[PullDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
           }
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
           return cell;
       }else if (indexPath.row == 3){
           static NSString *cellIden = @"cellIden";
           ScoreAndRankCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
           if (!cell) {
               cell = [[ScoreAndRankCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIden];
           }
           return cell;
       }else if (indexPath.row == 4){
           static NSString *cellIden = @"cellIden";
           ScoreAndRankCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
           if (!cell) {
               cell = [[ScoreAndRankCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIden];
           }
           cell.nameLab.text = @"工程项目综合得分:";
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
           
            return cell;
           
       }else if (indexPath.row == 5){
           cell.textLabel.text = @"注：水运工程项目不必提携桥隧比例和建设里程";
           cell.textLabel.font = [UIFont systemFontOfSize:12];
           return cell;
           
       }else if (indexPath.row == 6){

           static NSString *cityCell = @"cityCell";
           CityCell *cell = [tableView dequeueReusableCellWithIdentifier:cityCell];
           if (!cell) {
               cell = [[CityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cityCell];
           }
           return cell;
       }else if (indexPath.row == 7){
           UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 70, 30)];
           label1.font = [UIFont systemFontOfSize:12];
           label1.numberOfLines = 0;
           label1.textAlignment = NSTextAlignmentRight;
           label1.text = @"评价(填表)\n  单位(盖章):";
           [cell.contentView addSubview:label1];
           
           UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
           btn2.frame = CGRectMake(100, 20, 80, 80);
           [btn2 setImage:[UIImage imageNamed:@"yin_zhang.jpg"] forState:UIControlStateNormal];
           [cell.contentView addSubview:btn2];
           
           UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 300, 30)];
           label3.font = [UIFont systemFontOfSize:12];
           label3.numberOfLines = 0;
           label3.textAlignment = NSTextAlignmentLeft;
           label3.text = @"  填表人: 张先生";
           [cell.contentView addSubview:label3];

           return cell;
       }else if (indexPath.row == 8){
           cell.textLabel.text = @"填表日期：2014.5.1";
           cell.textLabel.font = [UIFont systemFontOfSize:12];
           return cell;
       }else if (indexPath.row == 9){
           UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
           confirmBtn.backgroundColor = RGBACOLOR(53, 80, 137, 1);
           [confirmBtn setTitle:@"确认提交" forState:UIControlStateNormal];
           confirmBtn.titleLabel.font = [UIFont systemFontOfSize:12];
           confirmBtn.frame = CGRectMake(60, 50, 200, 50);
           [confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
           [cell.contentView addSubview:confirmBtn];

           return cell;
       }
    }
    return nil;
}
#pragma mark - button方法
-(void)confirmBtnClick{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"提交成功！" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

//-(void)presentChooseTimeModalView:(UITapGestureRecognizer *)sender{
//    [self.view addSubview:self.maskView];
//    CGRect frame = self.chooseTimeModalView.frame;
//    frame.origin.y = self.view.frame.size.height;
//    self.chooseTimeModalView.frame = frame;
//    [self.view addSubview:self.chooseTimeModalView];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect frame = self.chooseTimeModalView.frame;
//        frame.origin.y = self.view.frame.size.height - frame.size.height;
//        self.chooseTimeModalView.frame = frame;
//    }];
//}
- (IBAction)cancelChooseTime:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.chooseTimeModalView.frame;
        frame.origin.y = self.view.frame.size.height;
        self.chooseTimeModalView.frame = frame;
    } completion:^(BOOL finished) {
        [self.chooseTimeModalView removeFromSuperview];
        [self.maskView removeFromSuperview];
    }];
}

- (IBAction)confirmChooseTime:(id)sender {
    
    
    self.choseTime.text = [NSString stringWithFormat:@"%@ %@",[self.titleArray objectAtIndex:self.index],self.dateStr];
    [self cancelChooseTime:sender];
}

//TODO:自定义pickerView

//-(void)initPickerView{
//    self.scheduleTimePicker.datePickerMode = UIDatePickerModeDate;//设置时间选择器格式
//    self.scheduleTimePicker.timeZone = [NSTimeZone timeZoneWithName:@"GMT"];//设置时间选择器时区
//    self.scheduleTimePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];//以中国描述方式显示
//    [self.scheduleTimePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];//有选择操作时，响应dateChanged:函数
//}
//
////显示用火日期
//-(void)dateChanged:(id)sender {
//    UIDatePicker *dp = (UIDatePicker*)sender;
//    NSDate *selected = [dp date];
//    NSDateFormatter *df = [[NSDateFormatter alloc] init];
//    [df setDateFormat:@"yyyy年MM月dd日"];//此处可以根据需要，更改时间格式，获得更详细的时间
//    self.dateStr = [df stringFromDate:selected];
//    NSLog(@">>>>>>>self.dateStr>>>>>ß>>%@",self.dateStr);
//}

//# pragma mark- ----PickerView datasource-----
//-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//    
//    return 2;
//}
//
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
//        if (component == 0) {
//            return 12;
//        }
//        
//        return 24;
//    
//}
//
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
//           //日期选择器部分
//        if(component == 1){
//            NSDate *date = [NSDate date];
//            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"M月d日"];
//            NSLog(@">>>>>>>[dateFormatter stringFromDate:date]>>>>>>%@",[dateFormatter stringFromDate:date]);
//            
//            return [dateFormatter stringFromDate:date];
//        }
//        else{
//        
//            NSDate *date = [NSDate date];
//            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//            [dateFormatter setDateFormat:@"yyyy年"];
//            
//            return [dateFormatter stringFromDate:date];
//        }
//}
//
//-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
//{
//    return 33;
//}
//
//-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
////    if (pickerView == self.scheduleTimePicker && component == 0) {
////        NSDate *date = [NSDate date];
//////        self.hoursCanOrder = [self.stylist hoursCanDate:date];
//////        self.hoursCanOrder = [self filteHoursCanOrder:self.hoursCanOrder dayDate:date];
////        [pickerView selectRow:0 inComponent:1 animated:YES];
////        [pickerView reloadComponent:1];
////    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
