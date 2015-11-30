//
//  ViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/13.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "ViewController.h"
#import "GuessCell.h"
#import "KBHeader.h"
#import "WeatherView.h"
#import "HomePageViewModel.h"
#import "Window2Controller.h"
#import "RootNavigationContoller.h"
#import "MusicLibraryViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,WeatherDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    WeatherView *_headView;
    NSMutableArray *_dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

-(void)initUI
{
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GuessCell" bundle:nil] forCellReuseIdentifier:cellID];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.tableFooterView=[[UIView alloc] init];
    
    
    _headView=[[[NSBundle mainBundle] loadNibNamed:@"WeatherView" owner:self options:nil] lastObject];
    _headView.frame=CGRectMake(0, 0, Screen_Width, Screen_Width*0.75);
    _headView.clipsToBounds=YES;
    _headView.delegate=self;
    [self.view addSubview:_headView];
    
}
-(void)initData
{
    _dataArr=[NSMutableArray array];
    
    HomePageViewModel *viewModel=  [[HomePageViewModel alloc] init];
    
    [viewModel setBlockWithReturnBlock:^(id array){
        _dataArr=array;
        [_tableView reloadData];
    }withErrorBlock:^(id error){
        
    }withFailureBlock:^{
        
    }];
    [viewModel getTodayrecommended];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self.tableView setContentInset:UIEdgeInsetsMake(Screen_Width*0.75, 0, 0, 0)];
    [self.tableView setContentOffset:CGPointMake(0, -Screen_Width*0.75)];
    self.tableView.showsVerticalScrollIndicator=NO;
    
    Window2Controller *vc=[[Window2Controller alloc]init];
    vc.view.frame=CGRectMake(20, Screen_Height-80, 60, 60);
    [self.navigationController.view addSubview:vc.view];
    RootNavigationContoller *nv=(RootNavigationContoller *)self.navigationController;
    nv.winVC=vc;
}


#pragma mark - weatherdelegate
-(void)MenuButtonBeClicked:(KBMenuBeClick)Menu
{
    KBLog(@"%ld",(long)Menu);
    switch (Menu) {
        case KBMenuLocalMusic:
        {
            
        }
            break;
        case KBMenuLoadSong:
        {
            
        }
            break;
        case KBMenuMyFavorite:
        {
        
        }
            break;
        case KBMenuOnlineMusic:
        {
           MusicLibraryViewController *vc=[[MusicLibraryViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}
-(void)SearchButtonBeReturn:(NSString *)keyWord
{
    
}

#pragma mark - tableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GuessCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    [cell setModel:_dataArr[indexPath.row ]];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 30)];
    label.text=@"    今日推荐";
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 30) ];
    [view addSubview:label];
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
      HomePageViewModel *viewModel=  [[HomePageViewModel alloc] init];
    [viewModel tableViewDidSelectedPlaySongWithDataArr:_dataArr AndIndex:indexPath.row];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float scrollViewY=  scrollView.contentOffset.y;
    if (scrollViewY<-Screen_Width*0.75) {
        _headView.frame=CGRectMake(0, 0, Screen_Width, -scrollViewY);
    }else{
        _headView.frame=CGRectMake(0, -scrollViewY- Screen_Width*0.75, Screen_Width, Screen_Width*0.75);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
