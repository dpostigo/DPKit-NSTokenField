//
// Created by Dani Postigo on 2/5/14.
//

#import "DPUnderlineTokenFieldCell.h"
#import "NSCell+DPKit.h"
#import "NSCell+DPKitUnderline.h"

@implementation DPUnderlineTokenFieldCell

- (void) setup {
    [super setup];
    insets = NSEdgeInsetsMake(0, 0, 0, 0);
    self.borderColor = [NSColor colorWithDeviceWhite: 0.0 alpha: 0.1];

}

- (void) drawInteriorWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawInteriorWithFrame: cellFrame inView: controlView];

    [self.borderColor set];
    NSRectFillUsingOperation(self.underlineRect, NSCompositeSourceOver);
}

- (void) drawWithFrame: (NSRect) cellFrame inView: (NSView *) controlView {
    [super drawWithFrame: cellFrame inView: controlView];

    [self.borderColor set];
    NSRectFillUsingOperation(self.underlineRect, NSCompositeSourceOver);
}


@end