//
//  ResultsCollectionController.m
//  Lesson-5
//
//  Created by Зинде Иван on 1/31/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "ResultsCollectionController.h"

@interface ResultsCollectionController ()

@property (strong, nonatomic) NSString *identifier;

@end

@implementation ResultsCollectionController

static NSString * const reuseIdentifier = @"Cell";

- (void) update {
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _identifier = @"identifier";
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = 5.0;
    layout.minimumInteritemSpacing = 5.0;
    layout.itemSize = CGSizeMake(100.0, 100.0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    _collectionView.dataSource = self;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:_identifier];
    
    [self.view addSubview:_collectionView];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _results.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_identifier forIndexPath:indexPath];
    
    cell.backgroundColor = [self getColorFromResultsIndexPath:indexPath];
    return cell;
}
-(UIColor *)getColorFromResultsIndexPath:(NSIndexPath *)indexPath {
    
    NSString *resultsItem = [_results objectAtIndex:indexPath.row];
    if ([resultsItem  isEqual: @"Белый"]) {
        return [UIColor whiteColor];
    } else if ([resultsItem  isEqual: @"Зеленый"]) {
        return [UIColor greenColor];
    } else if ([resultsItem  isEqual: @"Красный"]) {
        return [UIColor redColor];
    } else if ([resultsItem  isEqual: @"Черный"]) {
        return [UIColor blackColor];
    } else if ([resultsItem  isEqual: @"Серый"]) {
        return [UIColor grayColor];
    } else if ([resultsItem  isEqual: @"Синий"]) {
        return [UIColor blueColor];
    } else if ([resultsItem  isEqual: @"Желтый"]) {
        return [UIColor yellowColor];
    } else if ([resultsItem  isEqual: @"Оранжевый"]) {
        return [UIColor orangeColor];
    } else if ([resultsItem  isEqual: @"Коричневый"]) {
        return [UIColor brownColor];
    } else if ([resultsItem  isEqual: @"Голубой"]) {
        return [UIColor linkColor];
    } else if ([resultsItem  isEqual: @"Фиолетовый"]) {
        return [UIColor magentaColor];
    } else {
        return [UIColor grayColor];
    }
}

@end
