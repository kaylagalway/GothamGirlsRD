//
//  GGNewsTableViewCell.h
//  GGRDApp
//
//  Created by Kayla Galway on 6/21/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGNewsTableViewCell : UITableViewCell
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UILabel *bodyTextPreviewLabel;
@property (strong, nonatomic) UIButton *readMoreButton;


@end
