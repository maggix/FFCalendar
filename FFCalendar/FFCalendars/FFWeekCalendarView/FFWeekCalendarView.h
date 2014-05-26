//
//  FFWeekCalendarView.h
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 2/21/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import <UIKit/UIKit.h>
#import "FFWeekHeaderCollectionView.h"
#import "FFWeekScrollView.h"

@protocol FFWeekCalendarViewProtocol <NSObject>
@required
- (void)setNewDictionary:(NSDictionary *)dict;
@end

@interface FFWeekCalendarView : UIView

@property (nonatomic, strong) FFWeekHeaderCollectionView *scrollViewHeaderWeek;
@property (nonatomic, strong) FFWeekScrollView *weekContainerScroll;

@property (nonatomic, strong) id<FFWeekCalendarViewProtocol> protocol;
@property (nonatomic, strong) NSMutableDictionary *dictEvents;

@end
