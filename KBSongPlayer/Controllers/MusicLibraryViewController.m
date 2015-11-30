//
//  MusicLibraryViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/27.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "MusicLibraryViewController.h"
#import "SongMenuViewController.h"
#import "HotMenuViewController.h"
#import "SingerViewController.h"
#import "KBHeader.h"
@interface MusicLibraryViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,assign) NSInteger *currentPage;
@end

@implementation MusicLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}
-(void)initUI
{
    SongMenuViewController *vc2=[[SongMenuViewController alloc] init];
    vc2.view.frame=CGRectMake(Screen_Width*1, 0, Screen_Width, Screen_Height-104);
    [self addChildViewController:vc2];
    [self.scrollView addSubview:vc2.view];
    
    HotMenuViewController *vc3=[[HotMenuViewController alloc] init];
    vc3.view.frame=CGRectMake(Screen_Width*2, 0, Screen_Width, Screen_Height-104);
    [self addChildViewController:vc3];
    [self.scrollView addSubview:vc3.view];
    
    SingerViewController *vc4=[[SingerViewController alloc] init];
    vc4.view.frame=CGRectMake(Screen_Width*3, 0, Screen_Width, Screen_Height-104);
    [self addChildViewController:vc4];
    [self.scrollView addSubview:vc4.view];
    
    self.scrollView.contentSize=CGSizeMake(Screen_Width*4, Screen_Height-104);
    self.scrollView.pagingEnabled=YES;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    
}
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden=NO;
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden=YES;
//    
//}
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
