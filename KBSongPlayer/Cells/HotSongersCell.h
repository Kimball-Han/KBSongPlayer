//
//  HotSongersCell.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/27.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>
#define HotSingerCellId @"HOTCELL"

@interface HotSongersCell : UITableViewCell<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property (nonatomic,copy)NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
