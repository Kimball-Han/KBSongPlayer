//
//  SongMenuCell.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "SongMenuCell.h"
#import <UIImageView+WebCache.h>
@implementation SongMenuCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(SongMenuModel *)model
{
    [self.picImage sd_setImageWithURL:[NSURL URLWithString:model.pic_300] placeholderImage:nil];
    self.desLabel.text=model.title;
}
@end
