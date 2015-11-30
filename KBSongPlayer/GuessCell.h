//
//  GuessCell.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/14.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>
#define cellID @"cellID"
#import "SongInfoModel.h"
@interface GuessCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLB;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *authorLB;
-(void)setModel:(SongInfoModel *)model;

@end
