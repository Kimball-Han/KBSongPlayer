//
//  PlayerViewController.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/29.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "PlayerViewController.h"
#import "AppDelegate.h"
#import "KBPlayer.h"
@interface PlayerViewController ()
//@property(nonatomic,retain)PlayCenterViewModel *viewModel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layout1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layout2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layout3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layout4;
@property (weak, nonatomic) IBOutlet UIButton *playAndPauseButton;
@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}
-(void)updateViewConstraints
{
    CGFloat layout=([UIScreen mainScreen].bounds.size.width-(3*49+2*44+2*8))/4.0;
    self.layout1.constant=layout;
    self.layout2.constant=layout;
    self.layout3.constant=layout;
    self.layout4.constant=layout;
     [super updateViewConstraints];
    
}
- (IBAction)backButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^(){
       
    }];
   
}
- (IBAction)playAndPauseButtonClick:(UIButton *)sender {
 
    if ([KBPlayer manager].songArr.count==0) {
        return;
    }
       sender.selected=!sender.selected;
    if (sender.selected) {
        [[KBPlayer manager] play];
    }else{
        [[KBPlayer manager] pause];
    }
    [self updatePlaybutton];
}
-(void)updatePlaybutton
{
    NSString *imageName= self.playAndPauseButton.selected ? @"cm2_fm_btn_pause_prs":@"cm2_fm_btn_play_prs";
    [self.playAndPauseButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
}
- (IBAction)nextButtonClick:(id)sender {
    if ([KBPlayer manager].songArr.count==0) {
        return;
    }
    [[KBPlayer manager] playNextSong];
}
- (IBAction)previous:(id)sender {
    if ([KBPlayer manager].songArr.count==0) {
        return;
    }
    [[KBPlayer manager] playPreviousSong];
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
