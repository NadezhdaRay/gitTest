//
//  Branch.m
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "Branch.h"

@implementation Branch

-(instancetype)initBranchWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        self.branchName = dictionary[@"name"];
    }
    return self;
}

@end
