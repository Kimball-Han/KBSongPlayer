//
//  UrlModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/23.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlModel : NSObject
@property(nonatomic,copy)NSString *file_link;
@property(nonatomic,copy)NSString *song_file_id;
@property(nonatomic,copy)NSString *file_bitrate;
@property(nonatomic,copy)NSString *file_extension;
@property(nonatomic,copy)NSString *can_load;
@property(nonatomic,copy)NSString *show_link;
@end
