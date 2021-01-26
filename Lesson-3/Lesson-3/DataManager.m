//
//  DataManager.m
//  Lesson-3
//
//  Created by Зинде Иван on 1/25/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "DataManager.h"
#import "NewsItem.h"

#define API_KEY @"911e347c7ff94b3aae62ddb157fdc480"
#define API_URL_HEADLINES @"https://newsapi.org/v2/top-headlines"

@implementation DataManager

+ (instancetype)sharedInstance {
    static DataManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[DataManager alloc] init];
    });
    return instance;
}

- (void)load:(NSString *)urlString withCompletion:(void (^)(id _Nullable result))completion {
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
         completion([NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil]);
        }
    }] resume] ;
}
- (void)newsWithCompletion:(void (^)(NSArray *newItems))completion {
    NSString *urlString = [NSString stringWithFormat:@"%@?country=%@&apiKey=%@", API_URL_HEADLINES, @"us", API_KEY];
    [self load:urlString withCompletion:^(id  _Nullable result) {
        NSDictionary *response = result;
        if (response) {
            NSDictionary *json = [response valueForKey:@"articles"];
            NSMutableArray *array = [NSMutableArray new];
            for (NSDictionary *value in json) {
                NewsItem *newsItem = [[NewsItem alloc ] initWithDictionary:value];
                [array addObject:newsItem];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(array);
            });
        }
    }];
}

@end
