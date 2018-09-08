//
//  GitRepositoryServiceProtocol.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^GitRepositoryServiceCompletionBlock)(NSArray *repositories);

NS_ASSUME_NONNULL_BEGIN

@protocol GitRepositoryServiceProtocol <NSObject>

-(void)obtainUserRepositories:(NSString *)userName completion:(GitRepositoryServiceCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
