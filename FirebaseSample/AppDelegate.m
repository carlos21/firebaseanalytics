//
//  AppDelegate.m
//  FirebaseSample
//
//  Created by Carlos Duclos on 2/23/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@import Firebase;
@import FirebaseMessaging;

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self registerForPushNotifications:application];
    [FIRApp configure];
    return YES;
}

- (void)registerForPushNotifications:(UIApplication *)application {
    if ([UNUserNotificationCenter class]) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge)
                                                                            completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                                                                if (granted) {
                                                                                    [application registerForRemoteNotifications];
                                                                                }
                                                                            }];
    } else {
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil];
        [application registerUserNotificationSettings:notificationSettings];
        [application registerForRemoteNotifications];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    NSLog(@"application:didRegisterUserNotificationSettings:");
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError:");
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"application:didReceiveRemoteNotification:userInfo");
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"application:didReceiveRemoteNotification:fetchCompletionHandler");
    
    NSString *message = userInfo[@"aps"][@"alert"];
    NSLog(@"message: %@", message);
}

#pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSLog(@"userNotificationCenter:willPresentNotification:withCompletionHandler");
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    NSLog(@"userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler");
}

@end
