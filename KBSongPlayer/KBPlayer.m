//
//  KBPlayer.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/23.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "KBPlayer.h"
#import "PlayerViewModel.h"

#import "PublicClass.h"
@implementation KBPlayer
{
    PlayerViewModel *_viewModel;
   
  
}

+(KBPlayer *)manager
{
    static KBPlayer *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[KBPlayer alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _viewModel=[[PlayerViewModel alloc] init];
        
        __weak typeof(self) weakSelf=self;
        [_viewModel setBlockWithReturnBlock:^(id returnData){
            
            [weakSelf analyseModel:returnData];
            
        }withErrorBlock:^(id  errorCode){
            
        }withFailureBlock:^(){
            
        }];
       
        
    }
    return self;
}
//播放第几首
-(void)playerSongsIndex:(NSInteger)index
{
    if (index<_songArr.count) {
         _currentIndex=index;
        if (index<0) {
            _currentIndex=_songArr.count-1;
        }
    }else{
        _currentIndex=0;
    }
    //分析model是本地还是网络
    SongInfoModel *model=_songArr[_currentIndex];
    //本地
    if([model.islow isEqualToString:@"local"]){
        AFSoundItem *item=[[AFSoundItem alloc] initWithLocalResource:model.name atPath:[PublicClass songsPath]];
        [self playSongAndItem:item];
    }else{
        //网络
    [_viewModel getSongInfoBy:model];
        
    }
}

//网络歌曲播放
-(void)analyseModel:(InfoModel *)model;
{
    NSArray *arr=model.UrlArr;
    if (arr.count>0) {
        for (UrlModel *model in arr) {
            if (model.file_link) {
                AFSoundItem *item=[[AFSoundItem alloc] initWithStreamingURL:[NSURL URLWithString:model.file_link]];
                [self playSongAndItem:item];
                break;
            }
        }
       
    }
    
}
//播放
-(void)playSongAndItem:(AFSoundItem *)item
{
    @autoreleasepool {
        
    [_player pause];
    _player.player=nil;
    _player=nil;
    _player =[[AFSoundPlayback alloc] initWithItem:item];
        __weak typeof(self) weakSelf=self;
    [_player listenFeedbackUpdatesWithBlock:^(AFSoundItem *item){
        KBLog(@"%@,%@,%ld,%ld",item.artist,item.title,(long)item.timePlayed,(long)item.duration);
        
        if (weakSelf.isBlack) {
            [weakSelf configNowPlayeringInfoCenter:item];
        }
        
        if (item.timePlayed==item.duration) {
            weakSelf.currentIndex+=1;
            [weakSelf playerSongsIndex:_currentIndex];
        }
    }andFinishedBlock:^{
       
    }];
    }
    
}
/**
 *  设置锁屏信息
 */
-(void)configNowPlayeringInfoCenter:(AFSoundItem *)item
{
    NSMutableDictionary * dict=[[NSMutableDictionary alloc] init];
    [dict setObject:item.title forKey:MPMediaItemPropertyTitle];
    if (item.artist) {
          [dict setObject:item.artist forKey:MPMediaItemPropertyArtist];
    }

    MPMediaItemArtwork *artwork=[[MPMediaItemArtwork alloc] initWithImage:[UIImage imageNamed:@"5"]];
    [dict setObject:artwork forKey:MPMediaItemPropertyArtwork];
    
    NSInteger t=item.duration-item.timePlayed;
    [dict setObject:[NSNumber numberWithInteger:t] forKey:MPMediaItemPropertyPlaybackDuration];
    [dict setObject:[NSNumber numberWithInteger:item.timePlayed] forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
    [[MPNowPlayingInfoCenter defaultCenter] setNowPlayingInfo:dict];
    
}
#pragma mark 播放控制
-(void)playPreviousSong
{
    self.currentIndex-=1;
    [self playerSongsIndex:_currentIndex];
}
-(void)play
{
    
  [_player play];
    
}
-(void)pause
{
    [_player pause];
}
-(void)playNextSong
{
    self.currentIndex+=1;
    [self playerSongsIndex:_currentIndex];
}


@end
