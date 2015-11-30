//
//  WeatherView.m
//  KBSongPlayer
//
//  Created by 韩金波 on 15/10/16.
//  Copyright © 2015年 Psylife. All rights reserved.
//

#import "WeatherView.h"
#import "HomePageViewModel.h"
@implementation WeatherView
{
    
    __weak IBOutlet UIImageView *imageview;
    __weak IBOutlet UIButton *searchButton;
    __weak IBOutlet UITextField *workInput;
    
    __weak IBOutlet UILabel *dayLB;
    __weak IBOutlet UILabel *cityLB;
    __weak IBOutlet UILabel *tempLB;
    __weak IBOutlet UILabel *weatherLB;
    __weak IBOutlet UILabel *whatdayLB;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self startLocalization];
    }
    return self;
}

-(void)startLocalization
{
    self.locationManager=[[CLLocationManager alloc] init];
    self.locationManager.delegate=self;
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    if (System_Version>8.0) {
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

#pragma mark - 定位代理方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *loc = [locations objectAtIndex:0];
    
    // NSLog(@"经纬度  %f  %f ",loc.coordinate.latitude,loc.coordinate.longitude);
    CLGeocoder * geocoder = [[CLGeocoder alloc] init];
    // 经纬度对象
    
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        // 回调中返回当前位置的地理位置信息
        // 描述地名的类
        CLPlacemark * placemark = placemarks[0];
        // NSLog(@">>%@ ,%@",placemark.name,placemark.subLocality);
        [self updateWeatherInfo:placemark.subLocality];
    }];
}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
   [self updateWeatherInfo:@"上海市"];
}
-(void)updateWeatherInfo:(NSString *)cityName
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    [self weekDayStr:currentDateStr];
    cityLB.text=cityName;
    HomePageViewModel *viewModel=[[HomePageViewModel alloc] init];
    
    
    
    [viewModel setBlockWithReturnBlock:^(id dict){
        NSString *str1=[[dict objectForKey:@"retData"] objectForKey:@"h_tmp"];
        NSString *str2=[[dict objectForKey:@"retData"] objectForKey:@"l_tmp"];
        tempLB.text=[NSString stringWithFormat:@"%@~%@℃",str2,str1];
        weatherLB.text=[[dict objectForKey:@"retData"] objectForKey:@"weather"];
    }withErrorBlock:^(id error){
        
    }withFailureBlock:^{
        
    }];
    [viewModel getWeatherInfo:cityName];
    
   
}
- (void)weekDayStr:(NSString *)format
{
    NSString *weekDayStr = nil;
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    NSString *str = format;
    if (str.length >= 10) {
        
        NSString *nowString = [str substringToIndex:10];
        NSArray *array = [nowString componentsSeparatedByString:@"-"];
        
        if (array.count == 0) {
            array = [nowString componentsSeparatedByString:@"/"];
        }
        
        if (array.count >= 3) {
            NSInteger year = [[array objectAtIndex:0] integerValue];
            NSInteger month = [[array objectAtIndex:1] integerValue];
            NSInteger day = [[array objectAtIndex:2] integerValue];
            
            dayLB.text=[NSString stringWithFormat:@"%ld",(long)day];
            [comps setYear:year];
            [comps setMonth:month];
            [comps setDay:day];
        }
    }
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *_date = [gregorian dateFromComponents:comps];
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:_date];
    NSInteger week = [weekdayComponents weekday];
    
    switch (week) {
        case 1:
            weekDayStr = @"星期日";
            break;
        case 2:
            weekDayStr = @"星期一";
            break;
        case 3:
            weekDayStr = @"星期二";
            break;
        case 4:
            weekDayStr = @"星期三";
            break;
        case 5:
            weekDayStr = @"星期四";
            break;
        case 6:
            weekDayStr = @"星期五";
            break;
        case 7:
            weekDayStr = @"星期六";
            break;
        default:  
            weekDayStr = @"";  
            break;  
    }
    whatdayLB.text=weekDayStr;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    imageview.layer.masksToBounds=YES;
    imageview.clipsToBounds=YES;
}
- (IBAction)MenuButtonBeClickAction:(UIButton *)sender {
    [self.delegate MenuButtonBeClicked:sender.tag];
}
- (IBAction)searchButtonBeclicked:(id)sender {
    
}

@end
