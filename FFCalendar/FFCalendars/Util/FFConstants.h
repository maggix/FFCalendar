//
//  FFConstants.h
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 2/15/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import <UIKit/UIKit.h>

typedef enum ScrollDirection {
    ScrollDirectionNone,
    ScrollDirectionRight,
    ScrollDirectionLeft,
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionCrazy,
} ScrollDirection;

#define BUTTON_HEIGHT 44.

#define STORYBOARD_ID_ROOTVC @"root"

#define SPACE_COLLECTIONVIEW_CELL_YEAR 10.
#define SPACE_COLLECTIONVIEW_CELL 2.
#define HEADER_HEIGHT_MONTH 32.
#define HEADER_HEIGHT_SCROLL 100.
#define REUSE_IDENTIFIER_MONTH_CELL @"monthCell"
#define REUSE_IDENTIFIER_MONTH_HEADER @"headerCollection"

#define REUSE_IDENTIFIER_DAY_CELL @"dayCell"

#define HEIGHT_CELL_HOUR 100.
#define HEIGHT_CELL_MIN HEIGHT_CELL_HOUR/4.
#define MINUTES_PER_LABEL 60./4.

#define Customer_ID @"idCustomer"
#define Customer_NOME @"nmCustomer"

@interface FFConstants

@end
