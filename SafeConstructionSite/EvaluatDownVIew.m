//
//  ComboBoxView.m
//  comboBox
//
//  Created by duansong on 10-7-28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "EvaluatDownVIew.h"
#import "QuartzCore/QuartzCore.h"
#import "Macro.h"

@interface EvaluatDownVIew ()
@property(nonatomic, strong) UITableView *table;
@property(nonatomic, strong) UIButton *btnSender;
@property(nonatomic, retain) NSArray *list;
@end

@implementation EvaluatDownVIew
@synthesize table;
@synthesize btnSender;
@synthesize list;
@synthesize delegate;

- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSInteger)tag:(NSMutableDictionary *)dict{
    btnSender = b;
    self = [super init];
    if (self) {
        
        CGRect btn = btnSender.superview.superview.superview.frame;
        self.backgroundColor = [UIColor redColor];
        NSLog(@">>>>>>>>>>btnSender.frame>>>>>>>%@",NSStringFromCGRect(btnSender.frame));
        NSLog(@">>>>>>>>>>btnSender.superview.frame>>>>>>>%@",NSStringFromCGRect(btnSender.superview.frame));
        NSLog(@">>>>>>>>>>>>>btnSender.superview.superview.frame>>>>%@",NSStringFromCGRect(btnSender.superview.superview.frame));
        NSLog(@">>>>>>>>>>>btnSender.superview.superview.superview.frame>>>>>>%@",NSStringFromCGRect(btnSender.superview.superview.superview.frame));
        
        self.frame = CGRectMake(30+(40+30)*tag, btn.origin.y+btn.size.height, 240, 0);
        self.list = [NSArray arrayWithArray:arr];
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        table.delegate = self;
        table.dataSource = self;
        table.separatorStyle = UITableViewCellSeparatorStyleNone;
        table.backgroundColor = [UIColor clearColor];
        [UIView animateWithDuration:0.5 animations:^{
            self.frame = CGRectMake(30+(40+30)*tag, btn.origin.y+btn.size.height, 240, *height);
            table.frame = CGRectMake(0, 0, self.frame.size.width, *height);
        }];
        if (IOS_7) {
            [btnSender.superview.superview.superview.superview.superview addSubview:self];
            [btnSender.superview.superview.superview.superview.superview bringSubviewToFront:self];
            
            NSLog(@">>>>>>>>>>btnSender.superview>>>>>>>%@",NSStringFromClass([btnSender.superview class]));
            NSLog(@">>>>>>>>>>>>>btnSender.superview.superview>>>>%@",NSStringFromClass([btnSender.superview.superview class]));
            NSLog(@">>>>>>>>>>>>>btnSender.superview.superview.superview.superview.superview>>>>%@",NSStringFromClass([btnSender.superview.superview.superview.superview.superview class]));
            
            
        }else if (IOS_8){
            [btnSender.superview addSubview:self];
        }
        
        [self addSubview:table];
    }
    return self;
}

-(void)hideDropDown:(UIButton *)b {
    CGRect btn = b.superview.superview.superview.frame;
    [UIView animateWithDuration:0.5 animations:^{
        self.frame = CGRectMake(30+(40+30)*b.tag, btn.origin.y+btn.size.height, 240, 0);
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
    cell.textLabel.text =[list objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    cell.textLabel.textColor = [UIColor blackColor];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 39.5, self.frame.size.width, 0.5)];
    view.backgroundColor = [UIColor lightGrayColor];
    [cell.contentView addSubview:view];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self hideDropDown:btnSender];
    UITableViewCell *c = [tableView cellForRowAtIndexPath:indexPath];
    [btnSender setTitle:c.textLabel.text forState:UIControlStateNormal];
    [self myDelegate];
}

- (void) myDelegate {
    if ([self.delegate respondsToSelector:@selector(ComboBoxViewDelegateMethod:)]) {
        [self.delegate ComboBoxViewDelegateMethod:self];
    }
    
}
@end
