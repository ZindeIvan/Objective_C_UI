//
//  DataManager.h
//  Lesson-3
//
//  Created by Зинде Иван on 1/25/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)sharedInstance;
- (void)newsWithCompletion:(void (^)(NSArray *newsItems))completion;

@end

