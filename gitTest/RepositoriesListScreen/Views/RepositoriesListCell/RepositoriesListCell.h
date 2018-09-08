//
//  RepositoriesListCell.h
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RepositoriesListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *createdTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateCreatedRepositoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *repositoriesNameLabel;
+(UINib *)nib;

@end

NS_ASSUME_NONNULL_END
