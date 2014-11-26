//
//  ComboBoxView.m
//  comboBox
//
//  Created by duansong on 10-7-28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PullDownView.h"
#import "QuartzCore/QuartzCore.h"
#import "Macro.h"

@interface PullDownView ()
@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) UIButton *btnSender;
@property(nonatomic, retain) NSArray *list;
@end

@implementation PullDownView
@synthesize table;
@synthesize btnSender;
@synthesize delegate;

- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSInteger)tag:(NSMutableDictionary *)dict{
    btnSender = b;
    self = [super init];
    if (self) {
        CGRect btn;
        if (IOS_7_8) {
            btn = btnSender.superview.superview.superview.frame;
        }else if ([[UIDevice currentDevice] systemVersion].floatValue > 8){
            btn = btnSender.superview.superview.frame;
        }
        self.backgroundColor = [UIColor redColor];
        self.frame = CGRectMake(60, btn.origin.y+btn.size.height, 240, 0);
        self.list = [NSArray arrayWithArray:arr];
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.backgroundColor = [UIColor clearColor];
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(60, btn.origin.y+btn.size.height, 240, *height);
            table.frame = CGRectMake(0, 0, self.frame.size.width, *height);
        }];
        if (IOS_7_8) {
            NSLog(@">>>>>>>>>>来这儿了");
            [btnSender.superview.superview.superview.superview.superview addSubview:self];
            [btnSender.superview.superview.superview.superview.superview bringSubviewToFront:self];
            
        }else if ([[UIDevice currentDevice] systemVersion].floatValue > 8){
            NSLog(@">>>>>>>>>>来没");
            [btnSender.superview.superview.superview.superview addSubview:self];
            [btnSender.superview.superview.superview.superview bringSubviewToFront:self];
        }
        [self addSubview:table];
    }
    return self;
}

-(void)hideDropDown:(UIButton *)b {
    
    CGRect btn;
    if (IOS_7_8) {
        btn = btnSender.superview.superview.superview.frame;
    }else{
        btn = b.superview.superview.frame;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(60, btn.origin.y+btn.size.height, 240, 0);
        table.frame = CGRectMake(0, 0, self.frame.size.width, 0);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    cell.textLabel.text =[self.list objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.textColor = [UIColor blackColor];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, self.frame.size.width, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:view];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hideDropDown:btnSender];
    [btnSender setTitle:[self.list objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [self myDelegate];
}

- (void) myDelegate {
    if ([self.delegate respondsToSelector:@selector(PullDownViewDelegateMethod:)]) {
        [self.delegate PullDownViewDelegateMethod:self];
    }
    
}
@end
