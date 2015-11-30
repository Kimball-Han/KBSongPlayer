//
//  WeatherView.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/16.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
typedef NS_ENUM(NSInteger,KBMenuBeClick) {
    KBMenuLocalMusic=1,
    KBMenuLoadSong,
    KBMenuMyFavorite,
    KBMenuOnlineMusic
};

@protocol WeatherDelegate <NSObject>

-(void)MenuButtonBeClicked:(KBMenuBeClick)Menu;
-(void)SearchButtonBeReturn:(NSString *)keyWord;

@end
@interface WeatherView : UIView<UITextFieldDelegate,CLLocationManagerDelegate>
@property(nonatomic,assign)id<WeatherDelegate> delegate;
@property(nonatomic,strong)CLLocationManager *locationManager;
@end
