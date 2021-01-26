//
//  SceneDelegate.m
//  Lesson-3
//
//  Created by Зинде Иван on 1/22/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "SceneDelegate.h"
#import "HeadersViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:windowFrame];
    [self.window makeKeyAndVisible];
    
    HeadersViewController *headersViewController = [[HeadersViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:headersViewController];
    
    navigationController.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    [self.window setWindowScene:windowScene];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
