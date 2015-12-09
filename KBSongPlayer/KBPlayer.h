//
//  KBPlayer.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/23.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFSoundManager.h>
#import "SongInfoModel.h"
#import "InfoModel.h"
#import "UrlModel.h"

@interface KBPlayer : NSObject
@property(nonatomic,strong) AFSoundPlayback * player;
@property(nonatomic,assign) BOOL isBlack;
@property(nonatomic,strong) NSMutableArray * songArr;
@property(nonatomic,assign) NSInteger currentIndex;


+(KBPlayer*)manager;

-(void)playerSongsIndex:(NSInteger)index;
-(void)playPreviousSong;
-(void)playNextSong;
-(void)play;
-(void)pause;
@end
