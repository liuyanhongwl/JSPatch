//
//  AppDelegate.m
//  JSPatch
//
//  Created by Hong on 16/8/19.
//  Copyright © 2016年 Hong. All rights reserved.
//

#import "AppDelegate.h"
#import <JSPatch/JPEngine.h>
#import "JPLoader.h"

const static NSString *JSVersionKey = @"currentJSVersion";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UIWebView *view = [[UIWebView alloc]init];   //Useless. Just to load the UIWebview framework.
    view.frame = CGRectZero;
    
    //运行本地js
    [JPEngine startEngine];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    [JPEngine evaluateScriptWithPath:path];
    
    //加载服务器js压缩包
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *version = [userDefaults objectForKey:JSVersionKey];
    NSInteger currentJSVersion = version ? [version integerValue] : 0;
    NSInteger targetJSVersion = 4;
    if (currentJSVersion != targetJSVersion) {
        [JPLoader updateToVersion:targetJSVersion callback:^(NSError *error) {
            if (error) {
                NSLog(@"loader error : %@", error);
            }else{
                //执行从服务器加载下来的js
                [JPLoader run];

                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                NSNumber *version = [NSNumber numberWithInteger:targetJSVersion];
                [userDefaults setObject:version forKey:JSVersionKey];
                [userDefaults synchronize];
            }
        }];
    }else{
        [JPLoader run];
    }
    
    [self runJS];
    
    return YES;
}

- (void)runJS
{
    
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
