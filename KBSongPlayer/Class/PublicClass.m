//
//  PublicClass.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/23.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "PublicClass.h"

@implementation PublicClass
+(NSString *)getTimestamp
{
    NSDate *datenow=[NSDate date];
  NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}
+(NSMutableArray *)getSongerClassification
{
  NSMutableArray *  _dataArr =[NSMutableArray array];
    NSDictionary *dic=@{@"name":@"华语男歌手",@"area":@"6",@"sex":@"1"};
    NSDictionary *dic1=@{@"name":@"华语女歌手",@"area":@"6",@"sex":@"2"};
    NSDictionary *dic2=@{@"name":@"华语乐队组合",@"area":@"6",@"sex":@"3"};
    NSArray *arr1=@[dic,dic1,dic2];
    
    NSDictionary *dic3=@{@"name":@"欧美男歌手",@"area":@"3",@"sex":@"1"};
    NSDictionary *dic4=@{@"name":@"欧美女歌手",@"area":@"3",@"sex":@"2"};
    NSDictionary *dic5=@{@"name":@"欧美乐队组合",@"area":@"3",@"sex":@"3"};
    NSArray *arr2=@[dic3,dic4,dic5];
    
    NSDictionary *dic6=@{@"name":@"韩国男歌手",@"area":@"7",@"sex":@"1"};
    NSDictionary *dic7=@{@"name":@"韩国女歌手",@"area":@"7",@"sex":@"2"};
    NSDictionary *dic8=@{@"name":@"韩国乐队组合",@"area":@"7",@"sex":@"3"};
    NSArray *arr3=@[dic6,dic7,dic8];
    
    NSDictionary *dic9=@{@"name":@"日本男歌手",@"area":@"60",@"sex":@"1"};
    NSDictionary *dic10=@{@"name":@"日本女歌手",@"area":@"60",@"sex":@"2"};
    NSDictionary *dic11=@{@"name":@"日本乐队组合",@"area":@"60",@"sex":@"3"};
    NSArray *arr4=@[dic9,dic10,dic11];
    
    NSDictionary *dic12=@{@"name":@"其他",@"area":@"5",@"sex":@"4"};
    NSArray *arr5=@[dic12];
    [_dataArr addObject:arr1];
    [_dataArr addObject:arr2];
    [_dataArr addObject:arr3];
    [_dataArr addObject:arr4];
    [_dataArr addObject:arr5];
    return _dataArr;
}
@end
