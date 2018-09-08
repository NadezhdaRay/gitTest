//
//  GitBranchService.m
//  gitTest
//
//  Created by Ivan Grigoriev on 06/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "GitBranchService.h"

@implementation GitBranchService

-(void)obtainBranchesForProfileName:(NSString *)userName repositoryName:(NSString *)repositoryName completion:(GitBranchServiceCompletionBlock)completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/%@/branches", userName, repositoryName];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSArray *reposArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        completion(reposArray);
    }];
    [task resume];
}

@end
