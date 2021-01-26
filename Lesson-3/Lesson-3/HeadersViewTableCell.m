//
//  HeadersViewTableCell.m
//  Lesson-3
//
//  Created by Зинде Иван on 1/26/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "HeadersViewTableCell.h"

@implementation HeadersViewTableCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _autorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5.0, [UIScreen mainScreen].bounds.size.width , 12.0)];
        _autorLabel.textAlignment = NSTextAlignmentLeft;
        _autorLabel.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightSemibold];
        [self.contentView addSubview:_autorLabel];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 20.0, [UIScreen mainScreen].bounds.size.width -35, 12.0)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightRegular];
        [self.contentView addSubview:_titleLabel];
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 35.0, [UIScreen mainScreen].bounds.size.width -35, 12.0)];
        _dateLabel.textAlignment = NSTextAlignmentLeft;
        _dateLabel.font = [UIFont systemFontOfSize:10.0 weight:UIFontWeightLight];
        _dateLabel.textColor = [UIColor linkColor];
        [self.contentView addSubview:_dateLabel];
        
    }

    return self;
}

@end
