//
//  CommitsListController.m
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "CommitsListController.h"
#import "CommitsListCell.h"

#import "GitCommitListService.h"
#import "Commit.h"

#import "DateFormatterHelper.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CommitsListController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *commitsListTableView;
@property (nonatomic, strong) id <GitCommitListServiceProtocol> gitCommitListService;
@property (nonatomic, strong) NSArray *commitsArray;

@end

@implementation CommitsListController

+ (instancetype)new {
    return [[CommitsListController alloc] initWithNibName:@"CommitsListController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"Commit List of %@", self.branch.branchName];
    
    [self.commitsListTableView registerNib:[CommitsListCell nib] forCellReuseIdentifier:@"CommitsListCell"];
    self.commitsListTableView.tableFooterView = [UIView new];
    
    self.gitCommitListService = [GitCommitListService new];
    
    __weak typeof(self) weakSelf = self;
    [self.gitCommitListService obtainCommitsForProfileName:self.profileName repositoryName:self.repository.name branchName:self.branch.branchName completion:^(NSArray *commits) {
        NSMutableArray *array = [NSMutableArray new];
        for (NSDictionary *dictionary in commits) {
            Commit *commit = [[Commit alloc] initCommitWithDictionary:dictionary];
            [array addObject:commit];
        }
        weakSelf.commitsArray = array;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.commitsListTableView reloadData];
        });
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.commitsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommitsListCell *commitsListCell = [tableView dequeueReusableCellWithIdentifier:@"CommitsListCell" forIndexPath:indexPath];
    Commit *commit = self.commitsArray[indexPath.row];
    
    commitsListCell.nameLabel.text = commit.authorName;
    commitsListCell.emailLabel.text = [NSString stringWithFormat:@"<%@>", commit.authorEmail];
    commitsListCell.commitMessageLabel.text = commit.commitMessage;
    commitsListCell.dateOfCreatedCommitLabel.text = [DateFormatterHelper dateToString:commit.dateCreatedCommit];
    [commitsListCell.authorImageView sd_setImageWithURL:[NSURL URLWithString:commit.authorAvatarUrlString] placeholderImage:[UIImage imageNamed:@"userPlaceholder"]];
    
    return commitsListCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
