//
//  GuessCell.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/14.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "GuessCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@implementation GuessCell
-(void)setModel:(SongInfoModel *)model
{
    _nameLB.text= model.title;
    _authorLB.text=[NSString stringWithFormat:@"-%@",model.author];
    [_img sd_setImageWithURL:[NSURL URLWithString: model.pic_small] placeholderImage:nil];
}
@end
