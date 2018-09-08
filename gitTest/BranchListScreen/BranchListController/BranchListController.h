//
//  BranchListController.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repository.h"

NS_ASSUME_NONNULL_BEGIN

@interface BranchListController : UIViewController

@property (nonatomic, strong) Repository *repository;
@property (nonatomic, strong) NSString *profileName;

@end

NS_ASSUME_NONNULL_END
