//
//  FFUtils.m
//  FFCalendar
//
//  Created by Giovanni on 26/05/14.
//  Copyright (c) 2014 Fernanda G. Geraissate. All rights reserved.
//

#import "FFUtils.h"

@implementation FFUtils

+ (NSDictionary *)dictWeekNumberName
{
    //return something like:
//     @{@1:@"Sunday", @2:@"Monday", @3:@"Tuesday", @4:@"Wednesday", @5:@"Thursday", @6:@"Friday", @7:@"Saturday"}
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:language];
    [df setLocale:locale];
//    [df setLocale:[NSLocale currentLocale]];
    return @{ @1 : [[df weekdaySymbols] objectAtIndex:0],
              @2 : [[df weekdaySymbols] objectAtIndex:1],
              @3 : [[df weekdaySymbols] objectAtIndex:2],
              @4 : [[df weekdaySymbols] objectAtIndex:3],
              @5 : [[df weekdaySymbols] objectAtIndex:4],
              @6 : [[df weekdaySymbols] objectAtIndex:5],
              @7 : [[df weekdaySymbols] objectAtIndex:6]
             };
    
}

+ (NSArray *)arrayWeekAbrev
{
        //@[@"Sun", @"Mon", @"Tue", @"Wed", @"Thu", @"Fri", @"Sat"]
    NSMutableArray *days = [[NSMutableArray alloc] init];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:language];
    [df setLocale:locale];
//    [df setLocale:[NSLocale currentLocale]];
    for (NSInteger i = 0; i < 7; i++) {
        [days addObject: [[[df weekdaySymbols] objectAtIndex:i] substringToIndex:2]];
    }
    return days;
}

+ (NSArray *)arrayMonthName
{
    //@[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"]
    NSMutableArray *months = [[NSMutableArray alloc] init];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:language];
    [df setLocale:locale];
//    [df setLocale:[NSLocale currentLocale]];
    for (NSInteger i = 0; i < 12; i++) {
        [months addObject: [[df monthSymbols] objectAtIndex:i]];
    }
    return months;
}

+ (NSArray *)arrayMonthNameAbrev
{
    //@[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"]
    NSMutableArray *months = [[NSMutableArray alloc] init];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSString * language = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:language];
    [df setLocale:locale];
//    [df setLocale:[NSLocale currentLocale]];
    for (NSInteger i = 0; i < 12; i++) {
        [months addObject: [[[df monthSymbols] objectAtIndex:i] substringToIndex:2]];
    }
    return months;
}

@end
