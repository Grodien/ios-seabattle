//
//  SBAppDelegate.m
//  Seabattle
//
//  Created by Thomas Bomatter on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SBAppDelegate.h"

#import "SBViewController.h"
#import "SBQueueViewController.h"
#import "SBGameSetupViewController.h"
#import "SBGameViewController.h"
#import "SBNetworkConnection.h"

@implementation SBAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
  self.viewController = [[SBViewController alloc] initWithNibName:@"SBViewController" bundle:nil];
  self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)showMainWindow {
  [self.viewController dismissModalViewControllerAnimated:YES];
  [[SBNetworkConnection sharedInstance] disconnect];
}

- (void)showQueueWindow {
  SBQueueViewController *view = [[SBQueueViewController alloc] init];
  view.modalPresentationStyle = UIModalPresentationFullScreen;
  view.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  
  [self.viewController dismissModalViewControllerAnimated:NO];
  [self.viewController presentModalViewController:view animated:YES];
  
}

- (void)showGameSetupWindow {
  SBGameSetupViewController *view = [[SBGameSetupViewController alloc] init];  
  view.modalPresentationStyle = UIModalPresentationFullScreen;
  view.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  
  [self.viewController dismissModalViewControllerAnimated:NO];
  [self.viewController presentModalViewController:view animated:YES];
}

- (void)showGameWindow {
  
  SBGameViewController *view = [[SBGameViewController alloc] init];  
  view.modalPresentationStyle = UIModalPresentationFullScreen;
  view.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  
  [self.viewController dismissModalViewControllerAnimated:NO];
  [self.viewController presentModalViewController:view animated:YES];
}

@end
