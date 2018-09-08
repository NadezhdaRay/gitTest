//
//  Repository.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Repository : NSObject

@property (nonatomic, strong, readonly) NSNumber *idRepository;
@property (nonatomic, strong, readonly) NSDate *createRepositoryDate;
@property (nonatomic, strong, readonly) NSString *name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
