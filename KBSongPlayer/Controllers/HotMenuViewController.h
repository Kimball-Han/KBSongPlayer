//
//  HotMenuViewController.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBHeader.h"
@interface HotMenuViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,copy)NSMutableArray *dataArr;
@end
