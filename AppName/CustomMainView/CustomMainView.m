//
//  CustomMainView.m
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 10/17/13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import "CustomMainView.h"

#define CUSTOM_MAIN_VIEW_SEPARATOR_OFFSET           279

@implementation CustomMainView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
	[super drawRect:dirtyRect];
	
    // Drawing code here.
    [self drawSeparator];
}

- (void)drawSeparator
{
    NSColor *lowerColor = [NSColor colorWithCalibratedRed:(237-60)/255. green:(237-60)/255. blue:(237-60)/255. alpha:1.0];
    NSBezierPath *lowerLinePath = [NSBezierPath bezierPath];
    [lowerColor set];
    [lowerLinePath setLineWidth:.5];
    NSPoint p = CGPointMake(self.frame.origin.x  , CUSTOM_MAIN_VIEW_SEPARATOR_OFFSET+1);
    NSPoint q = CGPointMake(self.frame.origin.x + self.frame.size.width, CUSTOM_MAIN_VIEW_SEPARATOR_OFFSET+1);
    [lowerLinePath moveToPoint:p];
    [lowerLinePath lineToPoint:q];
    [lowerLinePath closePath];
    [lowerLinePath stroke];
    
    NSColor *upperColor = [NSColor colorWithCalibratedRed:(237+60)/255. green:(237+60)/255. blue:(237+60)/255. alpha:1.0];
    [upperColor set];
    [lowerLinePath setLineWidth:.5];
    NSBezierPath *upperLinePath = [NSBezierPath bezierPath];
    p = CGPointMake(self.frame.origin.x  , CUSTOM_MAIN_VIEW_SEPARATOR_OFFSET+.5);
    q = CGPointMake(self.frame.origin.x + self.frame.size.width, CUSTOM_MAIN_VIEW_SEPARATOR_OFFSET+.5);
    [upperLinePath moveToPoint:p];
    [upperLinePath lineToPoint:q];
    [upperLinePath closePath];
    [upperLinePath stroke];
}
@end
