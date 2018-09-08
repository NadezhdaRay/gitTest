//
//  Branch.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Branch : NSObject

@property (nonatomic, strong) NSString *branchName;

-(instancetype)initBranchWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
