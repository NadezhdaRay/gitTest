//
//  Repository.m
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "Repository.h"
#import "DateFormatterHelper.h"

@implementation Repository

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _name = dictionary[@"name"];
        _idRepository = dictionary[@"id"];
        _createRepositoryDate = [DateFormatterHelper stringToDate:dictionary[@"created_at"]];
    }
    return self;
}

@end
