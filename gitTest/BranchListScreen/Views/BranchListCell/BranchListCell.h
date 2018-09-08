//
//  BranchListCell.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BranchListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *branchNameLabel;

+ (UINib *)nib;

@end

NS_ASSUME_NONNULL_END
