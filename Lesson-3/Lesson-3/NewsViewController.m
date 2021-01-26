//
//  NewsViewController.m
//  Lesson-3
//
//  Created by Зинде Иван on 1/26/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "NewsViewController.h"
#import <SDWebImage/SDWebImage.h>


@interface NewsViewController ()

@property (weak, nonatomic) NewsItem *newsItem;
@property (strong) NSString *cellIdentifier;

@end

@implementation NewsViewController

-(instancetype)initWithType:(NewsItem *)newsItem {
    self = [super init];
     if (self) {
         _newsItem = newsItem;
     }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect dateLabelFrame = CGRectMake(20.0, 100.0, [UIScreen mainScreen].bounds.size.width - 20.0, 20.0);
    UILabel *dateLabel = [[UILabel alloc] initWithFrame: dateLabelFrame];
    dateLabel.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightSemibold];
    dateLabel.textColor = [UIColor linkColor];
    dateLabel.textAlignment = NSTextAlignmentLeft;
    dateLabel.numberOfLines = 0;
    dateLabel.adjustsFontSizeToFitWidth = YES;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd 'at' HH:mm";
    NSString *dateString = [dateFormatter stringFromDate:_newsItem.publishDate];
    dateLabel.text = dateString;
    [self.view addSubview: dateLabel];
    
    CGRect imageViewFrame = CGRectMake([UIScreen mainScreen].bounds.size.width /2 - 100.0, 120, 200.0, 150.0);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame: imageViewFrame];
    [imageView sd_setImageWithURL:[NSURL URLWithString:_newsItem.imageUrl]
                 placeholderImage:[UIImage imageNamed:@"placeholder"]];
    imageView.image = [UIImage imageNamed:@"apple"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    CGRect titleLabelFrame = CGRectMake(20.0, 270.0, [UIScreen mainScreen].bounds.size.width - 20.0, 80.0);
    UILabel *titleLabel = [[UILabel alloc] initWithFrame: titleLabelFrame];
    titleLabel.font = [UIFont systemFontOfSize:14.0 weight:UIFontWeightSemibold];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.numberOfLines = 0;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.text = _newsItem.title;
    [self.view addSubview: titleLabel];
    
    CGRect textViewframe = CGRectMake(20.0, 350.0, [UIScreen mainScreen].bounds.size.width - 20.0, 150.0);
    UITextView *textView = [[UITextView alloc] initWithFrame: textViewframe];
    textView.textColor = [UIColor blackColor];
    if(![_newsItem.content isEqual:[NSNull null]]) {
        textView.text = _newsItem.content;
    } else {
       textView.text = @"No content found";
    }
    textView.editable = NO;
    [self.view addSubview:textView];
    
    CGRect autorLabelFrame = CGRectMake(20.0, 500.0, [UIScreen mainScreen].bounds.size.width - 50.0, 20.0);
    UILabel *autorLabel = [[UILabel alloc] initWithFrame: autorLabelFrame];
    autorLabel.font = [UIFont systemFontOfSize:13.0 weight:UIFontWeightMedium];
    autorLabel.textColor = [UIColor blackColor];
    autorLabel.textAlignment = NSTextAlignmentRight;
    autorLabel.numberOfLines = 0;
    autorLabel.adjustsFontSizeToFitWidth = YES;
    autorLabel.text = _newsItem.author;
    [self.view addSubview: autorLabel];
    
}

@end
