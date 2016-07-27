//
//  GGNewsArticleBodyView.m
//  GGRDApp
//
//  Created by Kayla Galway on 7/9/16.
//  Copyright © 2016 edu.self. All rights reserved.
//

#import "GGNewsArticleBodyView.h"

@implementation GGNewsArticleBodyView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
    }
    return self;
}


-(instancetype)initWithArticle:(GGNewsArticle *)currentArticle {
    if (self) {
        self = [super init];
        _currentTitleLabel = [UILabel new];
        [self setupArticleBodyViewWithArticle:currentArticle];
    }
    return self;
}

-(void)setupArticleBodyViewWithArticle:(GGNewsArticle *)currentArticle {
    self.currentTitleLabel.text = currentArticle.title;
    [self addSubview:self.currentTitleLabel];
    self.currentTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.currentTitleLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active=YES;
    [self.currentTitleLabel.topAnchor constraintEqualToAnchor:self.topAnchor constant:-25].active=YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
