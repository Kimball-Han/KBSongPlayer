//
//  HomePageViewModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/30.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "BaseViewModelClass.h"

@interface HomePageViewModel : BaseViewModelClass

-(void)getWeatherInfo:(NSString *)cityName;
-(void)getTodayrecommended;
-(void)tableViewDidSelectedPlaySongWithDataArr:(NSMutableArray *)dataArr AndIndex:(NSInteger)index;

-(void)getHomeRecommended;
@end
