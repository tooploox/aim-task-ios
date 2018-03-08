//
//  AppDelegate.m
//  AIM
//
//  Created by Oskar Szydlowski on 06.03.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configureWindow];
    [self connectRoot];

    return YES;
}

- (void)configureWindow {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor darkGrayColor];
    [self.window makeKeyAndVisible];
}

- (void)connectRoot {
    if (self.window == nil) {
        [NSException raise:@"WindowIsNil" format:@"Window should be initialized"];
    }
    
    self.rootConnector = [[RootConnector alloc] initInWindow:self.window];
}

@end

