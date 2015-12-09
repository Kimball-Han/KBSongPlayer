//
//  ABCViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/11/30.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "ABCViewController.h"
#import "KBHeader.h"
@interface ABCViewController ()

@end

@implementation ABCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
-(void)initUI
{
    
    UIView *backView=[[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height-360, Screen_Width, 360)];
    [self.view addSubview:backView];
    
    backView.backgroundColor=[UIColor whiteColor];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    [arr addObject:@"热门"];
    for (int i=0; i<26; i++) {
        [arr addObject:[NSString
                        stringWithFormat:@"%c",('A'+i)]];
        
    }
    self.view.backgroundColor=[UIColor grayColor];
    
  
    [arr addObject:@"其他"];
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 39)];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=@"歌手首字母";
    [backView addSubview:label];
    for (int i=0; i<arr.count; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame=CGRectMake((i%4)*Screen_Width/4.0, 40+(i/4)*40, Screen_Width/4.0, 39);
        [button setTitle:arr[i] forState:UIControlStateNormal];
        [backView addSubview: button];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=10+i;
    }
    UIButton*but=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but.frame=CGRectMake(0, 320, Screen_Width, 40);
    but.tag=8;
    [but setTitle:@"关闭" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:but];
    
    
    
}
-(void)click:(UIButton *)button
{
    NSString *code=[button titleForState:UIControlStateNormal];
    if (![code isEqualToString:@"关闭"]) {
        self.vc.group=code;
    }
    self.vc.offset=0;
    [self.vc getData];
    UIView *balckView=[self.vc.navigationController.view viewWithTag:1000 ];
    [balckView removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:^{
       
    }];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
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
