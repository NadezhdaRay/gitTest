//
//  DateFormatterHelper.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateFormatterHelper : NSObject

+ (NSDate *)stringToDate:(NSString *)string;
+ (NSString *)dateToString:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
