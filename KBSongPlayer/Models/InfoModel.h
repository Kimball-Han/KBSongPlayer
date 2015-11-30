//
//  InfoModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/23.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoModel : NSObject
@property(nonatomic,copy)NSString *album_id;
@property(nonatomic,copy)NSString *artist_500_500;
@property(nonatomic,copy)NSString *artist_1000_1000;
@property(nonatomic,copy)NSString *author;
@property(nonatomic,copy)NSString *lrclink;
@property(nonatomic,copy)NSString *ting_uid;
@property(nonatomic,copy)NSString *song_id;
@property(nonatomic,copy)NSString *song_source;
@property(nonatomic,copy)NSMutableArray *UrlArr;
@end
