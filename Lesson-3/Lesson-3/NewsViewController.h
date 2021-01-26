//
//  NewsViewController.h
//  Lesson-3
//
//  Created by Зинде Иван on 1/26/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsItem.h"

@interface NewsViewController : UIViewController

-(instancetype)initWithType:(NewsItem *)newsItem;

@end
