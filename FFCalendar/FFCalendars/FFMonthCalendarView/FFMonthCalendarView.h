//
//  FFMonthCalendarView.h
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 3/18/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import <UIKit/UIKit.h>
#import "FFMonthCollectionView.h"

@protocol FFMonthCalendarViewProtocol <NSObject>
@required
- (void)setNewDictionary:(NSDictionary *)dict;
@end

@interface FFMonthCalendarView : UIView

@property (nonatomic, strong) FFMonthCollectionView *collectionViewMonth;
@property (nonatomic, strong) NSMutableDictionary *dictEvents;
@property (nonatomic, strong) id<FFMonthCalendarViewProtocol> protocol;

@end
