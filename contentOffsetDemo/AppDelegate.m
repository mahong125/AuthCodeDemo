//
//  AppDelegate.m
//  contentOffsetDemo
//
//  Created by mahong on 15/6/1.
//  Copyright (c) 2015年 mahong. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AuthCodeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    ViewController *view = [[ViewController alloc] init];
    AuthCodeViewController *view = [[AuthCodeViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:view];
    self.window.rootViewController = nav;
    
    //copy  mutablecopy
    /**
     如果对一不可变对象复制，copy是指针复制（浅拷贝）和mutableCopy就是对象复制（深拷贝）。如果是对可变对象复制，都是深拷贝，但是copy返回的对象是不可变的。
     */
    
    NSString *str = @"admin";
    NSString *copyStr = [str copy];//copy 指针复制  浅复制
    NSString *mcopyStr = [str mutableCopy];//mutablecopy 对象复制  深度复制
    
    NSLog(@"%p\n%p\n%p",str,copyStr,mcopyStr);
    
    NSMutableString *mstr = [NSMutableString stringWithString:@"test"];
    NSString *str1 = [mstr copy];
    NSString *str2 = [mstr mutableCopy];
    
    NSLog(@"%p\n%p\n%p",mstr,str1,str2);
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
