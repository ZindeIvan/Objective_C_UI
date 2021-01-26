//
//  NewsItem.m
//  Lesson-3
//
//  Created by Зинде Иван on 1/25/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _author = [dictionary valueForKey:@"author"];
        _publishDate = dateFromString([dictionary valueForKey:@"publishedAt"]);
        _title = [dictionary valueForKey:@"title"];
        _imageUrl = [dictionary valueForKey:@"urlToImage"];
        _content = [dictionary valueForKey:@"content"];
        _url = [dictionary valueForKey:@"url"];
    }
    return self;
}

NSDate *dateFromString(NSString *dateString) {
    if (!dateString) { return  nil; }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *correctSrtingDate = [dateString stringByReplacingOccurrencesOfString:@"T" withString:@" "];
    correctSrtingDate = [correctSrtingDate stringByReplacingOccurrencesOfString:@"Z" withString:@" "];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter dateFromString: correctSrtingDate];
}

@end
