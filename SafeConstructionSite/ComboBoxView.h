//
//  ComboBoxView.h
//  comboBox
//
//  Created by duansong on 10-7-28.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ComboBoxView;
@protocol ComboBoxViewDelegate <NSObject>
- (void) ComboBoxViewDelegateMethod: (ComboBoxView *) sender;
@end

@interface ComboBoxView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) id <ComboBoxViewDelegate> delegate;
@property (nonatomic, assign) NSInteger titleCount;
@property (nonatomic, strong) NSMutableDictionary *dict;

-(void)hideDropDown:(UIButton *)b;
- (id)showDropDown:(UIButton *)b:(CGFloat *)height:(NSArray *)arr:(NSInteger)tag:(NSMutableDictionary *)dict;
@end
