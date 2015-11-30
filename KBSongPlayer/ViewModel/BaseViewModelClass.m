//
//  BaseViewModelClass.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/30.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "BaseViewModelClass.h"
@implementation BaseViewModelClass

-(void)netWorkStateWithNetConnectBlock:(NetWorkBlock)netConnectBlock WithURlStr:(NSString *)strURl
{
    BOOL netState = [KBHttpNetWorking netWorkReachabilityWithURLString:strURl];
    netConnectBlock(netState);
}

-(void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock withErrorBlock:(ErrorCodeBlock)errorBlock withFailureBlock:(FailureBlock)failureBlock
{
    _returnBlock = returnBlock;
    _errorBlock = errorBlock;
    _failureBlock = failureBlock;
}
@end
