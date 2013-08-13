//
//  MainViewController.m
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 12-05-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import "MainViewController.h"

#define IOS6_IPHONE_OUTPUT_X                    50
#define IOS6_IPHONE_OUTPUT_Y                    26
#define IOS6_IPHONE_OUTPUT_MAX_WIDTH            78
#define IOS6_IPHONE_OUTPUT_HEIGHT               16
#define IOS6_IPHONE_OUTPUT_FONT                 [NSFont fontWithName:@"Helvetica Neue Bold" size:11]

#define IOS6_IPAD_OUTPUT_X                      170
#define IOS6_IPAD_OUTPUT_Y                      26
#define IOS6_IPAD_OUTPUT_MAX_WIDTH              88
#define IOS6_IPAD_OUTPUT_HEIGHT                 18
#define IOS6_IPAD_OUTPUT_FONT                   [NSFont fontWithName:@"Helvetica Neue Bold" size:11.8]


@implementation MainViewController

- (void)controlTextDidChange:(NSNotification *)obj
{
    //NSLog(@"%ld",(unsigned long)[textField.stringValue length]);
    
    if ([textField.stringValue length] > 256) {
        return;
    }
    
    textLabelIphone.stringValue = textField.stringValue;
    
    [textLabelIphone sizeToFit];
    if (textLabelIphone.frame.size.width < IOS6_IPHONE_OUTPUT_MAX_WIDTH) {
        
        textLabelIphone.frame = CGRectMake(IOS6_IPHONE_OUTPUT_X-textLabelIphone.frame.size.width/2,
                                           IOS6_IPHONE_OUTPUT_Y,
                                           textLabelIphone.frame.size.width,
                                           16);
    } else {
        textLabelIphone.frame = CGRectMake(IOS6_IPHONE_OUTPUT_X-IOS6_IPHONE_OUTPUT_MAX_WIDTH/2,
                                           IOS6_IPHONE_OUTPUT_Y,
                                           IOS6_IPHONE_OUTPUT_MAX_WIDTH,
                                           16);
    }
    
    textLabelIpad.stringValue = textField.stringValue;
    [textLabelIpad sizeToFit];
    if (textLabelIpad.frame.size.width < IOS6_IPAD_OUTPUT_MAX_WIDTH) {
        textLabelIpad.frame = CGRectMake(IOS6_IPAD_OUTPUT_X-textLabelIpad.frame.size.width/2,
                                         IOS6_IPAD_OUTPUT_Y,
                                         textLabelIpad.frame.size.width,
                                         18);
    } else {
        textLabelIpad.frame = CGRectMake(IOS6_IPAD_OUTPUT_X-IOS6_IPAD_OUTPUT_MAX_WIDTH/2,
                                         IOS6_IPAD_OUTPUT_Y,
                                         IOS6_IPAD_OUTPUT_MAX_WIDTH,
                                         18);
    }
}


- (void)awakeFromNib
{
    [self configureInputTextField];
    
    [self configureiOS6iPhoneOutputTextField];
    
    [self configureiOS6iPadOutputTextField];
}

- (void)loadView
{
    
}

- (void)configureInputTextField
{
    if (textField) {
        textField.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_INPUT_TEXT_FIELD", @"");
    }
}

- (void)configureiOS6iPhoneOutputTextField
{
    //Current config paramenters
    //Label width = 78
    //Label height = 16
    //Font = Helvetica Neue Bold 11
    
    if (textLabelIphone) {
        
        textLabelIphone.frame = CGRectMake(IOS6_IPHONE_OUTPUT_X-IOS6_IPHONE_OUTPUT_MAX_WIDTH/2,
                                           IOS6_IPHONE_OUTPUT_Y, 0, 16);
        [[textLabelIphone cell] setAlignment:NSJustifiedTextAlignment];
        textLabelIphone.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_IOS56_IPHONE_OUTPUT", @"");
    }
}

- (void)configureiOS6iPadOutputTextField
{
    //Current config paramenters
    //Label width = 88
    //Label height = 18
    //Font = Helvetica Neue Bold 11.8
    
    if (textLabelIpad) {
        textLabelIpad.frame = CGRectMake(IOS6_IPAD_OUTPUT_X-IOS6_IPAD_OUTPUT_MAX_WIDTH/2,
                                         IOS6_IPAD_OUTPUT_Y, 0, 18);
        [[textLabelIpad cell] setAlignment:NSJustifiedTextAlignment];
        textLabelIpad.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_IOS56_IPAD_OUTPUT", @"");
    }
}

- (void)sendFeedbackAction:(id)sender
{
    NSString *subject = NSLocalizedString(@"APP_NAMER_FEEDBACK_SUBJECT",@"");
    NSString *to = NSLocalizedString(@"APP_NAMER_FEEDBACK_ADDRESS",@"");
    NSString *body = @"";
    
    NSString *encodedSubject = [NSString stringWithFormat:@"SUBJECT=%@", [subject stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSString *encodedBody = [NSString stringWithFormat:@"BODY=%@", [body stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSString *encodedTo = [to stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedURLString = [NSString stringWithFormat:@"mailto:%@?%@&%@", encodedTo, encodedSubject, encodedBody];
    NSURL *mailtoURL = [NSURL URLWithString:encodedURLString];
    [[NSWorkspace sharedWorkspace] openURL:mailtoURL];
}

@end
