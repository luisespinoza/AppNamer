//
//  CustomNSBox.m
//  AppName
//
//  Created by Luis Enrique Espinoza Severino on 20-09-13.
//  Copyright (c) 2013 LuisEspinoza. All rights reserved.
//

#import "CustomNSBox.h"

@implementation CustomNSBox

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
    // Drawing code here.
    [super drawRect:dirtyRect];
    
    //Fill with fillcolor
    NSBezierPath *bgPath = [NSBezierPath bezierPathWithRect:dirtyRect];
    [self.fillColor set];
    [bgPath fill];
    
    //Draw the title
    [[self titleCell] drawWithFrame:[self titleRect] inView:self];
    
    //Draw border lines
    CGFloat color[4];
    [self.fillColor getComponents:color];
    NSColor *lowerColor = [NSColor colorWithCalibratedRed:color[0]-60/255. green:color[1]-60/255. blue:color[2]-60/255. alpha:color[3]];
    NSBezierPath *lowerLinePath = [NSBezierPath bezierPath];
    [lowerColor set];
    [lowerLinePath setLineWidth:.5];
    NSPoint p = CGPointMake(dirtyRect.origin.x  , dirtyRect.origin.y+1);
    NSPoint q = CGPointMake(dirtyRect.origin.x+dirtyRect.size.width, dirtyRect.origin.y+1);
    [lowerLinePath moveToPoint:p];
    [lowerLinePath lineToPoint:q];
    [lowerLinePath closePath];
    [lowerLinePath stroke];
    
    NSColor *upperColor = [NSColor colorWithCalibratedRed:color[0]+60/255. green:color[1]+60/255. blue:color[2]+60/255. alpha:color[3]];
    [upperColor set];
    [lowerLinePath setLineWidth:.5];
    NSBezierPath *upperLinePath = [NSBezierPath bezierPath];
    p = CGPointMake(dirtyRect.origin.x  , dirtyRect.origin.y+.5);
    q = CGPointMake(dirtyRect.origin.x+dirtyRect.size.width, dirtyRect.origin.y+.5);
    [upperLinePath moveToPoint:p];
    [upperLinePath lineToPoint:q];
    [upperLinePath closePath];
    [upperLinePath stroke];
}

@end
