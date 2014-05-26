//
//  FFWeekHeaderCell.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 2/26/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "FFWeekHeaderCell.h"

@implementation FFWeekHeaderCell

@synthesize label;
@synthesize imageView;
@synthesize date;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0., 0., self.frame.size.width, self.frame.size.height)];
        [imageView setContentMode:UIViewContentModeCenter];
        //Autoresizing Mask
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

        [self addSubview:imageView];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0., 0., self.frame.size.width, self.frame.size.height)];
        [label setTextAlignment:NSTextAlignmentCenter];
        //Autoresizing Mask
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;

        [self addSubview:label];
    }
    return self;
}

- (void)cleanCell {
    
    [imageView setImage:nil];
    [label setText:@""];
    [label setTextColor:[UIColor blackColor]];
    date = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
