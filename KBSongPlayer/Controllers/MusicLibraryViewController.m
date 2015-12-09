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
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (nonatomic,assign) NSInteger currentPage;
@end

@implementation MusicLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    
}
-(void)initUI
{
    self.scrollView.delegate=self;
    self.scrollView.bounces=NO;
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
    self.currentPage=0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)blackButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)searchButtonClick:(id)sender {
    
}

- (IBAction)menuButtonClick:(UIButton *)sender {
    NSInteger i=sender.tag-11;
    NSInteger t=i-self.currentPage;
    CGRect frame=self.lineView.frame;
    [UIView animateWithDuration:0.2*labs(t) animations:^{
        self.lineView.frame=CGRectMake(35*(i+1)+(Screen_Width-175)/4.0*(i), frame.origin.y, frame.size.width, frame.size.height);
        self.scrollView.contentOffset=CGPointMake(Screen_Width*i, 0);
    }];
         //  [self.scrollView scrollRectToVisible:CGRectMake(, 0, Screen_Width, Screen_Height-104) animated:YES];
   
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat s= (Screen_Width-175)/4.0;
    CGFloat x=(Screen_Width-(70.0+s))/(3.0*Screen_Width)*scrollView.contentOffset.x+35;
    self.currentPage=scrollView.contentOffset.x/Screen_Width;
    CGRect frame=self.lineView.frame;
     self.lineView.frame=CGRectMake(x, frame.origin.y, frame.size.width, frame.size.height);
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
