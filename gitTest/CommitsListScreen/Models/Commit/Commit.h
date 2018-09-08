//
//  Commit.h
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Commit : NSObject

@property (nonatomic, strong, readonly) NSString *shaCommit;
@property (nonatomic, strong, readonly) NSString *authorName;
@property (nonatomic, strong, readonly) NSString *authorEmail;
@property (nonatomic, strong, readonly) NSString *authorAvatarUrlString;
@property (nonatomic, strong, readonly) NSString *commitMessage;
@property (nonatomic, strong, readonly) NSDate *dateCreatedCommit;

-(instancetype)initCommitWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
