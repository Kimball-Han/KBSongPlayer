//
//  ParsingLyrics.h
//  SongLrc
//
//  Created by 韩金波 on 15/9/22.
//  Copyright (c) 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LrcModel.h"
@interface ParsingLyrics : NSObject

@property (nonatomic,copy)NSString *author;
@property (nonatomic,copy)NSString *Artists;
@property (nonatomic,copy)NSMutableArray *dataArr;

-(BOOL)readSongLrcsByFilepath:(NSString *)filePath;
-(NSInteger)returnSongLrcAccordingToTime:(float)second;


@end
