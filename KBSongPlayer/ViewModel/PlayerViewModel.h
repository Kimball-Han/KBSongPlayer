//
//  PlayerViewModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/25.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "BaseViewModelClass.h"

@interface PlayerViewModel : BaseViewModelClass

-(void)getSongInfoBy:(SongInfoModel *)model;
@end
