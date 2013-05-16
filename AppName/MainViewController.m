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

- (void)loadView
{
    [[textLabelIphone cell] setBackgroundStyle:NSBackgroundStyleRaised];
    [[textLabelIpad cell] setBackgroundStyle:NSBackgroundStyleRaised];

}
@end
