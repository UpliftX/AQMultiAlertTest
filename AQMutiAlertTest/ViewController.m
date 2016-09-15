//
//  ViewController.m
//  AQMutiAlertTest
//
//  Created by Gupta, Mrigank on 16/06/16.
//  Copyright © 2016 Gupta, Mrigank. All rights reserved.
//

#import "ViewController.h"
#import <AQMultiAlertFramework/AQMultiAlertFramework.h>

@interface ViewController ()

@end

@implementation ViewController

static int alertNumber = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(showAlert)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)showAlert {
    UIAlertController *alertController = [self createAlertControllerWithTitle:[NSString stringWithFormat:@"Alert %d", alertNumber++]
                                                                                message:@"Test message"
                                                                         preferredStyle:UIAlertControllerStyleAlert];
    [[AQAlertQueue sharedAlertQueue] showAlert:alertController animated:YES completion:nil onViewController:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIAlertController *)createAlertControllerWithTitle:(NSString *)title
                                              message:(NSString *)message
                                       preferredStyle:(UIAlertControllerStyle)preferredStyle {
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:title
                                          message:message
                                          preferredStyle:preferredStyle];
    
    AQAlertAction *okAction = [AQAlertAction
                               actionWithTitleForQueued:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   // add action code here
                               }];
    
    [alertController addAction:okAction];
    return alertController;
}

@end
