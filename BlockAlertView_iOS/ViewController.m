//
//  ViewController.m
//  BlockAlertView_iOS
//
//  Created by Wei Han on 8/14/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "ViewController.h"
#import "BlockAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *entryBtn =  [UIButton buttonWithType:UIButtonTypeSystem];
    [entryBtn setFrame:CGRectMake(50, 150, 200, 50)];
    [entryBtn setTitle:@"Click me" forState:UIControlStateNormal];
    [entryBtn addTarget:self action:@selector(entryButtonTouched) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:entryBtn];
}

- (void)entryButtonTouched
{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
//    [alert show];
    
    BlockAlertView *bAlert = [[BlockAlertView alloc] initWithTitle:@"Title" message:@"Message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    bAlert.cancelBlock = ^(UIAlertView *alertView) {
        NSLog(@"cancelBlock: %@", alertView);
    };
    
    bAlert.clickButtonBlock = ^(UIAlertView *alertView, NSInteger buttonIndex) {
        NSLog(@"clickButtonBlock: %@, index: %d", alertView, buttonIndex);
    };
    
    bAlert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    
    [bAlert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
