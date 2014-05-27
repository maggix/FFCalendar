//
//  FFDayCalendarView.m
//  FFCalendar
//
//  Created by Fernanda G. Geraissate on 2/23/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//
//  http://fernandasportfolio.tumblr.com
//

#import "FFDayCalendarView.h"

#import "FFDayEventTableViewController.h"

@interface FFDayCalendarView () <FFDayCellProtocol, FFDayHeaderCollectionViewProtocol, FFDayCollectionViewProtocol, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UINavigationController *eventDetailNavController;
@property (nonatomic) BOOL boolAnimate;
@end

@implementation FFDayCalendarView

#pragma mark - Synthesize

@synthesize dictEvents;
@synthesize collectionViewHeaderDay;
@synthesize dayContainerScroll;
@synthesize eventDetailNavController;;
@synthesize protocol;
@synthesize boolAnimate;

#pragma mark - Lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateChanged:) name:DATE_MANAGER_DATE_CHANGED object:nil];
        [self setBackgroundColor:[UIColor whiteColor]];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [gesture setDelegate:self];
        [self addGestureRecognizer:gesture];
        
        boolAnimate = NO;
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

- (void)setDictEvents:(NSMutableDictionary *)_dictEvents {
    
    dictEvents = _dictEvents;
    
    if (!dayContainerScroll) {
        collectionViewHeaderDay = [[FFDayHeaderCollectionView alloc] initWithFrame:CGRectMake(0., 0., self.frame.size.width, HEADER_HEIGHT_SCROLL)];
        [collectionViewHeaderDay setProtocol:self];
        [collectionViewHeaderDay scrollToDate:[[FFDateManager sharedManager] currentDate]];
        //AutoresizingMask
        collectionViewHeaderDay.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self addSubview:collectionViewHeaderDay];
        
        dayContainerScroll = [[FFDayScrollView alloc] initWithFrame:CGRectMake(0, HEADER_HEIGHT_SCROLL, self.frame.size.width/2., self.frame.size.height-HEADER_HEIGHT_SCROLL)];
        //AutoresizingMask
        dayContainerScroll.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
        [self addSubview:dayContainerScroll];
    }
    [dayContainerScroll setDictEvents:dictEvents];
    [dayContainerScroll.collectionViewDay setProtocol:self];
}

#pragma mark - FFDateManager Notification

- (void)dateChanged:(NSNotification *)not {
    
    [dayContainerScroll.collectionViewDay reloadData];
    [dayContainerScroll.collectionViewDay scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:[NSDate componentsOfDate:[[FFDateManager sharedManager] currentDate]].day-1+7 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:boolAnimate];
    
    boolAnimate = NO;
    
    [self updateHeader];
    
    if ([NSDate isTheSameDateTheCompA:[NSDate componentsOfCurrentDate] compB:[NSDate componentsOfDate:[[FFDateManager sharedManager] currentDate]]]) {
        [dayContainerScroll scrollRectToVisible:CGRectMake(0, dayContainerScroll.labelWithActualHour.frame.origin.y, dayContainerScroll.frame.size.width, dayContainerScroll.frame.size.height) animated:YES];
    }
}

#pragma mark - Tap Gesture

- (void)handleTap:(UITapGestureRecognizer *)recognizer {

}

#pragma mark - UIGestureRecognizer Delegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    CGPoint point = [gestureRecognizer locationInView:self];
    
    return YES;
}

#pragma mark - FFDayCollectionView Protocol

- (void)updateHeader {
    
    [collectionViewHeaderDay reloadData];
    
    [collectionViewHeaderDay scrollToDate:[[FFDateManager sharedManager] currentDate]];
}

#pragma mark - FFDayHeaderCollectionView Protocol

- (void)daySelected:(NSDate *)date {
    
    boolAnimate = YES;
}

#pragma mark - FFDayCell Protocol

- (void)showViewDetailsWithEvent:(FFEvent *)_event cell:(UICollectionViewCell *)cell {
    
    [eventDetailNavController.view removeFromSuperview];
    
    FFDayEventTableViewController *viewDetailTable = [[FFDayEventTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    eventDetailNavController = [[UINavigationController alloc] initWithRootViewController:viewDetailTable];
   [eventDetailNavController.view setFrame:CGRectMake(self.frame.size.width/2., HEADER_HEIGHT_SCROLL, self.frame.size.width/2., self.frame.size.height-HEADER_HEIGHT_SCROLL)];
    eventDetailNavController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
    [self addSubview:eventDetailNavController.view];
}

@end
