//
//  NewsItem.h
//  Lesson-3
//
//  Created by Зинде Иван on 1/25/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *publishDate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
