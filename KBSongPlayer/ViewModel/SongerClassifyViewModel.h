//
//  SongerClassifyViewModel.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/27.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "BaseViewModelClass.h"

@interface SongerClassifyViewModel : BaseViewModelClass

-(void)getHotSingersInfo;
-(void)getSingersFromArea:(NSString *)area Sex:(NSString *)sex Group:(NSString *)group Offset:(NSInteger)offset;
@end
