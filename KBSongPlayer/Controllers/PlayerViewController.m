//
//  PlayerViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/29.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "PlayerViewController.h"
#import "AppDelegate.h"
@interface PlayerViewController ()
//@property(nonatomic,retain)PlayCenterViewModel *viewModel;
@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)backButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^(){
       
    }];
   
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
