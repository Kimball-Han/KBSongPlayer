//
//  ParsingLyrics.m
//  SongLrc
//
//  Created by 韩金波 on 15/9/22.
//  Copyright (c) 2015年 Psylife. All rights reserved.
//

#import "ParsingLyrics.h"

@implementation ParsingLyrics

-(BOOL)readSongLrcsByFilepath:(NSString *)filePath
{
     @autoreleasepool {
         _dataArr=[[NSMutableArray alloc] init];
     }
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:filePath]){
        NSString *str=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
        if (error) {
            return NO;
        }else{
           
            NSArray *arr=[str componentsSeparatedByString:@"\n"];
            [self parsingArr:arr];
            return YES;
      
        }
        
    }else{
        
        return NO;
    }
    
}
-(void)parsingArr:(NSArray *)arr
{
    for (NSString *str in arr) {
        NSArray *array=[str componentsSeparatedByString:@"]"];
        if (array.count>=2) {
            NSString *str2 =array[array.count-1];
            for (NSString *str1 in array) {
                if (str1.length==9&&[str characterAtIndex:0]) {
                    NSString *str3=[str1 substringFromIndex:1];
                    NSArray *lrcArr=[str3 componentsSeparatedByString:@":"];
                    if (lrcArr.count==2) {
                        LrcModel *model=[[LrcModel alloc] init];
                        model.lrcstr=str2;
                        model.time=[lrcArr[0] floatValue]*60+[lrcArr[1] floatValue];
                        [_dataArr addObject:model];
                    }
                }
            }
        }
    }
    [_dataArr sortUsingSelector:@selector(islitterThan:)];
    
}

-(NSInteger)returnSongLrcAccordingToTime:(float)second
{
    NSInteger i;
    for (i=0; i<_dataArr.count; i++) {
        LrcModel *model=_dataArr[i];
        if (model.time>second) {
            return (i)?  i-1: 0 ;
        }
    }
    return _dataArr.count-1;
}
@end
