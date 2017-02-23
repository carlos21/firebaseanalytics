//
//  ViewController.m
//  FirebaseSample
//
//  Created by Carlos Duclos on 2/23/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

#import "ViewController.h"
@import Firebase;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)krakenButtonPressed:(UIButton *)sender {
    [FIRAnalytics logEventWithName:@"press_button" parameters:nil];
}
    
- (IBAction)switchWasFlipped:(UISwitch *)sender {
    [FIRAnalytics logEventWithName:@"flip_switch" parameters:nil];
}

- (IBAction)sliderWasChanged:(UISlider *)sender {
    [FIRAnalytics logEventWithName:@"adjust_slider" parameters:@{@"newValue": @(sender.value)}];
}

@end
