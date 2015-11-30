//
//  BaseViewModelClass.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/30.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVProgressHUD.h>
#import "KBHttpNetWorking.h"
#import "KBPlayer.h"
#import "KBHeader.h"
#import "PublicClass.h"
#import "SongInfoModel.h"
#import "InfoModel.h"
#import "UrlModel.h"
#import "SongMenuModel.h"
#import "HotMenuModel.h"
#import "SingerModel.h"
@interface BaseViewModelClass : NSObject

@property(strong,nonatomic)ReturnValueBlock returnBlock;
@property(strong,nonatomic)ErrorCodeBlock errorBlock;
@property(strong,nonatomic)FailureBlock failureBlock;

//获取网络的链接状态
-(void)netWorkStateWithNetConnectBlock:(NetWorkBlock)netConnectBlock
                            WithURlStr: (NSString *) strURl;
// 传入交互的Block块
-(void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock
                withErrorBlock:(ErrorCodeBlock)errorBlock
              withFailureBlock:(FailureBlock)failureBlock;


@end
