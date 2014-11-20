//
//  ScoreAndRankCell.m
//  SafeConstructionSite
//
//  Created by myStyle on 14-11-20.
//  Copyright (c) 2014年 XB. All rights reserved.
//

#import "ScoreAndRankCell.h"

@implementation ScoreAndRankCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"ScoreAndRankCell" owner:self options:nil] objectAtIndex:0];
        
        CALayer *layer = self.scoreBtn.layer;
        [layer setBorderWidth:1.0f];
        [layer setBorderColor:[UIColor grayColor].CGColor];
        
        layer = self.rankBtn.layer;
        [layer setBorderWidth:1.0f];
        [layer setBorderColor:[UIColor grayColor].CGColor];
        
        
    }
    return self;
}

- (IBAction)scoreAndRankBtn:(UIButton *)sender {
    
    NSArray * arr = [[NSArray alloc] init];
    
    if (sender.tag == 200) {
        arr = [NSArray arrayWithObjects:@"1分", @"2分", @"3分", @"4分", @"5分",@"6分",nil];
    }else if (sender.tag == 201){
        arr = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D",nil];
    }
    if(self.pullDownView == nil) {
        CGFloat f;
        if (sender.tag == 200) {
             f = 200;
        }else if (sender.tag == 201){
            f = 150;
        }
        
        self.pullDownView = [[PullDownView alloc] showDropDown:sender :&f :arr :sender.tag:nil];
    }
    else {
        [self.pullDownView hideDropDown:sender];
        [self release2];
    }

    
    
    
}

-(void)release2{
    self.pullDownView = nil;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
