//
//  MainViewController.h
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 12-05-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainViewController : NSViewController <NSTextFieldDelegate>
{
    IBOutlet NSTextField *textField;
    IBOutlet NSTextField *textLabelIphone;
    IBOutlet NSTextField *textLabelIpad;
    IBOutlet NSTextField *textLabelDisclaimer;

    //Version 1.2 added outlets
    IBOutlet NSTextField *textLabelIphoneIOS7;
    IBOutlet NSTextField *textLabelIpadIOS7;
    IBOutlet NSBox *boxIOS6;
    IBOutlet NSBox *boxIOS7;
}

- (IBAction)sendFeedbackAction:(id)sender;
@end
