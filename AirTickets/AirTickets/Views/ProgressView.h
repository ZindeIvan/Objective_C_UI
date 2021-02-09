//
//  ProgressView.h
//  AirTickets
//
//  Created by Зинде Иван on 2/9/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

+ (instancetype)sharedInstance;
- (void)show:(void (^)(void))completion;
- (void)dismiss:(void (^)(void))completion;

@end
