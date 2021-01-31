//
//  TabBarController.m
//  Lesson-5
//
//  Created by Зинде Иван on 1/31/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "TabBarController.h"
#import "TableViewController.h"
#import "ViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (instancetype) init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
        TableViewController *leftViewController = [[TableViewController alloc] init];
        leftViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Цвета" image:[UIImage systemImageNamed:@"cloud"] selectedImage:[UIImage systemImageNamed:@"cloud"]];
        
        ViewController *rightViewController = [[ViewController alloc] init];
        rightViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Фото" image:[UIImage systemImageNamed:@"photo"] selectedImage:[UIImage systemImageNamed:@"photo"]];
        
        self.viewControllers = @[leftViewController, rightViewController];
        self.selectedIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
