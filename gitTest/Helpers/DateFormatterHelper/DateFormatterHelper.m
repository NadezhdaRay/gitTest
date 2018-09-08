//
//  DateFormatterHelper.m
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "DateFormatterHelper.h"

@implementation DateFormatterHelper

+ (NSDate *)stringToDate:(NSString *)string {
    NSDateFormatter *formatDate = [NSDateFormatter new];
    formatDate.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    return [formatDate dateFromString:string];
}

+ (NSString *)dateToString:(NSDate *)date {
    NSDateFormatter *formatDate = [NSDateFormatter new];
    formatDate.dateFormat = @"MMM d, yyyy"; // Sep 6, 2018
    return [formatDate stringFromDate:date];
}

@end
