//
//  APIManager.h
//  AirTickets
//
//  Created by Зинде Иван on 2/4/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "DataManager.h"

@interface APIManager : NSObject

+ (instancetype)sharedInstance;
- (void)cityForCurrentIP:(void (^)(City *city))completion;
- (void)ticketsWithRequest:(SearchRequest)request withCompletion:(void (^)(NSArray *tickets))completion;
- (void)mapPricesFor:(City *)origin withCompletion:(void (^)(NSArray *prices))completion;

@end
