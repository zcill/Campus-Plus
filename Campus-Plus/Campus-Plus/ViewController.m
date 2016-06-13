//
//  ViewController.m
//  Campus-Plus
//
//  Created by zlk_meitu on 16/6/13.
//  Copyright © 2016年 zcill. All rights reserved.
//

#import "ViewController.h"
#import <SCLAlertView-Objective-C/SCLAlertView.h>


@interface ViewController ()

@end

@implementation ViewController

- (IBAction)onClick:(UIButton *)sender {
    
    SCLAlertView *alert = [[SCLAlertView alloc] init];
    
    //Using Selector
    [alert addButton:@"First Button" target:self selector:@selector(firstButton)];
    
    //Using Block
    [alert addButton:@"Second Button" actionBlock:^(void) {
        NSLog(@"Second button tapped");
    }];
    
    //Using Blocks With Validation
    [alert addButton:@"Validate" validationBlock:^BOOL {
        BOOL passedValidation = YES;
        return passedValidation;
        
    } actionBlock:^{
        // handle successful validation here
    }];
    
    [alert showSuccess:self title:@"Button View" subTitle:@"This alert view has buttons" closeButtonTitle:@"Done" duration:0.0f];
    
}

- (void)firstButton {
    
    NSLog(@"firstButton");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
