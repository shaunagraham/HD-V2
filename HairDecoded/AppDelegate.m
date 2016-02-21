//
//  AppDelegate.m
//  HairDecoded
//
//  Created by George on 25/08/14.
//  Copyright (c) 2014 Wedomobile. All rights reserved.
//

#import "AppDelegate.h"
#import "MainLoginViewController.h"
#import "HomeViewController.h"
#import "MenuViewController.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "DataWrapper.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [Fabric with:@[CrashlyticsKit]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(splashRemove:) name:@"splashRemove" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logout:) name:@"logout" object:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"login"] boolValue] == TRUE){
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
        
        HomeViewController* centerController = [[HomeViewController alloc] init];
        MenuViewController* rightController = [[MenuViewController alloc] init];
        [rightController.table selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
        
        IIViewDeckController* deckController = [[IIViewDeckController alloc] initWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:centerController] rightViewController:[[UINavigationController alloc] initWithRootViewController:rightController]];
        
        deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
        deckController.delegateMode = IIViewDeckDelegateAndSubControllers;
        [deckController setRightSize:230.0];
        
        self.window.rootViewController = deckController;
    }
    else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        MainLoginViewController *loginx = [[MainLoginViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginx];
        nav.navigationBarHidden = YES;
        [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
        self.window.rootViewController = nav;
    }

    [DataWrapper initUserData];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)logout:(id)sender{
    for(UIView *y in self.window.subviews)
        [y removeFromSuperview];
    MainLoginViewController *loginx = [[MainLoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginx];
    nav.navigationBarHidden = YES;
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.window.rootViewController = nav;
}

-(void)splashRemove:(id)sender
{
    for(UIView *y in self.window.subviews)
        [y removeFromSuperview];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    HomeViewController* centerController = [[HomeViewController alloc] init];
    MenuViewController* rightController = [[MenuViewController alloc] init];
    [rightController.table selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    IIViewDeckController* deckController = [[IIViewDeckController alloc] initWithCenterViewController:[[UINavigationController alloc] initWithRootViewController:centerController] rightViewController:[[UINavigationController alloc] initWithRootViewController:rightController]];
    
    deckController.centerhiddenInteractivity = IIViewDeckCenterHiddenNotUserInteractiveWithTapToClose;
    deckController.delegateMode = IIViewDeckDelegateAndSubControllers;
    [deckController setRightSize:230.0];
    
    //  [self presentViewController:deckController animated:NO completion:nil];
    
    self.window.rootViewController = deckController;
    
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

@end
