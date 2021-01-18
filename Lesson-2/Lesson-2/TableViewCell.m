//
//  TableViewCell.m
//  Lesson-2
//
//  Created by Зинде Иван on 1/19/21.
//  Copyright © 2021 Зинде Иван. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, [UIScreen mainScreen].bounds.size.width / 2, 44.0)];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
        [self.contentView addSubview:_nameLabel];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2, 0.0, [UIScreen mainScreen].bounds.size.width / 2 - 10, 44.0)];
        _priceLabel.textAlignment = NSTextAlignmentRight;
        _priceLabel.textColor = [UIColor linkColor];
        [self.contentView addSubview:_priceLabel];
    }
    
    return self;
}

@end
