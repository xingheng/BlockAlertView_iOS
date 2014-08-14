//
//  BlockAlertView.m
//  BlockAlertView_iOS
//
//  Created by Wei Han on 8/14/14.
//  Copyright (c) 2014 Wei Han. All rights reserved.
//

#import "BlockAlertView.h"



@implementation BlockAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.delegate = self;
    }
    return self;
}

- (void)show
{
    self.delegate = self;
    [super show];
}


#pragma mark - UIAlertViewDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clickButtonBlock != nil)
        self.clickButtonBlock(alertView, buttonIndex);
}

// Called when we cancel a view (eg. the user clicks the Home button). This is not called when the user clicks the cancel button.
// If not defined in the delegate, we simulate a click in the cancel button
- (void)alertViewCancel:(UIAlertView *)alertView
{
    if (self.cancelBlock != nil)
        self.cancelBlock(alertView);
}

- (void)willPresentAlertView:(UIAlertView *)alertView  // before animation and showing view
{
    if (self.willPresentBlock != nil)
        self.willPresentBlock(alertView);
}

- (void)didPresentAlertView:(UIAlertView *)alertView  // after animation
{
    if (self.didPresentBlock != nil)
        self.didPresentBlock(alertView);
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex // before animation and hiding view
{
    if (self.willDismissBlock != nil)
        self.willDismissBlock(alertView, buttonIndex);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex  // after animation
{
    if (self.didDismissBlock != nil)
        self.didDismissBlock(alertView, buttonIndex);
}

// Called after edits in any of the default fields added by the style
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    if (self.ShouldEnableFirstOtherButtonBlock != nil)
        return self.ShouldEnableFirstOtherButtonBlock(alertView);
    else
    {
        switch ([super alertViewStyle]) {
            case UIAlertViewStyleDefault:
            case UIAlertViewStylePlainTextInput:
                return YES;
            case UIAlertViewStyleSecureTextInput:
            {
                NSString *text = [[super textFieldAtIndex:0] text];
                if ([text isEqualToString:@""])
                    return NO;
                else
                    return YES;
            }
            case UIAlertViewStyleLoginAndPasswordInput:
            {
                NSString *text = [[super textFieldAtIndex:0] text];
                NSString *text2 = [[super textFieldAtIndex:1] text];
                if ([text isEqualToString:@""] || [text2 isEqualToString:@""])
                    return NO;
                else
                    return YES;
            }
        }
    }
}

@end
