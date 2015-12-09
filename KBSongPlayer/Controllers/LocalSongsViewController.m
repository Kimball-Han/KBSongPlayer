//
//  LocalSongsViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/12/9.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "LocalSongsViewController.h"
#import "PublicClass.h"
#import "SongInfoModel.h"
#import "KBPlayer.h"
@interface LocalSongsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tanleView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation LocalSongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initAppLocalData];
}
-(void)initUI
{
    _tanleView.delegate=self;
    _tanleView.dataSource=self;
    [_tanleView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"LocalId"];
    UIBarButtonItem *right=[[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(EditBUttonClick:)];
    self.navigationItem.rightBarButtonItem=right;
    self.navigationItem.title=@"本地音乐";
}
-(void)initAppLocalData
{
   
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        _dataArr=[PublicClass getLocalSongs];
        dispatch_async(dispatch_get_main_queue(), ^{
            [_tanleView reloadData];
        });
    });
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LocalId"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    SongInfoModel *model=_dataArr[indexPath.row];
    cell.textLabel.text=model.title;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [KBPlayer manager].songArr=_dataArr;
    [[KBPlayer manager] playerSongsIndex:indexPath.row];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=NO;
    [super viewWillAppear:animated];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.navigationBarHidden=YES;
    [super viewWillDisappear:animated];
    
}
-(void)EditBUttonClick:(UIButton *)sender
{
    
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
