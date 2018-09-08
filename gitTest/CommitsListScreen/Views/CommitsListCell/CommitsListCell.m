//
//  CommitsListCell.m
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "CommitsListCell.h"

@implementation CommitsListCell

+ (UINib *)nib {
    return [UINib nibWithNibName:@"CommitsListCell" bundle:nil];
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.authorImageView.layer.cornerRadius = self.authorImageView.frame.size.height / 2;
}

@end
