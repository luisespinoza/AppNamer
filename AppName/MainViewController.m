//
//  MainViewController.m
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 12-05-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import "MainViewController.h"


#define IOS6_IPHONE_OUTPUT_MAX_WIDTH            78
#define IOS6_IPHONE_OUTPUT_HEIGHT               16
#define IOS6_IPHONE_OUTPUT_X                    (42+IOS6_IPHONE_OUTPUT_MAX_WIDTH/2)
#define IOS6_IPHONE_OUTPUT_Y                    15
#define IOS6_IPHONE_OUTPUT_FONT                 [NSFont fontWithName:@"Helvetica Neue Bold" size:11]

#define IOS6_IPAD_OUTPUT_MAX_WIDTH              88
#define IOS6_IPAD_OUTPUT_HEIGHT                 18
#define IOS6_IPAD_OUTPUT_X                      (200+IOS6_IPAD_OUTPUT_MAX_WIDTH/2)
#define IOS6_IPAD_OUTPUT_Y                      14
#define IOS6_IPAD_OUTPUT_FONT                   [NSFont fontWithName:@"Helvetica Neue Bold" size:11.8]

//Version 1.2 new defines
#define ROW_LIGHT_COLOR                         [NSColor colorWithCalibratedRed:233/255. green:233/255. blue:233/255. alpha:1.0]
#define ROW_DARK_COLOR                          [NSColor colorWithCalibratedRed:223/255. green:223/255. blue:223/255. alpha:1.0]
#define ROW_BORDER_COLOR                        [NSColor colorWithCalibratedRed:206/255. green:206/255. blue:206/255. alpha:1.0]

#define IOS7_IPHONE_OUTPUT_MAX_WIDTH            75
#define IOS7_IPHONE_OUTPUT_HEIGHT               18
#define IOS7_IPHONE_OUTPUT_X                    (42+IOS7_IPHONE_OUTPUT_MAX_WIDTH/2)
#define IOS7_IPHONE_OUTPUT_Y                    14
#define IOS7_IPHONE_OUTPUT_FONT                 [NSFont fontWithName:@"Helvetica Neue Regular" size:12]

#define IOS7_IPAD_OUTPUT_MAX_WIDTH              88
#define IOS7_IPAD_OUTPUT_HEIGHT                 18
#define IOS7_IPAD_OUTPUT_X                      (200+IOS7_IPAD_OUTPUT_MAX_WIDTH/2)
#define IOS7_IPAD_OUTPUT_Y                      16
#define IOS7_IPAD_OUTPUT_FONT                   [NSFont fontWithName:@"Helvetica Neue" size:12.5]

@implementation MainViewController

#pragma mark - Initial set up0
//- (void)loadView
//{
//    
//}

- (void)awakeFromNib
{
    [self configureInputTextField];
    
    [self configureBoxes];
    
    [self configureiOS6iPhoneOutputTextField];
    
    [self configureiOS6iPadOutputTextField];
    
    [self configureiOS7iPhoneOutputTextField];
    
    [self configureiOS7iPadOutputTextField];
    
    
    [self.view setNeedsDisplay:YES];
}

#pragma mark - iOS6 configurations
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

#pragma mark - iOS7 configurations
- (void)configureiOS7iPhoneOutputTextField
{
    //Current config paramenters
    //Label width = 78
    //Label height = 16
    //Font = Helvetica Neue Bold 11
    
    if (textLabelIphoneIOS7) {
        textLabelIphoneIOS7.frame = CGRectMake(IOS7_IPHONE_OUTPUT_X-IOS7_IPHONE_OUTPUT_MAX_WIDTH/2,
                                               IOS7_IPHONE_OUTPUT_Y, 0, IOS7_IPHONE_OUTPUT_HEIGHT);
        [[textLabelIphoneIOS7 cell] setAlignment:NSJustifiedTextAlignment];
        textLabelIphoneIOS7.font = IOS7_IPHONE_OUTPUT_FONT;
        textLabelIphoneIOS7.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_IOS7_IPHONE_OUTPUT", @"");
    }
}

- (void)configureiOS7iPadOutputTextField
{
    //Current config paramenters
    //Label width = 88
    //Label height = 18
    //Font = Helvetica Neue Bold 11.8
    
    if (textLabelIpadIOS7) {
        textLabelIpadIOS7.frame = CGRectMake(IOS7_IPAD_OUTPUT_X-IOS7_IPAD_OUTPUT_MAX_WIDTH/2,
                                             IOS7_IPAD_OUTPUT_Y, 0, IOS7_IPAD_OUTPUT_HEIGHT);
        [[textLabelIpadIOS7 cell] setAlignment:NSJustifiedTextAlignment];
        textLabelIpadIOS7.font = IOS7_IPAD_OUTPUT_FONT;
        textLabelIpadIOS7.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_IOS7_IPAD_OUTPUT", @"");
    }
}

#pragma mark - Global configurations
- (void)configureInputTextField
{
    if (textField) {
        textField.toolTip = NSLocalizedString(@"APP_NAMER_HELP_TAG_INPUT_TEXT_FIELD", @"");
    }
}

