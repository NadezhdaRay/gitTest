//
//  GitCommitListServiceProtocol.h
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^GitCommitListServiceCompletionBlock)(NSArray *commits);

NS_ASSUME_NONNULL_BEGIN

@protocol GitCommitListServiceProtocol <NSObject>

-(void)obtainCommitsForProfileName:(NSString *)userName
                    repositoryName:(NSString *)repositoryName
                        branchName:(NSString *)branchName
                        completion:(GitCommitListServiceCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
