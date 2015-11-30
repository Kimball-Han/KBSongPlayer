//
//  HotMenuModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/27.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotMenuModel : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *comment;
@property(nonatomic,copy)NSString *web_url;
@property(nonatomic,copy)NSString *pic_s192;
@property(nonatomic,copy)NSString *pic_s444;
@property(nonatomic,copy)NSString *pic_s260;
@property(nonatomic,copy)NSString *pic_s210;
@property(nonatomic,copy)NSMutableArray *contentArr;
@end
