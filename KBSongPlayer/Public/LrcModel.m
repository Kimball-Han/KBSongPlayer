//
//  LrcModel.m
//  SongLrc
//
//  Created by 韩金波 on 15/9/24.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "LrcModel.h"

@implementation LrcModel


-(BOOL)islitterThan:(LrcModel *)model
{
   return  self.time>model.time;
}

@end
