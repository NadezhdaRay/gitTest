//
//  ProfileNameController.m
//  gitTest
//
//  Created by Ivan Grigoriev on 05/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "ProfileNameController.h"
#import "RepositoriesListController.h"

@interface ProfileNameController ()

@property (weak, nonatomic) IBOutlet UITextField *profileNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *findButton;
@property (weak, nonatomic) IBOutlet UIView *subView;

@end

@implementation ProfileNameController

+(instancetype)new {
    return [[ProfileNameController alloc] initWithNibName:@"ProfileNameController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.findButton.layer.cornerRadius = 8;
    self.subView.layer.cornerRadius = 8;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.profileNameTextField.text = @"";
}

- (IBAction)findButtonPressed:(id)sender {
    if (self.profileNameTextField.text.length > 0) {
        RepositoriesListController *repositoriesListController = [RepositoriesListController new];
        repositoriesListController.profileName = self.profileNameTextField.text;
        
        [self.navigationController pushViewController:repositoriesListController animated:YES];
    }
}

@end
