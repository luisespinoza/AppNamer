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
    
    //Draw border line
    [self.borderColor set];
    [bgPath setLineWidth:1.0];
    [bgPath stroke];
    
    //Draw the title
    [[self titleCell] drawWithFrame:[self titleRect] inView:self];
}

@end
