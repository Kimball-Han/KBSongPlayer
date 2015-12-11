//
//  LrcModel.h
//  SongLrc
//
//  Created by 韩金波 on 15/9/24.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LrcModel : NSObject
@property(nonatomic,assign)float time;
@property(nonatomic,copy)NSString *lrcstr;
-(BOOL)islitterThan:(LrcModel *)model;
@end
