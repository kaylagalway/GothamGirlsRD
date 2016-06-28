//
//  GGNewsTableViewCell.m
//  GGRDApp
//
//  Created by Kayla Galway on 6/21/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsTableViewCell.h"

@implementation GGNewsTableViewCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self awakeFromNib];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self awakeFromNib];
    }
    return self;
}

- (void)awakeFromNib {
    
    {
        [[NSBundle mainBundle] loadNibNamed:@"NewsTableViewCell.xib" owner:self options:nil];
        self.contentView.frame = self.bounds;
    }
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
