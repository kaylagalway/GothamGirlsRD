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
        _titleLabel = [UILabel new];
        _bodyTextPreviewLabel = [UILabel new];
        _dateLabel = [UILabel new];
        [self setupTableViewCell];
        [self layoutSubviews];
    }
    return self;
}

//You can set a width constraint
//make an NSLayoutConstraint with ConstraintWithItem or VFL
//and set width equal to superview
//with a constant of 0.5

-(void)setupTableViewCell {
    [self addSubview:self.bodyTextPreviewLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.dateLabel];
    [self createDateLabel];
    [self createTitleLabel];
    [self createBodyTextPreviewLabel];
    self.backgroundColor = [UIColor whiteColor];}

-(void)createTitleLabel {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:25].active = YES;
    [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-25].active = YES;
    [self.titleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:25].active = YES;
    
    [self.titleLabel setFont:[UIFont fontWithName:@"Georgia" size:20]];
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.numberOfLines = 5;
    self.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

-(void)createBodyTextPreviewLabel {
    self.bodyTextPreviewLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.bodyTextPreviewLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:25].active = YES;
    [self.bodyTextPreviewLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-25].active = YES;
    [self.bodyTextPreviewLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:10].active = YES;
    
    [self.bodyTextPreviewLabel setFont:[UIFont fontWithName:@"Georgia" size:14]];
    self.bodyTextPreviewLabel.textColor = [UIColor darkGrayColor];
    self.bodyTextPreviewLabel.numberOfLines = 5;
    self.bodyTextPreviewLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

-(void)createDateLabel {
    self.dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.dateLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:25].active = YES;
    [self.dateLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-15].active = YES;
    [self.dateLabel setFont:[UIFont fontWithName:@"Georgia" size:12]];
    self.dateLabel.textColor = [UIColor redColor];
}


//-(void)layoutSubviews {
//    [super layoutSubviews];
//    self.numberLabel.preferredMaxLayoutWidth = self.bounds.size.width;
//}

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
