//
//  KBHttpNetWorking.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/21.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KBHeader.h"
@interface KBHttpNetWorking : NSObject

+(void)httpJsonRequestNetWorkingWithUrlStr:(NSString *)urlStr
                                   success:(void(^)(id responseObject))success
                                     fail :(void (^)())fail;

#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;

#pragma POST请求
+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (ReturnValueBlock) block
                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
                     WithFailureBlock: (FailureBlock) failureBlock;

#pragma GET请求
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
                    WithFailureBlock: (FailureBlock) failureBlock;
@end
