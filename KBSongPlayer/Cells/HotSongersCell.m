//
//  HotSongersCell.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/27.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "HotSongersCell.h"
#import "SingersView.h"
#import "SingerModel.h"
#import <UIImageView+WebCache.h>
#import "KBHeader.h"
@implementation HotSongersCell
{
    CGFloat Swidth;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(void)setDataArr:(NSMutableArray *)dataArr
{
    Swidth=Screen_Width-20;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.pagingEnabled=YES;
    _scrollView.delegate=self;
    _dataArr=dataArr;
    if (_dataArr.count==12) {
        for (int i=0; i<4; i++) {
            SingersView * vi=[[NSBundle mainBundle]loadNibNamed:@"SingersView" owner:nil options:nil ].lastObject;
            UITapGestureRecognizer *tap1=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgBeTap:)];
            UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgBeTap:)];
            UITapGestureRecognizer *tap3=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imgBeTap:)];
            [vi.img1 addGestureRecognizer:tap1];
            [vi.img2 addGestureRecognizer:tap2];
            [vi.img3 addGestureRecognizer:tap3];
            SingerModel *model0=_dataArr[i*i+0];
            SingerModel *model1=_dataArr[i*3+1];
            SingerModel *model2=_dataArr[i*3+2];
            vi.label1.text=model0.name;
            vi.label2.text=model1.name;
            vi.label3.text=model2.name;
            [vi.img1 sd_setImageWithURL:[NSURL URLWithString:model0.avatar_middle] placeholderImage:nil];
            [vi.img2 sd_setImageWithURL:[NSURL URLWithString:model1.avatar_middle] placeholderImage:nil];
            [vi.img3 sd_setImageWithURL:[NSURL URLWithString:model2.avatar_middle] placeholderImage:nil];
            vi.img1.tag=i*3+0;
            vi.img2.tag=i*3+1;
            vi.img3.tag=i*3+2;
            vi.frame=CGRectMake(Swidth*i, 0, Swidth, Swidth*13/30.0);
            [self.scrollView addSubview:vi];
        }
        self.scrollView.contentSize=CGSizeMake(Swidth*4, Swidth*13/30.0);
    }
    
    
}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(__unused UIInterfaceOrientation)interfaceOrientation
//{
//    self.carouselView.delegate=self;
//    self.carouselView.dataSource=self;
//    self.carouselView.type=iCarouselTypeLinear;
//    return YES;
//}
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//}
//
//-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
//{     SingersView *vi;
//    if (view==nil) {
//
//    }else{
//       vi=(SingersView *)view;
//    }
//    if (Ret) {
//        SingerModel *model0=_dataArr[index*3+0];
//        SingerModel *model1=_dataArr[index*3+1];
//        SingerModel *model2=_dataArr[index*3+2];
//        vi.label1.text=model0.name;
//        vi.label2.text=model1.name;
//        vi.label3.text=model2.name;
//        [vi.img1 sd_setImageWithURL:[NSURL URLWithString:model0.avatar_middle] placeholderImage:nil];
//        [vi.img2 sd_setImageWithURL:[NSURL URLWithString:model1.avatar_middle] placeholderImage:nil];
//        [vi.img3 sd_setImageWithURL:[NSURL URLWithString:model2.avatar_middle] placeholderImage:nil];
//        vi.img1.tag=index*3+0;
//        vi.img2.tag=index*3+1;
//        vi.img3.tag=index*3+2;
//    }
//     vi.frame=CGRectMake(0, 0, (Screen_Width-50), ((Screen_Width-50)*13/30.0));
//    return vi;
//}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.page.currentPage=scrollView.contentOffset.x/Swidth;
}
-(void)imgBeTap:(UITapGestureRecognizer *)tap
{
    NSLog(@"%ld",(long)tap.view.tag);
}
//-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
//{
//    return 4;
//}

@end
