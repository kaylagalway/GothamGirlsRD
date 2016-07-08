//
//  GGNewsTableViewCell.m
//  GGRDApp
//
//  Created by Kayla Galway on 6/21/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsTableViewCell.h"

@implementation GGNewsTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        _numberLabel = [UILabel new];
        [self addSubview:self.numberLabel];
        [self addNumberLabelConstraints];
    }
    return self;
}

-(void)addNumberLabelConstraints {
    self.numberLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.numberLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor
                                                   constant:(self.contentView.frame.size.width) / 10.0].active = YES;
    [self.numberLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor
                                               constant:(self.contentView.frame.size.height) / 10.0].active = YES;
    [self.numberLabel setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    self.numberLabel.numberOfLines = 5;
    self.numberLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
}

//- (void)awakeFromNib {
//
//    {
//        [[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell.xib" owner:self options:nil];
//        self.contentView.frame = self.bounds;
//    }
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
