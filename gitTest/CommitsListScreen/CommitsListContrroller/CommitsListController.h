//
//  CommitsListController.h
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Branch.h"
#import "Repository.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommitsListController : UIViewController

@property (nonatomic, strong) Branch *branch;
@property (nonatomic, strong) Repository *repository;
@property (nonatomic, strong) NSString *profileName;

@end

NS_ASSUME_NONNULL_END
