//
//  HomePageViewModel.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/30.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "HomePageViewModel.h"

@implementation HomePageViewModel

-(void)getWeatherInfo:(NSString *)cityName
{
    
    
    [KBHttpNetWorking httpJsonRequestNetWorkingWithUrlStr:[NSString stringWithFormat:Weather_Url,cityName]
                                                  success:^(id obj){
                                                      NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:[[obj objectForKey:@"data"] dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
                                                     // KBLog(@"%@",dict);
                                                      self.returnBlock(dict);
                                                  }fail:^{
                                                      [SVProgressHUD showErrorWithStatus:@"天气获取错误"];
                                                  }];
}
-(void)getTodayrecommended
{
    [SVProgressHUD showWithStatus:@"正在加载"];
    
    
    [KBHttpNetWorking httpJsonRequestNetWorkingWithUrlStr:TodayPush_Url
                                                  success:^(NSDictionary *dict)
     {
         NSArray *array=[[dict objectForKey:@"result"] objectForKey:@"list"];
         NSMutableArray *dataArr=[[NSMutableArray alloc] init];
         for (NSDictionary *subdict in array) {
             SongInfoModel *m=[[SongInfoModel alloc] init];
             [m setValuesForKeysWithDictionary:subdict];
             [dataArr addObject:m];
         }
         
         self.returnBlock(dataArr);
         [SVProgressHUD dismiss];
     }fail:^(){
         [SVProgressHUD showErrorWithStatus:@"加载错误"];
         self.errorBlock(@"加载错误");
     }];
}
-(void)tableViewDidSelectedPlaySongWithDataArr:(NSMutableArray *)dataArr AndIndex:(NSInteger)index
{
    [KBPlayer manager].songArr=dataArr;
    [[KBPlayer manager]playerSongsIndex:index ];
}

-(void)getHomeRecommended
{
    NSDictionary *dict=@{@"method":@"baidu.ting.plaza.index",@"version":@"5.5.0",@"from":@"ios",@"channel":@"appstore"};
    [KBHttpNetWorking NetRequestGETWithRequestURL:Recommend_Home WithParameter:dict WithReturnValeuBlock:^(id returnData){
        
    }WithErrorCodeBlock:^(id errorCode){
        self.errorBlock(errorCode);
    }WithFailureBlock:^(){
        self.failureBlock();
    }];

}
@end
