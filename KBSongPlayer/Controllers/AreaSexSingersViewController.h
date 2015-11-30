//
//  AreaSexSingersViewController.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/30.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongerClassifyViewModel.h"
@interface AreaSexSingersViewController : UIViewController
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *area;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *group;
@property (nonatomic, assign)NSInteger offset;
@property (nonatomic,retain)SongerClassifyViewModel *viewModel;
-(void)getData;
@end
