//
//  CoreDataHelper.h
//  AirTickets
//
//  Created by Зинде Иван on 2/4/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "DataManager.h"
#import "Ticket.h"
#import "MapPrice.h"

@interface CoreDataHelper : NSObject

+ (instancetype)sharedInstance;

- (BOOL)isFavorite:(Ticket *)ticket;
- (NSArray *)favorites:(BOOL)fromMap andAscendingPrice:(BOOL)ascendingPrice;
- (void)addToFavorite:(Ticket *)ticket;
- (void)removeFromFavorite:(Ticket *)ticket;
- (BOOL)isFavoriteMapPrice:(MapPrice *)price;
- (void)addToFavoriteMapPrice:(MapPrice *)price;
- (void)removeFromFavoriteMapPrice:(MapPrice *)price;

@end
