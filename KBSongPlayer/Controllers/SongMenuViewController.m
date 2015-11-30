//
//  SongMenuViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "SongMenuViewController.h"
#import "SongMenuVIewModel.h"
#import <MJRefresh.h>
#import "SongMenuCell.h"
#import "KBHeader.h"
@interface SongMenuViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,retain)SongMenuVIewModel *viewModel;
@property(nonatomic,copy)NSMutableArray *dataArr;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,assign)NSInteger currentPage;
@end

@implementation SongMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    //self.view.backgroundColor=[UIColor redColor];
}
-(void)initData
{
    _viewModel=[[SongMenuVIewModel alloc] init];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    self.currentPage=1;
    __weak typeof(self)  weakSelf= self;
    [_viewModel setBlockWithReturnBlock:^(id returnData){
        if (weakSelf.currentPage==1) {
            weakSelf.dataArr=returnData;
            
        }else{
            [weakSelf.dataArr addObjectsFromArray:returnData];
        }
        [weakSelf.collectionView reloadData];
    }withErrorBlock:^(id errorCode){
        
    }withFailureBlock:^(){
        
    }];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    
    self.collectionView.collectionViewLayout=layout;
    [_collectionView registerNib:[UINib nibWithNibName:@"SongMenuCell" bundle:nil] forCellWithReuseIdentifier:SongMenuCellId];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionElementKindSectionHeader"];

    [self getdata];
  
    
}
-(void)getdata
{
    [_viewModel getSongMenuData:_currentPage type:_type];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SongMenuCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:SongMenuCellId forIndexPath:indexPath];
    cell.model=_dataArr[indexPath.row];
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionElementKindSectionHeader" forIndexPath:indexPath];
        reusableview.backgroundColor=[UIColor grayColor];
        reusableview = headerView;
    }
    return reusableview;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 22.5, 12, 22.5);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{;
    return CGSizeMake((Screen_Width-60)/2.0, (Screen_Width-60)/2.0*20.0/16.0);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(Screen_Width, 8);
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
