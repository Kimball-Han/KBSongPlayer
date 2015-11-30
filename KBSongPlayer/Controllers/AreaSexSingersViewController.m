//
//  AreaSexSingersViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/30.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "AreaSexSingersViewController.h"
#import "SongerClassifyViewModel.h"
#import "ABCViewController.h"
#import "SingeInfoCell.h"
#import <UIImageView+WebCache.h>
#import "SingerModel.h"
#import <MJRefresh.h>
@interface AreaSexSingersViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArr;


@end

@implementation AreaSexSingersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
-(void)initUI
{
    self.title=self.name;
    self.group=@"热门";
   
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.automaticallyAdjustsScrollViewInsets=NO;
    UIBarButtonItem *rightBar=[[UIBarButtonItem alloc] initWithTitle:@"A~Z" style: UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    self.navigationItem.rightBarButtonItem=rightBar;
    
    [self.tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"head"];
    [self.tableView registerNib:[UINib nibWithNibName:@"SingeInfoCell" bundle:nil] forCellReuseIdentifier:SingeInfoId];
  
    _viewModel=[[SongerClassifyViewModel alloc] init];
    __weak  typeof(self) weakSelf=self;
    [_viewModel setBlockWithReturnBlock:^(NSMutableArray * returnData){
        
        if (weakSelf.offset==0) {
            
            weakSelf.dataArr=returnData;
             [weakSelf.tableView.header endRefreshing];
            
        }else{
           [weakSelf.dataArr addObjectsFromArray:returnData];
            [weakSelf.tableView.footer endRefreshing];
        }
       
        [weakSelf.tableView reloadData];
    }withErrorBlock:^(id error){
           [weakSelf.tableView.header endRefreshing];
          [weakSelf.tableView.footer endRefreshing];
    }withFailureBlock:^(){
          [weakSelf.tableView.header endRefreshing];
          [weakSelf.tableView.footer endRefreshing];
    }];
  
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
         weakSelf.offset=0;
        [weakSelf getData];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^(){
        weakSelf.offset+=50;
         [weakSelf getData];
    }];

}
-(void)getData
{
    
    [_viewModel getSingersFromArea:self.area Sex:self.sex Group:self.group Offset:self.offset];
}
-(void)rightButtonClick
{
    ABCViewController *abc=[[ABCViewController alloc] init];
    abc.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    abc.view.backgroundColor=[UIColor clearColor];
    abc.vc=self;
    [self presentViewController:abc animated:YES completion:nil];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   UITableViewHeaderFooterView *view=[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"head"];
    view.backgroundView.backgroundColor=[UIColor whiteColor];
    view.textLabel.text=[NSString stringWithFormat:@"  %@",self.group];
    view.textLabel.font=[UIFont systemFontOfSize:22.0];
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SingeInfoCell *cell=[tableView dequeueReusableCellWithIdentifier:SingeInfoId];
    
    SingerModel *model=_dataArr[indexPath.row];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:model.avatar_small] placeholderImage:nil];
    cell.label.text=model.name;
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.navigationController.navigationBarHidden=NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden=YES;
    
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
