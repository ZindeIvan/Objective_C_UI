//
//  MenuItem.m
//  Lesson-2
//
//  Created by Зинде Иван on 1/18/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

-(instancetype) initWithName:(NSString *)name andPrice:(NSNumber *)price {
    self = [super init];
    if (self) {
        _name = name;
        _price = price;
    }
    return self;
}

@end
