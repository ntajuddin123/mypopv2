//
//  ScrollViewContainer.m
//  MyPOPv2
//
//  Created by Naweed Tajuddin on 2015-11-23.
//  Copyright © 2015 Naweed Tajuddin. All rights reserved.
//

#import "ScrollViewContainer.h"

@implementation ScrollViewContainer

@synthesize scrollView = _scrollView;

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == self) {
        return _scrollView;
    }
    return view;
}

@end
