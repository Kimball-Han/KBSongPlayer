//
//  HotMenuViewModel.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "HotMenuViewModel.h"

@implementation HotMenuViewModel
-(void)getHotMenu
{
    [KBHttpNetWorking NetRequestGETWithRequestURL:Hot_Menu WithParameter:nil WithReturnValeuBlock:^(id returnData){
        [self dataProcess:returnData];
    }WithErrorCodeBlock:^(id errorCode){
        self.errorBlock(errorCode);
    }WithFailureBlock:^(){
        self.failureBlock();
    }];
}
-(void)dataProcess:(id )data
{
    NSArray *arr=[data objectForKey:@"content"];
    NSMutableArray *returnArr=[NSMutableArray array];
    for (int i=0; i<arr.count; i++) {
        NSDictionary *dict=arr[i];
        HotMenuModel *model=[[HotMenuModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        
        NSArray *arr1=[dict objectForKey:@"content"];
        NSMutableArray*subArr=[NSMutableArray array];
        for (int j=0; j<arr1.count; j++) {
            NSDictionary *subDic=arr1[j];
            SongInfoModel *mo=[[SongInfoModel alloc] init];
            [mo setValuesForKeysWithDictionary:subDic];
            [subArr addObject:mo];
        }
        model.contentArr=subArr;
        [returnArr addObject:model];
        
    }
    
    self.returnBlock(returnArr);
}
@end
