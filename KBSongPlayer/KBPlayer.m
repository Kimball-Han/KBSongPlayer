//
//  KBPlayer.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/23.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "KBPlayer.h"
#import "PlayerViewModel.h"
#import <AFSoundManager.h>
@implementation KBPlayer
{
    PlayerViewModel *_viewModel;
    AFSoundPlayback *_player;
  
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
            weakSelf.currentModel=returnData;
            [weakSelf analyseModel];
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
    
    SongInfoModel *model=_songArr[_currentIndex];
    [_viewModel getSongInfoBy:model];
}

//分析model是本地还是网络播放
-(void)analyseModel
{
    NSArray *arr=self.currentModel.UrlArr;
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
    
    [_player listenFeedbackUpdatesWithBlock:^(AFSoundItem *item){
        KBLog(@"%@,%@,%ld,%ld",item.artist,item.title,(long)item.timePlayed,(long)item.duration);
    }andFinishedBlock:^{
        self.currentIndex+=1;
        [self playerSongsIndex:_currentIndex];
    }];
    }
    
}

@end
