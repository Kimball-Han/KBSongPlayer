//
//  RootNavigationContoller.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "RootNavigationContoller.h"
#import "Window2Controller.h"
#import "KBHeader.h"
#import "PublicClass.h"
@interface RootNavigationContoller ()

@end

@implementation RootNavigationContoller

- (void)viewDidLoad {
    [super viewDidLoad];

    NSFileManager *fm=[NSFileManager defaultManager];
    BOOL ret1;
    NSError *error;
    if (![fm fileExistsAtPath:[PublicClass songsPath] isDirectory:&ret1]) {
        NSLog(@"not exit");
        [fm createDirectoryAtPath:[PublicClass songsPath]withIntermediateDirectories:YES attributes:nil error:&error];
    }
    if (![fm fileExistsAtPath:[PublicClass lrcsPath] isDirectory:&ret1]) {
        [fm createDirectoryAtPath:[PublicClass lrcsPath] withIntermediateDirectories:YES attributes:nil error:&error];
    }
//    if ([fm copyItemAtPath:[[NSBundle mainBundle] pathForResource:@"5" ofType:@"png"] toPath:[docPath
//                                                                                              stringByAppendingPathComponent:@"5.png"] error:&error]) {
//        NSLog(@"yes");
//    }
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   self.winVC.view.frame=CGRectMake(20, Screen_Height-80, 60, 60);
    [self.view addSubview:self.winVC.view];
   
}
-(UIViewController *)winVC
{
    if (!_winVC) {
        _winVC=[[Window2Controller alloc]init];
    }
    return _winVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
