//
//  AppDelegate.m
//  gitTest
//
//  Created by Ivan Grigoriev on 05/09/2018.
//  Copyright © 2018 Ivan Grigoriev. All rights reserved.
//

#import "AppDelegate.h"
#import "ProfileNameController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ProfileNameController *profileNameController = [ProfileNameController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:profileNameController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
