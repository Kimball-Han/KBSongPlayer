//
//  HotMenuCell.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotMenuViewModel.h"
#import "SongInfoModel.h"
#define HotMenuCellId @"HtMenuCellID"

@interface HotMenuCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImage;
@property (weak, nonatomic) IBOutlet UILabel *label1;

@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (nonatomic,retain)HotMenuModel *model;
@end
