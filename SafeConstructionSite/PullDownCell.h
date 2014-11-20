//
//  PullDownCell.h
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-17.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EvaluatDownVIew.h"
@interface PullDownCell : UITableViewCell
@property (nonatomic, strong) EvaluatDownVIew *evaluatDownView;

@property (weak, nonatomic) IBOutlet UIButton *scoreBtn;

@property (weak, nonatomic) IBOutlet UIButton *numBtn;

@property (weak, nonatomic) IBOutlet UIButton *rankBtn;
- (IBAction)pullDownClick:(UIButton *)sender;

@end
