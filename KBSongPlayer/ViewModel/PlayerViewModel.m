//
//  PlayerViewModel.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/25.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "PlayerViewModel.h"

@implementation PlayerViewModel

-(void)getSongInfoBy:(SongInfoModel *)model
{
    [KBHttpNetWorking NetRequestGETWithRequestURL:[NSString stringWithFormat:Play_SongLink_Url,[PublicClass getTimestamp],model.song_id,e] WithParameter:nil WithReturnValeuBlock:^(id returnData){
        
        NSDictionary *dict=[returnData objectForKey:@"songinfo"];
        InfoModel *model1=[[InfoModel alloc] init];
        [model1 setValuesForKeysWithDictionary:dict];
        NSMutableArray *urlArr=[NSMutableArray array];
        
        NSArray *arr=[[returnData objectForKey:@"songurl"] objectForKey:@"url"];
        for (NSDictionary *sub in arr) {
            UrlModel *mo=[[UrlModel alloc] init];
            [mo setValuesForKeysWithDictionary:sub];
            [urlArr addObject:mo];
        }
        model1.UrlArr=urlArr;
        self.returnBlock(model1);
        
    }WithErrorCodeBlock:^(id errorCode){
        self.errorBlock(errorCode);
    }WithFailureBlock:^(){
        self.failureBlock();
    }];
}


@end
