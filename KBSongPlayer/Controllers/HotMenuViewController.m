//
//  HotMenuViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/26.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "HotMenuViewController.h"
#import "HotMenuCell.h"
#import "HotMenuViewModel.h"
@interface HotMenuViewController ()

@end

@implementation HotMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self.collectionView.collectionViewLayout=layout;
    [self initData];
    
}
-(void)initData
{
    [_collectionView registerNib:[UINib nibWithNibName:@"HotMenuCell" bundle:nil] forCellWithReuseIdentifier:HotMenuCellId];
    [self getdata];
}
-(void)getdata
{
    HotMenuViewModel *viewModel=[[HotMenuViewModel alloc] init];
    __weak typeof(self) weakSelf=self;
    [viewModel setBlockWithReturnBlock:^(id returnArr){
        weakSelf.dataArr=returnArr;
        [weakSelf.collectionView reloadData ];
    }withErrorBlock:^(id error){
        
    }withFailureBlock:^(){
        
    }];
    [viewModel getHotMenu];
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
    HotMenuCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:HotMenuCellId forIndexPath:indexPath];
    cell.model=_dataArr[indexPath.row];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 22.5, 15, 22.5);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(nonnull UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return CGSizeMake((Screen_Width-60)/2.0, (Screen_Width-60)/2.0+80);
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
