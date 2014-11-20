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
            PullDownCell *cell = [[PullDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }else if (indexPath.section == 2){
        UITableViewCell *cell = [[UITableViewCell alloc] init];
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
           PullDownCell *cell = [[PullDownCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
           cell.selectionStyle = UITableViewCellSelectionStyleNone;
           return cell;
       }else if (indexPath.row == 3){
           UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
           label1.font = [UIFont systemFontOfSize:12];
           label1.textAlignment = NSTextAlignmentRight;
           label1.text = @"工程项目得分:";
           [cell.contentView addSubview:label1];
           
           UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
           btn.frame = CGRectMake(100, 10, 210, 30);
           [btn addTarget:self action:@selector(scoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
           [btn setTitle:@"1分" forState:UIControlStateNormal];
           [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           btn.titleLabel.font = [UIFont systemFontOfSize:13];
           btn.tag = 1000;
           CALayer *layer = btn.layer;
           [layer setBorderWidth:1.0f];
           [layer setBorderColor:[UIColor grayColor].CGColor];
        
           [cell.contentView addSubview:btn];
           
           UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 80, 30)];
           label2.font = [UIFont systemFontOfSize:12];
           label2.textAlignment = NSTextAlignmentRight;
           label2.text = @"达标等级:";
           [cell.contentView addSubview:label2];
           
           UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
           btn2.frame = CGRectMake(100, 50, 210, 30);
           [btn2 addTarget:self action:@selector(rankBtnClick:) forControlEvents:UIControlEventTouchUpInside];
           [btn2 setTitle:@"A" forState:UIControlStateNormal];
           btn2.titleLabel.font = [UIFont systemFontOfSize:13];
           btn2.tag = 1001;
           [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           layer = btn2.layer;
           [layer setBorderWidth:1.0f];
           [layer setBorderColor:[UIColor grayColor].CGColor];
           [cell.contentView addSubview:btn2];
           
           return cell;
       }else if (indexPath.row == 4){
           UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 80, 30)];
           label1.font = [UIFont systemFontOfSize:12];
           label1.textAlignment = NSTextAlignmentRight;
           label1.text = @"工程项目综合得分:";
           [cell.contentView addSubview:label1];
           
           UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
           btn3.frame = CGRectMake(100, 10, 210, 30);
           [btn3 addTarget:self action:@selector(scoreBtnClick:) forControlEvents:UIControlEventTouchUpInside];
           [btn3 setTitle:@"1分" forState:UIControlStateNormal];
           btn3.titleLabel.font = [UIFont systemFontOfSize:13];
           btn3.tag = 1002;
           [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           CALayer *layer = btn3.layer;
           [layer setBorderWidth:1.0f];
           [layer setBorderColor:[UIColor grayColor].CGColor];
           [cell.contentView addSubview:btn3];
           
           UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 80, 30)];
           label2.font = [UIFont systemFontOfSize:12];
           label2.textAlignment = NSTextAlignmentRight;
           label2.text = @"达标等级:";
           [cell.contentView addSubview:label2];
           
           UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
           btn4.frame = CGRectMake(100, 50, 210, 30);
           [btn4 addTarget:self action:@selector(rankBtnClick:) forControlEvents:UIControlEventTouchUpInside];
           [btn4 setTitle:@"A" forState:UIControlStateNormal];
           btn4.titleLabel.font = [UIFont systemFontOfSize:13];
           btn4.tag = 1003;
           [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           layer = btn4.layer;
           [layer setBorderWidth:1.0f];
           [layer setBorderColor:[UIColor grayColor].CGColor];
           [cell.contentView addSubview:btn4];
           return cell;
           
       }else if (indexPath.row == 5){
           cell.textLabel.text = @"注：水运工程项目不必提携桥隧比例和建设里程";
           cell.textLabel.font = [UIFont systemFontOfSize:12];
           return cell;
           
       }else if (indexPath.row == 6){
           cell.textLabel.text = @"省份：";
           cell.textLabel.font = [UIFont systemFontOfSize:12];
           
           UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
           btn.frame = CGRectMake(60, 0, 250, 40);
           [btn addTarget:self action:@selector(pullDownBtnClick:) forControlEvents:UIControlEventTouchUpInside];
           [btn setTitle:@"北京市" forState:UIControlStateNormal];
           btn.titleLabel.font = [UIFont systemFontOfSize:13];
           [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
           CALayer *layer = btn.layer;
           [layer setBorderWidth:1.0f];
           [layer setBorderColor:[UIColor grayColor].CGColor];
           [cell.contentView addSubview:btn];
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
           [btn2 setImage:[UIImage imageNamed:@"yinzhang"] forState:UIControlStateNormal];
           [cell.contentView addSubview:btn2];
           
           UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 300, 30)];
           label3.font = [UIFont systemFontOfSize:12];
           label3.numberOfLines = 0;
           label3.textAlignment = NSTextAlignmentLeft;
           label3.text = @"填表人: 张先生";
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

-(void)pullDownBtnClick:(UIButton *)sender{
      NSLog(@">>>>>>>>点一点>>>>>>>>");
    NSArray * arr = [[NSArray alloc] init];
    arr = [NSArray arrayWithObjects:@"北京市", @"上海市", @"广东省", @"深圳市", @"河南省",@"河北省",nil];
    if(self.pullDown == nil) {
        CGFloat f = 200;
        self.pullDown = [[ComboBoxView alloc] showDropDown:sender :&f :arr :sender.tag :nil];
    }
    else {
        [self.pullDown hideDropDown:sender];
        [self real];
    }
}

-(void)real{
    self.pullDown = nil;
}

-(void)scoreBtnClick:(UIButton *)sender{
    NSArray * arr = [[NSArray alloc] init];
    
    if (sender.tag == 1000 || sender.tag == 1002) {
         arr = [NSArray arrayWithObjects:@"1分", @"2分", @"3分", @"4分", @"5分",@"6分",nil];
    }
    if(self.pullDownView == nil) {
        CGFloat f = 200;
        self.pullDownView = [[PullDownView alloc] showDropDown:sender :&f :arr :sender.tag:nil];
    }
    else {
        [self.pullDownView hideDropDown:sender];
        [self release1];
    }
}

-(void)release1{
    self.pullDownView = nil;
}

-(void)rankBtnClick:(UIButton *)sender{
    NSArray * arr = [[NSArray alloc] init];
    if (sender.tag == 1001 || sender.tag == 1003){
        arr = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D",nil];
    }
    if(self.pullDownView == nil) {
    CGFloat f = 150;
    self.pullDownView = [[PullDownView alloc] showDropDown:sender :&f :arr :sender.tag:nil];
    }
    else {
        [self.pullDownView hideDropDown:sender];
        [self rel];
    }
}

-(void)rel{
    self.pullDownView = nil;
}

//-(void)keyboard:(UITapGestureRecognizer *)sender{
////    NSLog(@">>>>>>>>>>>>>>>>>>>>>>点击了！！！！！！！！！！:%ld",sender.view.tag);
////    NSLog(@">>>>>>>>>>>>>>>>>>>>>>点击了！！！！！！！！！！:%ld",sender.view.tag);
//}

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
