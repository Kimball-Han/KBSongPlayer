//
//  SongInfoModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/21.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SongInfoModel : NSObject
@property(nonatomic,copy)NSString *song_id;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *pic_small;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *as_mv;

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *islow;
@end
