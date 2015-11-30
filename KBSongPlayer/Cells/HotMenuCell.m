//
//  HotMenuCell.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "HotMenuCell.h"
#import <UIImageView+WebCache.h>
@implementation HotMenuCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(HotMenuModel *)model
{
    _model=model;
    [self.picImage sd_setImageWithURL:[NSURL URLWithString:model.pic_s192] placeholderImage:nil];
    for (int i=0; i<model.contentArr.count; i++) {
        SongInfoModel *mo=model.contentArr[i];
        if (i==0) {
            self.label1.text=[NSString stringWithFormat:@"1 %@ - %@",mo.title,mo.author];
        }
        if (i==1) {
            self.label2.text=[NSString stringWithFormat:@"2 %@ - %@",mo.title,mo.author];
        }
        if (i==2) {
            self.label3.text=[NSString stringWithFormat:@"3 %@ - %@",mo.title,mo.author];
        }
    }
}
@end
