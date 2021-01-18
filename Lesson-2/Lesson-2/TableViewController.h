//
//  TableViewController.h
//  Lesson-2
//
//  Created by Зинде Иван on 1/17/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum MealType {
    mealTypeDrink,
    mealTypeMainCourse,
    mealTypeDesert
} MealType;

@interface TableViewController : UITableViewController

-(instancetype)initWithType:(MealType)type;

@end
