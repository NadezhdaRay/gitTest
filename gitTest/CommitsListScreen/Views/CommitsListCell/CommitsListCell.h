//
//  CommitsListCell.h
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommitsListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *commitMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateOfCreatedCommitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *authorImageView;

+ (UINib *)nib;

@end

NS_ASSUME_NONNULL_END
