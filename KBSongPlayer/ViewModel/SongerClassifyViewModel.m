//
//  SongerClassifyViewModel.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/27.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "SongerClassifyViewModel.h"

@implementation SongerClassifyViewModel

-(void)getHotSingersInfo
{
    [KBHttpNetWorking NetRequestGETWithRequestURL:Hot_Singers WithParameter:nil WithReturnValeuBlock:^(id returnData){
        [self dataProcess:returnData];
    }WithErrorCodeBlock:^(id code){
        self.errorBlock(code);
    }WithFailureBlock:^(){
        self.failureBlock();
    }];
}
-(void)dataProcess:(id )data
{
    NSArray *arr=[data objectForKey:@"artist"];
    NSMutableArray *returnArr=[NSMutableArray array];
    for (NSDictionary *dic in arr) {
        SingerModel *model=[[SingerModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [returnArr addObject:model];
    }
    self.returnBlock(returnArr);
}
-(void)getSingersFromArea:(NSString *)area Sex:(NSString *)sex Group:(NSString *)group Offset:(NSInteger)offset
{
    [KBHttpNetWorking NetRequestGETWithRequestURL:[NSString stringWithFormat:Singer_Group,offset,area,sex,group] WithParameter:nil WithReturnValeuBlock:^(id returnData){
        [self dataProcess:returnData];
    }WithErrorCodeBlock:^(id code){
        self.errorBlock(code);
    }WithFailureBlock:^(){
        self.failureBlock();
    }];

}
@end
