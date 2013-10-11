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
    
    //Draw border lines
    CGFloat color[4];
    [self.fillColor getComponents:color];
    NSColor *lowerColor = [NSColor colorWithSRGBRed:color[0]-60/255. green:color[1]-60/255. blue:color[2]-60/255. alpha:color[3]];
    [lowerColor set];
    NSBezierPath *borderLinePath = [NSBezierPath bezierPath];
    [borderLinePath setLineWidth:1.0];
    NSPoint p = CGPointMake(dirtyRect.origin.x  , dirtyRect.origin.y+1);
    NSPoint q = CGPointMake(dirtyRect.origin.x+dirtyRect.size.width, dirtyRect.origin.y+1);
    [borderLinePath moveToPoint:p];
    [borderLinePath lineToPoint:q];
    [borderLinePath stroke];
    
    NSColor *upperColor = [NSColor colorWithSRGBRed:color[0]+60/255. green:color[1]+60/255. blue:color[2]+60/255. alpha:color[3]];
    [upperColor set];
    p = CGPointMake(dirtyRect.origin.x  , dirtyRect.origin.y + dirtyRect.size.height);
    q = CGPointMake(dirtyRect.origin.x+dirtyRect.size.width, dirtyRect.origin.y + dirtyRect.size.height);
    [borderLinePath moveToPoint:p];
    [borderLinePath lineToPoint:q];
    [borderLinePath stroke];
    //Draw the title
    [[self titleCell] drawWithFrame:[self titleRect] inView:self];
    
    
}

@end
