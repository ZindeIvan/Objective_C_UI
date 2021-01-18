//
//  MainViewController.m
//  Lesson-2
//
//  Created by Зинде Иван on 1/17/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewController.h"

@interface MainViewController ()

@property (strong, nonnull) UITableView *mainTableView;
@property (strong) NSString *cellIdentifier;
@property (strong, nonnull) NSMutableArray *elements;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.elements = [NSMutableArray arrayWithObjects:@"Основные блюда", @"Десерты", @"Напитки", nil];
    self.mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    [self.view addSubview: self.mainTableView];
    self.cellIdentifier = @"CellIdentifier";
    self.title = @"Меню";
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *mainTableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    if (!mainTableViewCell) {
        mainTableViewCell =  [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    mainTableViewCell.textLabel.text = self.elements[indexPath.row];
    mainTableViewCell.textLabel.font = [UIFont systemFontOfSize:18.0 weight:UIFontWeightBold];
    return mainTableViewCell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.elements.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ( indexPath.row >= self.elements.count) {
        return;
    }
    
    TableViewController *tableViewController;
    if ([self.elements[indexPath.row]  isEqual: @"Основные блюда"]) {
        tableViewController  = [[TableViewController alloc] initWithType: mealTypeMainCourse];
    } else if ([self.elements[indexPath.row]  isEqual: @"Десерты"]) {
        tableViewController  = [[TableViewController alloc] initWithType: mealTypeDesert];
    } else if ([self.elements[indexPath.row]  isEqual: @"Напитки"]) {
        tableViewController  = [[TableViewController alloc] initWithType: mealTypeDrink];
    }
    [self.navigationController pushViewController:tableViewController animated:YES];
}

@end
