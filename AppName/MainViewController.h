//
//  MainViewController.h
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 12-05-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Important configuration notes:
 The most important object is NSTextFied *textLabel. The configuration of this object is what is needed to show properly the name presentation.
 
 We know that in an iphone springboard, the maximun untruncated name with "i" is :"Iiiiiiiiiiiiiiiiiiiiiiiiiiii" with 29 i's is truncated to 11 ... 11 i's. 71 px long app.
 
 Line break: Truncate middle.
 Font: Helvetica 12. (we are using the double). Wiht shadow 1 px right and down. 2 for retina.
 LEColorPickerDemo is truncated as LECol...Demo .
 
 In ipad the label is longer.
 
 In ipad you can use 31 'i's , 87 px app.
 **/
@interface MainViewController : NSViewController <NSTextFieldDelegate>
{
    IBOutlet NSTextField *textField;
    IBOutlet NSTextField *textLabelIphone;
    IBOutlet NSTextField *textLabelIpad;
}
@end
