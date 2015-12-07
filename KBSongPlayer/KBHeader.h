//
//  KBHeader.h
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/13.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#ifndef KBHeader_h
#define KBHeader_h

#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Width  [UIScreen mainScreen].bounds.size.width
#define App_delegate [UIApplication sharedApplication].delegate


#ifdef DEBUG
#define KBLog(...) NSLog(__VA_ARGS__)
#else
#define KBLog(...)
#endif

#define System_Version [[UIDevice currentDevice].systemVersion floatValue]

#define Weather_Url @"http://wanapi.damai.cn/weather.json?cityname=%@&source=10345&useCash=false"
#define TodayPush_Url @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.userRecSongList&from=ios&bduss=25lQzlrTm5adDZ-V0lVa2t6SExNTnZIOWU3dk1wSTZNb3J0WnFkb0R-S0habGRWQVFBQUFBJCQAAAAAAAAAAAEAAADdUwg-uq52dna35wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIfZL1WH2S9VU&version=5.5.0"
#define e @"ICHuBtnuCWad2K9%2ByVphNeAny5QQPf30AVanMmswkxo%3D&version=5.5.0"
#define Play_SongLink_Url @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.getInfos&ts=%@&songid=%@&nw=2&l2p=344.1&lpb=320000&ext=MP3&format=json&from=ios&usup=1&lebo=0&aac=0&ucf=4&vid=&res=1&e=%@&from=ios&channel=appstore"
#define Song_Menu @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.diy.gedan&page_no=%ld&page_size=30&from=ios&version=5.5.0&from=ios&channel=appstore"
#define Hot_Menu @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.billboard.billCategory&format=json&from=ios&kflag=1&version=5.5.0&from=ios&channel=appstore"
#define Hot_Singers @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.artist.getList&format=json&order=1&limit=12&offset=0&area=0&sex=0&abc="
#define Singer_Group @"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.artist.getList&format=json&order=1&limit=50&offset=%ld&area=%@&sex=%@&abc=%@"
#define Recommend_Home @"http://tingapi.ting.baidu.com/v1/restserver/ting?"
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^FailureBlock)();
typedef void (^NetWorkBlock)(BOOL netConnetState);
#endif /* KBHeader_h */
