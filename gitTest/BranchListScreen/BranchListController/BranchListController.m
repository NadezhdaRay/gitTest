//
//  BranchListController.m
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "BranchListController.h"
#import "BranchListCell.h"
#import "Branch.h"

#import "GitBranchService.h"

#import "CommitsListController.h"

@interface BranchListController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *branchListTableView;
@property (nonatomic, strong) id <GitBranchServiceProtocol> gitBranchService;
@property (nonatomic, strong) NSArray *branchArray;

@end

@implementation BranchListController

+ (instancetype)new {
    return [[BranchListController alloc] initWithNibName:@"BranchListController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"%@ Branch List", self.repository.name];
    
    [self.branchListTableView registerNib:[BranchListCell nib] forCellReuseIdentifier:@"BranchListCell"];
    self.branchListTableView.tableFooterView = [UIView new];
    
    self.gitBranchService = [GitBranchService new];
    
    __weak typeof(self) weakSelf = self;
    [self.gitBranchService obtainBranchesForProfileName:self.profileName repositoryName:self.repository.name completion:^(NSArray *branches) {
        NSMutableArray *array = [NSMutableArray new];
        for (NSDictionary *dictionary in branches) {
            Branch *branch = [[Branch alloc] initBranchWithDictionary:dictionary];
            [array addObject:branch];
        }
        weakSelf.branchArray = array;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.branchListTableView reloadData];
        });
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.branchArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BranchListCell *branchListCell = [tableView dequeueReusableCellWithIdentifier:@"BranchListCell" forIndexPath:indexPath];
    Branch *branch = self.branchArray[indexPath.row];
    branchListCell.branchNameLabel.text = branch.branchName;
    
    return branchListCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CommitsListController *commitsListController = [CommitsListController new];
    commitsListController.repository = self.repository;
    commitsListController.profileName = self.profileName;
    commitsListController.branch = self.branchArray[indexPath.row];
    
    [self.navigationController pushViewController:commitsListController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
