//
//  SingerViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/27.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "SingerViewController.h"
#import "PublicClass.h"
#import "SongerClassifyViewModel.h"
#import "HotSongersCell.h"
#import "AreaSexSingersViewController.h"
@interface SingerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSMutableArray *dataArr;
@property (nonatomic,copy)NSMutableArray *hotArr;
@property (nonatomic,retain)SongerClassifyViewModel *viewModel;
@end

@implementation SingerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    _dataArr=[PublicClass getSongerClassification];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"classify"];
    [self.tableView registerNib:[UINib nibWithNibName:@"HotSongersCell" bundle:nil] forCellReuseIdentifier:HotSingerCellId];
    [self initdata];
}
-(void)initdata
{
    _viewModel=[[SongerClassifyViewModel alloc] init];
   __weak  typeof(self) weakSelf=self;
    [_viewModel setBlockWithReturnBlock:^(id returnData){
        weakSelf.hotArr=returnData;
        [weakSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }withErrorBlock:^(id error){
        
    }withFailureBlock:^(){
        
    }];
    [_viewModel getHotSingersInfo];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0||section==5) {
        return 1;
    }else{
        return 3;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section==0) {
        if (self.hotArr) {
            HotSongersCell *cell=[tableView dequeueReusableCellWithIdentifier:HotSingerCellId];
            cell.dataArr=self.hotArr;
               return cell;
        }else{
            UITableViewCell *cell=[[UITableViewCell alloc] init];
            return cell;
        }
       
     
    }else{
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"classify"];
        cell.textLabel.text=_dataArr[indexPath.section-1][indexPath.row][@"name"];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (self.hotArr) {
            return ((Screen_Width-50)*13/30.0+90);
        }else{
            return 0;
        }
    }else{
    return 44;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return;
    }
    AreaSexSingersViewController *vc=[[AreaSexSingersViewController alloc] init];
    vc.name=_dataArr[indexPath.section-1][indexPath.row][@"name"];
    vc.area=_dataArr[indexPath.section-1][indexPath.row][@"area"];
    vc.sex=_dataArr[indexPath.section-1][indexPath.row][@"sex"];
    [self.navigationController pushViewController:vc animated:YES];
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
