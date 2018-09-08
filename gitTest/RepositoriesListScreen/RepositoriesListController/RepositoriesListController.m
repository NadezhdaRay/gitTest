//
//  RepositoriesListController.m
//  gitTest
//
//  Created by Ivan Grigoriev on 05/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "RepositoriesListController.h"
#import "RepositoriesListCell.h"

#import "BranchListController.h"

#import "GitRepositoryService.h"
#import "Repository.h"

#import "DateFormatterHelper.h"

@interface RepositoriesListController ()

@property (weak, nonatomic) IBOutlet UITableView *repositoriesListTableView;

@property (strong, nonatomic) id <GitRepositoryServiceProtocol> gitRepositoryService;
@property (strong, nonatomic) NSArray *repositoryArray;

@end

@implementation RepositoriesListController

+ (instancetype)new {
    return [[RepositoriesListController alloc] initWithNibName:@"RepositoriesListController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gitRepositoryService = [GitRepositoryService new];
    
    self.title = self.profileName;
    
    [self.repositoriesListTableView registerNib:[RepositoriesListCell nib] forCellReuseIdentifier:@"RepositoriesListCell"];
    self.repositoriesListTableView.tableFooterView = [UIView new];
    
    __weak typeof(self) weakSelf = self;
    
    [self.gitRepositoryService obtainUserRepositories:self.profileName completion:^(NSArray *repositories) {
        NSMutableArray *array = [NSMutableArray new];
        for (NSDictionary *dictionary in repositories) {
            Repository *repository = [[Repository alloc] initWithDictionary:dictionary];
            [array addObject:repository];
        }
        weakSelf.repositoryArray = array;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.repositoriesListTableView reloadData];
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repositoryArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepositoriesListCell *repositoryListCell = [tableView dequeueReusableCellWithIdentifier:@"RepositoriesListCell" forIndexPath:indexPath];
    Repository *repository = self.repositoryArray[indexPath.row];
    repositoryListCell.repositoriesNameLabel.text = repository.name;
    repositoryListCell.createdTextLabel.text = @"created at";
    repositoryListCell.dateCreatedRepositoryLabel.text = [DateFormatterHelper dateToString:repository.createRepositoryDate];
    
    return repositoryListCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BranchListController *branchListController = [BranchListController new];
    branchListController.profileName = self.profileName;
    branchListController.repository = self.repositoryArray[indexPath.row];
    
    [self.navigationController pushViewController:branchListController animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
