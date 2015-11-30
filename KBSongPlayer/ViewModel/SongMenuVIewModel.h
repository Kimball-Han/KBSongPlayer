//
//  SongMenuVIewModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "BaseViewModelClass.h"

@interface SongMenuVIewModel : BaseViewModelClass

-(void)getSongMenuData:(NSInteger)page type:(NSString *)type;
@end