- (void)configureBoxes
{
    boxIOS6.borderColor = ROW_BORDER_COLOR;
    boxIOS6.fillColor = ROW_DARK_COLOR;
    boxIOS6.titlePosition = NSBelowTop;
    boxIOS6.needsDisplay = YES;
    
    boxIOS7.borderColor = ROW_BORDER_COLOR;
    boxIOS7.fillColor = ROW_LIGHT_COLOR;
    boxIOS7.titlePosition = NSBelowTop;
    boxIOS7.needsDisplay = YES;
}


#pragma mark -  Events and actions

- (void)controlTextDidChange:(NSNotification *)obj
{
    //NSLog(@"%ld",(unsigned long)[textField.stringValue length]);
    
    if ([textField.stringValue length] > 256) {
        return;
    }
    
    //iPhone iOS 6
    textLabelIphone.stringValue = textField.stringValue;
    
    [textLabelIphone sizeToFit];
    if (textLabelIphone.frame.size.width < IOS6_IPHONE_OUTPUT_MAX_WIDTH) {
        
        textLabelIphone.frame = CGRectMake(IOS6_IPHONE_OUTPUT_X-textLabelIphone.frame.size.width/2,
                                           IOS6_IPHONE_OUTPUT_Y,
                                           textLabelIphone.frame.size.width,
                                           IOS6_IPHONE_OUTPUT_HEIGHT);
    } else {
        textLabelIphone.frame = CGRectMake(IOS6_IPHONE_OUTPUT_X-IOS6_IPHONE_OUTPUT_MAX_WIDTH/2,
                                           IOS6_IPHONE_OUTPUT_Y,
                                           IOS6_IPHONE_OUTPUT_MAX_WIDTH,
                                           IOS6_IPHONE_OUTPUT_HEIGHT);
    }
    
    //iPad iOS 6
    textLabelIpad.stringValue = textField.stringValue;
    [textLabelIpad sizeToFit];
    if (textLabelIpad.frame.size.width < IOS6_IPAD_OUTPUT_MAX_WIDTH) {
        textLabelIpad.frame = CGRectMake(IOS6_IPAD_OUTPUT_X-textLabelIpad.frame.size.width/2,
                                         IOS6_IPAD_OUTPUT_Y,
                                         textLabelIpad.frame.size.width,
                                         IOS6_IPAD_OUTPUT_HEIGHT);
    } else {
        textLabelIpad.frame = CGRectMake(IOS6_IPAD_OUTPUT_X-IOS6_IPAD_OUTPUT_MAX_WIDTH/2,
                                         IOS6_IPAD_OUTPUT_Y,
                                         IOS6_IPAD_OUTPUT_MAX_WIDTH,
                                         IOS6_IPAD_OUTPUT_HEIGHT);
    }
    
    //iPhone iOS 7
    textLabelIphoneIOS7.stringValue = textField.stringValue;
    [textLabelIphoneIOS7 sizeToFit];
    if (textLabelIphoneIOS7.frame.size.width < IOS7_IPHONE_OUTPUT_MAX_WIDTH) {
        
        textLabelIphoneIOS7.frame = CGRectMake(IOS7_IPHONE_OUTPUT_X-textLabelIphoneIOS7.frame.size.width/2,
                                               IOS7_IPHONE_OUTPUT_Y,
                                               textLabelIphoneIOS7.frame.size.width,
                                               IOS7_IPHONE_OUTPUT_HEIGHT);
    } else {
        textLabelIphoneIOS7.frame = CGRectMake(IOS7_IPHONE_OUTPUT_X-IOS7_IPHONE_OUTPUT_MAX_WIDTH/2,
                                               IOS7_IPHONE_OUTPUT_Y,
                                               IOS7_IPHONE_OUTPUT_MAX_WIDTH,
                                               IOS7_IPHONE_OUTPUT_HEIGHT);
    }
    
    //iPad iOS 7
    textLabelIpadIOS7.stringValue = textField.stringValue;
    [textLabelIpadIOS7 sizeToFit];
    if (textLabelIpadIOS7.frame.size.width < IOS7_IPAD_OUTPUT_MAX_WIDTH) {
        textLabelIpadIOS7.frame = CGRectMake(IOS7_IPAD_OUTPUT_X-textLabelIpadIOS7.frame.size.width/2,
                                             IOS7_IPAD_OUTPUT_Y,
                                             textLabelIpadIOS7.frame.size.width,
                                             IOS7_IPAD_OUTPUT_HEIGHT);
    } else {
        textLabelIpadIOS7.frame = CGRectMake(IOS7_IPAD_OUTPUT_X-IOS7_IPAD_OUTPUT_MAX_WIDTH/2,
                                             IOS7_IPAD_OUTPUT_Y,
                                             IOS7_IPAD_OUTPUT_MAX_WIDTH,
                                             IOS7_IPAD_OUTPUT_HEIGHT);
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
