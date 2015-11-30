//
//  SongMenuCell.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongMenuModel.h"
#define SongMenuCellId @"songMenuCellID"

@interface SongMenuCell : UICollectionViewCell
@property(nonatomic,retain)SongMenuModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *picImage;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;
@end
