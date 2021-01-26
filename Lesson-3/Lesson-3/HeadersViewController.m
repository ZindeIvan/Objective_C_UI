//
//  HeadersViewController.m
//  Lesson-3
//
//  Created by Зинде Иван on 1/25/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "HeadersViewController.h"
#import "DataManager.h"
#import "NewsItem.h"
#import "NewsViewController.h"
#import "HeadersViewTableCell.h"

@interface HeadersViewController ()

@property (strong, nonnull) UITableView *mainTableView;
@property (strong) NSString *cellIdentifier;
@property (strong, nonnull) NSMutableArray *elements;

@end

@implementation HeadersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    [self.view addSubview: self.mainTableView];
    self.cellIdentifier = @"CellIdentifier";
    self.title = @"News";
    
    [[DataManager sharedInstance ] newsWithCompletion:^(NSArray *newsItems){
        if (newsItems.count > 0) {
            self.elements =  [NSMutableArray arrayWithArray:newsItems];
            [self.mainTableView reloadData];
        }
    }];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

    HeadersViewTableCell *headersTableViewCell = [[HeadersViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    if (!headersTableViewCell) {
        headersTableViewCell =  [[HeadersViewTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    NewsItem *news = self.elements[indexPath.row];
    headersTableViewCell.autorLabel.text = news.author;
    headersTableViewCell.titleLabel.text = news.title;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd ";
    NSString *dateString = [dateFormatter stringFromDate: news.publishDate];
    headersTableViewCell.dateLabel.text = dateString;
    return headersTableViewCell;

}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.elements.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if ( indexPath.row >= self.elements.count) {
        return;
    }

    NewsViewController *newsViewController;
    newsViewController = [[NewsViewController alloc] initWithType:self.elements[indexPath.row]];
    [self.navigationController pushViewController:newsViewController animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}
@end
