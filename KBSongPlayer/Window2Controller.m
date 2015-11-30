//
//  Window2Controller.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/13.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "Window2Controller.h"
#import "AppDelegate.h"
#import "PlayerViewController.h"
#define self_Width self.view.bounds.size.width
#define self_Height self.view.bounds.size.height
#define kRotationAnimation @"RotationAnimation"
#define DefaultColor   [UIColor colorWithRed:29/256.0 green:182/256.0 blue:249/256.0 alpha:1]
@implementation Window2Controller
{
    CAShapeLayer *_shapeLayer;
    UIImageView *_backgroundView;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.clipsToBounds=YES;
    self.view.layer.cornerRadius=30;
    self.view.layer.masksToBounds=YES;
    //[self.view setBackgroundColor:[UIColor whiteColor]];
    
    _backgroundView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    
    [self.view addSubview:_backgroundView];
    _backgroundView.backgroundColor=DefaultColor;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self viewBeTap];
    self.isPlaying=!_isPlaying;
}

-(void)setIsPlaying:(BOOL)isPlaying
{
    _isPlaying=isPlaying;
    if (isPlaying) {
          [self animateWave];
    }else{
        [_shapeLayer removeFromSuperlayer];
        [_backgroundView.layer removeAllAnimations];
    }
}
-(void)viewBeTap
{
    if (_isPlaying) {
        PlayerViewController *playervc=[[PlayerViewController alloc] init];
        AppDelegate *app=[UIApplication sharedApplication].delegate;
        [app.rootNV presentViewController:playervc animated:YES completion:nil];
    }else{
      
    }
}
-(void)animateWave
{
    UIBezierPath* path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:_backgroundView.center radius:(self_Width/2 - 10) startAngle:0 endAngle:M_PI_2*2 clockwise:YES];
    _shapeLayer = [[CAShapeLayer alloc] init];
    _shapeLayer.lineWidth = 2 ;
    _shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.frame = CGRectMake(0, 0, self_Width, self_Width);
    _shapeLayer.path = path.CGPath;
    [_backgroundView.layer addSublayer:_shapeLayer];
    
    
    CABasicAnimation* baseAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    baseAnimation.duration = 0.5;
    baseAnimation.fromValue = @(0);
    baseAnimation.toValue = @(2 * M_PI);
    baseAnimation.repeatCount = MAXFLOAT;
    [_backgroundView.layer addAnimation:baseAnimation forKey:kRotationAnimation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
