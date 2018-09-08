//
//  GitBranchServiceProtocol.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^GitBranchServiceCompletionBlock)(NSArray *branches);

NS_ASSUME_NONNULL_BEGIN

@protocol GitBranchServiceProtocol <NSObject>

-(void)obtainBranchesForProfileName:(NSString *)userName repositoryName:(NSString *)repositoryName completion:(GitBranchServiceCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
