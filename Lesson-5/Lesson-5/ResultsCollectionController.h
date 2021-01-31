//
//  ResultsCollectionController.h
//  Lesson-5
//
//  Created by Зинде Иван on 1/31/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsCollectionController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *results;
- (void)update;

@end
