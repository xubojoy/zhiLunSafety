//
//  EvaluatDownVIew.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EvaluatDownVIew;
@protocol EvaluatDownVIewDelegate <NSObject>
- (void) EvaluatDownVIewDelegateMethod: (EvaluatDownVIew *) sender;
@end

@interface EvaluatDownVIew : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id <EvaluatDownVIewDelegate> delegate;
@property (nonatomic, assign) NSInteger titleCount;
@property (nonatomic, strong) NSMutableDictionary *dict;

-(void)hideDropDown:(UIButton *)b;
- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSInteger)tag:(NSMutableDictionary *)dict;


@end
