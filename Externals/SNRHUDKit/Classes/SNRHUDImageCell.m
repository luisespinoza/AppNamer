//
//  SNRHUDImageCell.m
//  SNRHUDKit
//
//  Created by Indragie Karunaratne on 12-01-23.
//  Copyright (c) 2012 indragie.com. All rights reserved.
//

#import "SNRHUDImageCell.h"
#import "NSBezierPath+MCAdditions.h"

#define SNRImageCellColor                           [NSColor whiteColor]
#define SNRImageCellSelectedTextBackgroundColor     [NSColor darkGrayColor]
#define SNRImageCellBackgroundColor                 [NSColor colorWithDeviceWhite:0.000 alpha:0.150]
#define SNRImageCellInnerGlowColor                  [NSColor colorWithDeviceWhite:0.000 alpha:0.300]
#define SNRImageCellInnerGlowOffset                 NSMakeSize(0.f, 0.f)
#define SNRImageCellInnerGlowBlurRadius             3.f

#define SNRImageCellInnerShadowColor                [NSColor colorWithDeviceWhite:0.000 alpha:0.400]
#define SNRImageCellInnerShadowOffset               NSMakeSize(0.f, -1.f)
#define SNRImageCellInnerShadowBlurRadius           3.f

#define SNRImageCellDropShadowColor                 [NSColor colorWithDeviceWhite:1.000 alpha:0.100]
#define SNRImageCellContainerInset                  NSMakeSize(0.f, 2.f)
#define SNRImageCellDisabledAlpha                   0.5f
#define SNRImageCellVerticalOffset                  1.f

@implementation SNRHUDImageCell

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    if (![self isEnabled]) {
        CGContextSetAlpha([[NSGraphicsContext currentContext] graphicsPort], SNRImageCellDisabledAlpha);
    }
    NSRect backgroundRect = cellFrame;
    backgroundRect.size.height -= 1.f;
    
    NSBezierPath *backgroundPath = [NSBezierPath bezierPathWithRect:backgroundRect];
    
//    if ([self drawsBackground]) {
//        [SNRTextFieldBackgroundColor set];
//        [backgroundPath fill];
//    }
    
    //if ([self isBezeled]) {
        NSShadow *innerGlow = [NSShadow new];
        [innerGlow setShadowColor:SNRImageCellInnerGlowColor];
        [innerGlow setShadowOffset:SNRImageCellInnerGlowOffset];
        [innerGlow setShadowBlurRadius:SNRImageCellInnerShadowBlurRadius];
        [backgroundPath fillWithInnerShadow:innerGlow];
        NSRect innerShadowRect = NSInsetRect(backgroundRect, -2.f, 0.f);
        innerShadowRect.size.height *= 2.f;
        NSBezierPath *shadowPath = [NSBezierPath bezierPathWithRect:innerShadowRect];
        NSShadow *innerShadow = [NSShadow new];
        [innerShadow setShadowColor:SNRImageCellInnerShadowColor];
        [innerShadow setShadowOffset:SNRImageCellInnerShadowOffset];
        [innerShadow setShadowBlurRadius:SNRImageCellInnerShadowBlurRadius];
        [shadowPath fillWithInnerShadow:innerShadow];
        NSRect dropShadowRect = backgroundRect;
        dropShadowRect.origin.y = NSMaxY(cellFrame) - 1.f;
        [SNRImageCellDropShadowColor set];
        [NSBezierPath fillRect:dropShadowRect];
    //}
    
    // Draw the text vertically centered
    //NSSize textSize = [self cellSizeForBounds:cellFrame];
    //NSRect textRect = NSMakeRect(backgroundRect.origin.x, round(NSMidY(backgroundRect) - (textSize.height / 2.f)) - SNRImageCellVerticalOffset, backgroundRect.size.width, textSize.height);
    [self drawInteriorWithFrame:cellFrame inView:controlView];
}

@end
