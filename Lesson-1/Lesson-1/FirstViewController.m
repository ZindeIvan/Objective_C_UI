//
//  FirstViewController.m
//  Lesson-1
//
//  Created by Зинде Иван on 1/14/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewController];
}

-(void)configureViewController {
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    CGRect frame = CGRectMake(20.0, 100.0, 200.0, 50.0);
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Yellow", @"White"]];
    segmentedControl.frame = frame;
    segmentedControl.tintColor = [UIColor blackColor];
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents: UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    
    CGRect labelFrame = CGRectMake(20.0, 200.0, 300.0, 100.0);
    UILabel *label = [[UILabel alloc] initWithFrame: labelFrame];
    label.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor linkColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.adjustsFontSizeToFitWidth = NO;
    label.text = @"Нажмите кнопку Далее чтобы перейти на следующий экран";
    [self.view addSubview: label];

    CGRect buttonFrame = CGRectMake(20.0, 330.0, 200.0, 50.0);
    UIButton *button = [UIButton buttonWithType: UIButtonTypeSystem];
    [button setTitle:@"Далее" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor linkColor];
    button.tintColor = [UIColor blackColor];
    button.frame = buttonFrame;
    [button addTarget:self action:@selector(changeViewControllerButtonDidTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)changeViewControllerButtonDidTap:(UIButton *)sender
{
    SecondViewController *nextViewController = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

-(void)segmentedControlValueChanged:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
        self.view.backgroundColor = [UIColor yellowColor];
    }else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}
@end
