//
//  Commit.m
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "Commit.h"
#import "DateFormatterHelper.h"

@implementation Commit

-(instancetype)initCommitWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _shaCommit = dictionary[@"sha"];
        
        NSDictionary *author = dictionary[@"author"];
        if (![author isKindOfClass:[NSNull class]]){
            _authorAvatarUrlString = author[@"avatar_url"];
        } else {
            _authorAvatarUrlString = @"";
        }

        NSDictionary *commitDictionary = dictionary[@"commit"];
        _commitMessage = commitDictionary[@"message"];
        
        NSDictionary *authorCommitDictionary = commitDictionary[@"author"];
        _authorName = authorCommitDictionary[@"name"];
        _authorEmail = authorCommitDictionary[@"email"];
        _dateCreatedCommit = [DateFormatterHelper stringToDate:authorCommitDictionary[@"date"]];
    }
    return self;
}

@end
