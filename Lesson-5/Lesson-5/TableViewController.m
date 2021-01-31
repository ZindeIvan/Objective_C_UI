//
//  TableViewController.m
//  Lesson-5
//
//  Created by Зинде Иван on 1/31/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "TableViewController.h"
#import "ResultsCollectionController.h"

@interface TableViewController ()

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) ResultsCollectionController *resultsController;
@property (nonatomic, strong) NSArray *array;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _array = @[@"Белый", @"Черный", @"Коричневый", @"Серый", @"Красный", @"Оранжевый", @"Желтый", @"Зеленый", @"Голубой", @"Синий", @"Фиолетовый"];
    
    _resultsController = [[ResultsCollectionController alloc] init];
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultsController];
    _searchController.searchResultsUpdater = self;
    self.tableView.tableHeaderView = _searchController.searchBar;
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     
     static NSString *identifier = @"Identifier";
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
     if (!cell) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
     }
     cell.textLabel.text = [_array objectAtIndex:indexPath.row];
 
 return cell;
 }
 

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    if (searchController.searchBar.text) {
        _resultsController.results = [self.array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchController.searchBar.text]];
        [_resultsController update];
    }
}

@end
