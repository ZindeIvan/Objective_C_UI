//
//  TableViewController.m
//  Lesson-2
//
//  Created by Зинде Иван on 1/17/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "TableViewController.h"
#import "MenuItem.h"
#import "TableViewCell.h"

@interface TableViewController ()

@property (nonatomic) MealType mealType;
@property (strong, nonnull) NSMutableArray *elements;
@property (strong) NSString *cellIdentifier;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureMenuItems];
    self.cellIdentifier = @"menuCellIdentifier";
}

- (instancetype)initWithType:(MealType)type {
    self = [super init];
    if (self) {
        _mealType = type;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.elements.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
    }
    
    MenuItem *item = self.elements[indexPath.row];
    cell.nameLabel.text = item.name;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", item.price];

    return cell;
}

- (void)configureMenuItems {
    
    switch (_mealType) {
        
        case mealTypeDrink:
            self.title = @"Напитки";
            self.elements = [NSMutableArray arrayWithObjects:
                             [[MenuItem alloc] initWithName:@"Сок" andPrice:@12.00],
                             [[MenuItem alloc] initWithName:@"Лимонад" andPrice:@10.00],
                             [[MenuItem alloc] initWithName:@"Чай" andPrice:@5.00],
                             [[MenuItem alloc] initWithName:@"Кофе" andPrice:@11.50],
                              nil];
            break;
        case mealTypeMainCourse:
            self.title = @"Основные блюда";
            self.elements = [NSMutableArray arrayWithObjects:
                             [[MenuItem alloc] initWithName:@"Суп" andPrice:@20.50],
                             [[MenuItem alloc] initWithName:@"Жаркое" andPrice:@25.00],
                             [[MenuItem alloc] initWithName:@"Бургер" andPrice:@15.50],
                             [[MenuItem alloc] initWithName:@"Шашлык" andPrice:@30.00],
                             [[MenuItem alloc] initWithName:@"Пицца" andPrice:@24.50],
                              nil];
            break;
        case mealTypeDesert:
            self.title = @"Десерты";
            self.elements = [NSMutableArray arrayWithObjects:
                             [[MenuItem alloc] initWithName:@"Торт" andPrice:@15.50],
                             [[MenuItem alloc] initWithName:@"Пироженное" andPrice:@10.00],
                             [[MenuItem alloc] initWithName:@"Мороженное" andPrice:@12.50],
                              nil];
            break;
    }
}


@end
