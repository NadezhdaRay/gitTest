//
//  GitCommitListService.m
//  gitTest
//
//  Created by Ivan Grigoriev on 07/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "GitCommitListService.h"

@implementation GitCommitListService


-(void)obtainCommitsForProfileName:(NSString *)userName
                    repositoryName:(NSString *)repositoryName
                        branchName:(NSString *)branchName
                        completion:(GitCommitListServiceCompletionBlock)completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/%@/commits?sha=%@", userName, repositoryName, branchName];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *reposArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        completion(reposArray);
    }];
    [task resume];
}

@end
