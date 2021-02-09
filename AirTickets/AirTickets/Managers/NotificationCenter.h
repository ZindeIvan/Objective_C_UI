//
//  NotificationCenter.h
//  AirTickets
//
//  Created by Зинде Иван on 2/9/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>

typedef struct Notification {
    __unsafe_unretained NSString * _Nullable title;
    __unsafe_unretained NSString * _Nonnull body;
    __unsafe_unretained NSDate * _Nonnull date;
    __unsafe_unretained NSURL * _Nullable imageURL;
    
} Notification;

@protocol NotificationCenterDelegate <NSObject>
- (void)showFavoriteTickets;
@end

@interface NotificationCenter : NSObject
@property (nonatomic, strong) id<NotificationCenterDelegate> _Nullable delegate;
+ (instancetype _Nonnull)sharedInstance;

- (void)registerService;
- (void)sendNotification:(Notification)notification;

Notification NotificationMake(NSString* _Nullable title, NSString* _Nonnull body, NSDate* _Nonnull date, NSURL * _Nullable  imageURL);

@end
