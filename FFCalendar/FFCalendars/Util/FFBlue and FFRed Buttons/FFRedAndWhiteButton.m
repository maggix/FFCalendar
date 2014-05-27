//
//  FFRedAndWhiteButton.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 2/23/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "FFRedAndWhiteButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation FFRedAndWhiteButton

const CGFloat roundCornerSize = 5;

- (id)initWithFrame:(CGRect)frame
{
    self = [UIButton buttonWithType:UIButtonTypeCustom];
    if (self) {
        // Initialization code
        
        self.tintColor = [UIColor orangeColor];
        
        [self setFrame:frame];
        
        [self setTitleColor:self.tintColor forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        [self setBackgroundImage:[UIImage FF_imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage FF_imageWithColor:self.tintColor] forState:UIControlStateSelected];
        
        [self.layer setBorderColor:self.tintColor.CGColor];
        [self.layer setBorderWidth:1.];
        self.layer.cornerRadius = roundCornerSize;
        self.layer.masksToBounds = YES;

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setSelected:(BOOL)_selected {

    self.selected = _selected;
    
    if(_selected) {
        [self.layer setBorderColor:[UIColor clearColor].CGColor];
    } else {
        [self.layer setBorderColor:self.tintColor.CGColor];
    }
}

@end
