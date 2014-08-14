//
//  BlockAlertView.h
//  BlockAlertView_iOS
//
//  Created by Wei Han on 8/14/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^BlockAlertViewDelegate)(UIAlertView *alertView);
typedef void (^BlockAlertViewIndexDelegate)(UIAlertView *alertView, NSInteger buttonIndex);
typedef BOOL (^BlockAlertViewSwitcherDelegate)(UIAlertView *alertView);

@interface BlockAlertView : UIAlertView

@property (assign, nonatomic) BlockAlertViewIndexDelegate clickButtonBlock;

@property (assign, nonatomic) BlockAlertViewDelegate cancelBlock;
@property (assign, nonatomic) BlockAlertViewDelegate willPresentBlock;
@property (assign, nonatomic) BlockAlertViewDelegate didPresentBlock;

@property (assign, nonatomic) BlockAlertViewIndexDelegate willDismissBlock;
@property (assign, nonatomic) BlockAlertViewIndexDelegate didDismissBlock;

@property (assign, nonatomic) BlockAlertViewSwitcherDelegate ShouldEnableFirstOtherButtonBlock;

@end
