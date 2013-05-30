//
//  MainViewController.m
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 12-05-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)controlTextDidChange:(NSNotification *)obj
{
    textLabelIphone.stringValue = textField.stringValue;
    textLabelIpad.stringValue = textField.stringValue;
}

- (void)awakeFromNib
{
    [[textLabelIphone cell] setBackgroundStyle:NSBackgroundStyleRaised];
    //[textLabelIphone sizeToFit];
    //[[textLabelIphone cell] setAlignment:NSJustifiedTextAlignment];
    //[[textLabelIphone cell] setPreferredMaxLayoutWidth:78];
    //[[textLabelIphone cell] setMinWidth:12];
    
    //    [textLabelIphone setPreferredMaxLayoutWidth:78.0];
    [[textLabelIpad cell] setBackgroundStyle:NSBackgroundStyleRaised];
    
    [self loadDisclaimerText];
}

- (void)loadView
{

}

- (void)loadDisclaimerText
{
    NSString *disclaimerString = @"© 2013 Luis Espinoza, All rights reserved";
    //textLabelDisclaimer.alignment = NSJustifiedTextAlignment;
    textLabelDisclaimer.stringValue = disclaimerString;
}

@end
