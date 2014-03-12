//
// Created by Dani Postigo on 2/5/14.
//

#import "DPInsetTokenFieldCell.h"
#import "NSCell+DPKit.h"

@implementation DPInsetTokenFieldCell

@synthesize insets;
@synthesize debugMode;
@synthesize borderColor;

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        [self setup];
    }

    return self;
}

- (void) setup {
    self.bezelStyle = NSTextFieldSquareBezel;
    self.focusRingType = NSFocusRingTypeNone;
    insets = NSEdgeInsetsMake(0, 0, 0, 0);
    //    debugMode = YES;
}


- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];

    [self eraseDrawingInRect: self.controlBounds];

    if (debugMode) {
        [self drawDrawingRect];
        [self drawControlBounds];
        [self drawTitleRect];
        //        [self drawDebugRect: [self titleRectForBounds: cellFrame] color: [NSColor greenColor]];
    }
}

- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];

    [self eraseDrawingInRect: self.controlBounds];

    if (debugMode) {
        [self drawDrawingRect];
        [self drawControlBounds];
        [self drawTitleRect];
        //        [self drawDebugRect: [self titleRectForBounds: cellFrame] color: [NSColor greenColor]];
    }
}


- (void) drawDebugRect: (NSRect) rect color: (NSColor *) color {
    [color set];
    NSFrameRectWithWidthUsingOperation(rect, 1, NSCompositeSourceOver);

}

- (void) drawTitleRect {
    NSRect bounds = self.controlView.bounds;

    [[NSColor blueColor] set];
    NSFrameRectWithWidthUsingOperation([self titleRectForBounds: bounds], 1, NSCompositeSourceOver);

}

- (void) drawDrawingRect {
    [self drawDebugRect: [self drawingRectForBounds: self.controlBounds] color: [NSColor redColor]];
}

- (void) drawControlBounds {
    [self drawDebugRect: self.controlBounds color: [[NSColor redColor] colorWithAlphaComponent: 0.5]];
}


/* Position of the text */

- (NSRect) drawingRectForBounds: (NSRect) theRect {
    NSRect ret = [super drawingRectForBounds: theRect];
    ret.origin.x += insets.left;
    ret.origin.y += insets.top;
    ret.size.width -= (insets.right + insets.left);
    ret.size.height -= (insets.top + insets.bottom);
    return ret;
}

//
//- (NSRect) titleRectForBounds: (NSRect) theRect {
////    NSRect ret = [super titleRectForBounds: theRect];
////    //    ret.origin.y = 20;
////    ret = NSInsetRect(ret, 10, 10);
////    //    NSLog(@"ret = %@", NSStringFromRect(ret));
////    return ret;
//}



- (NSSize) cellSizeForBounds: (NSRect) aRect {
    NSSize ret = [super cellSizeForBounds: aRect];
    ret.width += insets.left + insets.right;
    ret.height += insets.top + insets.bottom;
    return ret;
}


#pragma mark Getters

- (NSColor *) borderColor {
    if (borderColor == nil) {
        borderColor = [NSColor clearColor];
    }
    return borderColor;
}

@end