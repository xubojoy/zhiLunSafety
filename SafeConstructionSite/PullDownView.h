//
//  PullDownView.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-19.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PullDownView;
@protocol PullDownViewDelegate <NSObject>
- (void) PullDownViewDelegateMethod: (PullDownView *) sender;
@end

@interface PullDownView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id <PullDownViewDelegate> delegate;
@property (nonatomic, assign) NSInteger titleCount;
@property (nonatomic, strong) NSMutableDictionary *dict;

-(void)hideDropDown:(UIButton *)b;
- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSInteger)tag:(NSMutableDictionary *)dict;

@end
