//
//  MenuItem.h
//  Lesson-2
//
//  Created by Зинде Иван on 1/18/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *price;

-(instancetype) initWithName:(NSString *)name andPrice:(NSNumber *)price;

@end

NS_ASSUME_NONNULL_END
