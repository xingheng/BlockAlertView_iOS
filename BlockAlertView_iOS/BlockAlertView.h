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

@interface BlockAlertView : UIAlertView

@property (copy, nonatomic) BlockAlertViewIndexDelegate clickButtonBlock;

@property (copy, nonatomic) BlockAlertViewDelegate cancelBlock;
@property (copy, nonatomic) BlockAlertViewDelegate willPresentBlock;
@property (copy, nonatomic) BlockAlertViewDelegate didPresentBlock;

@property (copy, nonatomic) BlockAlertViewIndexDelegate willDismissBlock;
@property (copy, nonatomic) BlockAlertViewIndexDelegate didDismissBlock;

@property (copy, nonatomic) BOOL (^ShouldEnableFirstOtherButtonBlock)(UIAlertView *alertView);


- (void)setPlainText:(NSString *)strValue;

@end
