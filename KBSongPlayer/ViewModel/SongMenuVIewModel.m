//
//  SongMenuVIewModel.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "SongMenuVIewModel.h"

@implementation SongMenuVIewModel
-(void)getSongMenuData:(NSInteger)page type:(NSString *)type
{
    if (!type) {
        [KBHttpNetWorking NetRequestGETWithRequestURL:[NSString stringWithFormat:Song_Menu,(long)page] WithParameter:nil WithReturnValeuBlock:^(id data){
            [self dataProcess:data];
        }WithErrorCodeBlock:^(id errorCode){
            self.errorBlock(errorCode);
        }WithFailureBlock:^(){
            self.failureBlock();
        }];
    }
}
-(void)dataProcess:(id)data
{
    NSArray *Arr=[data objectForKey:@"content"];
    NSMutableArray *dataArr=[NSMutableArray array];
    for (NSDictionary *dict in Arr) {
        SongMenuModel*model=[[SongMenuModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        [dataArr addObject:model];
    }
    self.returnBlock(dataArr);
}
@end
